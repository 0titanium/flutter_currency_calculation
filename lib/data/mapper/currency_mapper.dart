import 'package:flutter_currency_calculation/data/dto/currency_dto.dart';
import 'package:flutter_currency_calculation/data/model/currency.dart';

extension ToCurrency on CurrencyDto {
  Currency toCurrency() {
    return Currency(
      timeLastUpdateUtc: timeLastUpdateUtc ?? '',
      conversionRates: ConversionRates(),
    );
  }
}
