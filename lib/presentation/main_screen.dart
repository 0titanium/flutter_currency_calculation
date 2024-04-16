import 'package:flutter/material.dart';
import 'package:flutter_currency_calculation/presentation/main_screen_view_model.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

List<String> searchCountries = ['KRW', 'USD'];
List<String> resultCountries = ['KRW', 'USD'];

class _MainScreenState extends State<MainScreen> {
  String countriesUpValue = searchCountries.first;
  String countriesDownValue = resultCountries.first;

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MainScreenViewModel>();

    final _searchTextEdtingController = TextEditingController();
    final _resultTextEditingController = TextEditingController();

    double? searchCountryValueInfo;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Currency'),
      ),
      body: Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    width: 200,
                    height: 40,
                    child: TextField(
                      controller: _searchTextEdtingController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(hintText: '숫자를 입력하세요'),
                    ),
                  ),
                  DropdownButton(
                    value: countriesUpValue,
                    items: searchCountries
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        countriesUpValue = value!;
                      });

                      viewModel.onSearch(value!);
                      searchCountryValueInfo = viewModel
                          .currencyInfo!.conversionRates[value] as double;
                      _resultTextEditingController.text = ''; // 계산 결과
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 200,
                    height: 40,
                    child: TextField(
                      controller: _resultTextEditingController,
                      decoration: InputDecoration(hintText: '숫자를 입력하세요'),
                    ),
                  ),
                  DropdownButton(
                    value: countriesDownValue,
                    items: resultCountries
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        countriesDownValue = value!;
                      });
                      viewModel.onSearch(value!);
                      _resultTextEditingController.text =
                          searchCountryValueInfo.toString();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
