import 'package:flutter/material.dart';
import 'package:flutter_currency_calculation/presentation/main_screen_view_model.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MainScreenViewModel>();

    final _searchTextEdtingController = TextEditingController();
    final _resultTextEditingController = TextEditingController();

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
                      decoration: InputDecoration(hintText: '숫자를 입력하세요'),
                    ),
                  ),
                  DropdownButton(
                    items: const [
                      DropdownMenuItem(child: Text('USD'), value: 'USD'),
                      DropdownMenuItem(child: Text('KRW'), value: 'KRW'),
                    ],
                    onChanged: (String? value) {
                      valueCountryInfo = viewModel.onSearch(value!);
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
                    items: const [
                      DropdownMenuItem(child: Text('USD'), value: 'USD'),
                      DropdownMenuItem(child: Text('KRW'), value: 'KRW'),
                    ],
                    onChanged: (String? value) {
                      viewModel.onSearch(value!);
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

// void dropdownCallback(String? selectedValue) {
//   if (selectedValue is String) {
//     setState(() {
//       _dropdownValue = selectedValue;
//     });
// }
// }
}
