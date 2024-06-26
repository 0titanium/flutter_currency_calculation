import 'dart:convert';

import 'package:flutter_currency_calculation/data/dto/currency_dto.dart';
import 'package:http/http.dart' as http;

class CurrencyApi {
  final _key = '4898632285f6e84f28d68612';

  final _url = 'https://v6.exchangerate-api.com/v6/';

  Future<CurrencyDto> getCurrency(String query) async {
    final http.Response response =
        await http.get(Uri.parse('$_url$_key/latest/$query'));

    final json = jsonDecode(response.body);

    return CurrencyDto.fromJson(json);
  }
}
