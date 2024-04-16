import 'package:flutter/material.dart';
import 'package:flutter_currency_calculation/data/data_source/currency_api.dart';
import 'package:flutter_currency_calculation/data/repository/currency_repo_impl.dart';
import 'package:flutter_currency_calculation/data/repository/currency_repository.dart';
import 'package:flutter_currency_calculation/presentation/main_screen.dart';
import 'package:flutter_currency_calculation/presentation/main_screen_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider(
        create: (_) => MainScreenViewModel(
            currencyRepository: CurrencyRepositoryImpl(CurrencyApi())),
        child: MainScreen(),
      ),
    );
  }
}
