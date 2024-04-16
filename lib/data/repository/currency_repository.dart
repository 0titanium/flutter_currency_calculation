import 'package:flutter_currency_calculation/data/model/currency.dart';

abstract interface class CurrencyRepository {
  Future<Currency> getCurrency(String query);
}
