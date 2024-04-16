import 'package:flutter_currency_calculation/data/data_source/currency_api.dart';
import 'package:flutter_currency_calculation/data/mapper/currency_mapper.dart';
import 'package:flutter_currency_calculation/data/model/currency.dart';
import 'package:flutter_currency_calculation/data/repository/currency_repository.dart';

class CurrencyRepositoryImpl implements CurrencyRepository {
  final CurrencyApi _currencyApi;

  CurrencyRepositoryImpl(this._currencyApi);

  @override
  Future<Currency> getCurrency(String query) async {
    final currencyDto = await _currencyApi.getCurrency(query);

    return currencyDto.toCurrency();
  }
}
