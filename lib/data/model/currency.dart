import 'package:flutter_currency_calculation/data/dto/currency_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'currency.freezed.dart';

part 'currency.g.dart';

@freezed
class Currency with _$Currency {
  const factory Currency({
    required String timeLastUpdateUtc,
    required ConversionRates conversionRates,
  }) = _Currency;

  factory Currency.fromJson(Map<String, Object?> json) =>
      _$CurrencyFromJson(json);
}
