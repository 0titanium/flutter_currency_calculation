import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_currency_calculation/presentation/main_screen_view_model.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

List<String> searchCountries = ['KRW', 'USD'];
List<String> resultCountries = [ 'USD', 'KRW','JPY'];

class _MainScreenState extends State<MainScreen> {
  String countriesUpValue = searchCountries.first;
  String countriesDownValue = resultCountries.first;
  final  _searchTextEditingController = TextEditingController();
  final _resultTextEditingController = TextEditingController();
  double? searchCountryValueInfo;
  double _number1 = 0;

  @override
  void initState() {
    super.initState();
    _searchTextEditingController.text = '';
    _resultTextEditingController.text = '';
  }
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MainScreenViewModel>();



    return Scaffold(
      appBar: AppBar(
        title: const Text('Currency'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 200,
                    height: 40,
                    child: TextFormField(
                      controller: _searchTextEditingController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly], //숫자 입력만 가능
                      decoration: InputDecoration(hintText: '숫자를 입력하세요'),
                      onChanged: (value){
                        setState(() {
                          _number1 = double.tryParse(value)  ?? 0;
                          // _resultTextEditingController.text = (_number1 * viewModel.onSearch(USD)).toString();
                          _resultTextEditingController.text = (_number1 * 3).toString();

                        });
                      },

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
