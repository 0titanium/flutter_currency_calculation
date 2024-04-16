import 'package:flutter/cupertino.dart';
import 'package:flutter_currency_calculation/data/dto/currency_dto.dart';
import 'package:flutter_currency_calculation/data/model/currency.dart';
import 'package:flutter_currency_calculation/data/repository/currency_repository.dart';

class MainScreenViewModel with ChangeNotifier {
  final CurrencyRepository _currencyRepository;

  MainScreenViewModel({
    required CurrencyRepository currencyRepository,
  }) : _currencyRepository = currencyRepository;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Currency currencyInfo =
      Currency(timeLastUpdateUtc: '', conversionRates: ConversionRates());

  void onSearch(String query) async {
    _isLoading = true;
    notifyListeners();
    currencyInfo = await _currencyRepository.getCurrency(query);
    notifyListeners();
  }
}
