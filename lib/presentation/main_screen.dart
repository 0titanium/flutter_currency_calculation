import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _textEdtingController = TextEditingController();
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
                      controller: _textEdtingController,
                        decoration: InputDecoration(
                          hintText: '숫자를 입력하세요'
                        ),
                    ),
                  ),
                  DropdownButton(
                    items: const [
                      DropdownMenuItem(child: Text('USD'), value: 'USD'),
                      DropdownMenuItem(child: Text('KRW'), value: 'KRW'),
                    ],
                    onChanged: (String? value) {},
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
