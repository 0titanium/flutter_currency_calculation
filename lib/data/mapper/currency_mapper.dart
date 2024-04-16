import 'package:flutter_currency_calculation/data/dto/currency_dto.dart';
import 'package:flutter_currency_calculation/data/model/currency.dart';

extension ToCurrency on CurrencyDto {
  Currency toCurrency() {
    return Currency(
      timeLastUpdateUtc: timeLastUpdateUtc ?? '',
      conversionRates: conversionRates!.toJson() as Map<String, num>,
    );
  }
}

// Map<String, num> toMap(Map<String, dynamic> map) {
//   Map<String, num> conversionRatesMap = {};
//
//   map.forEach((key, value) {
//     conversionRatesMap[key] = value;
//   });
//
//   return conversionRatesMap;
// }
