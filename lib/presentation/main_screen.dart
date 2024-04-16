import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Currency'),
      ),
      body: Container(
        child: SizedBox(
          width:  150,
          child: DropdownButton(
            items: const [
              DropdownMenuItem(child: Text('USD'), value: 'USD'),
              DropdownMenuItem(child: Text('KRW'), value: 'KRW'),
            ],
            onChanged: (String? value) {},
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
