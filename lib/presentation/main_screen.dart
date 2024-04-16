import 'package:flutter/material.dart';
import 'package:flutter_currency_calculation/presentation/main_screen_view_model.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

List<String> searchCountries = [
  'KRW',
  'AED',
  'AFN',
  'ALL',
  'AMD',
  'ANG',
  'AOA',
  'ARS',
  'AUD',
  'AWG',
  'AZN',
  'BAM',
  'BBD',
  'BDT',
  'BGN',
  'BHD',
  'BIF',
  'BMD',
  'BND',
  'BOB',
  'BRL',
  'BSD',
  'BTN',
  'BWP',
  'BYN',
  'BZD',
  'CAD',
  'CDF',
  'CHF',
  'CLP',
  'CNY',
  'COP',
  'CRC',
  'CUP',
  'CVE',
  'CZK',
  'DJF',
  'DKK',
  'DOP',
  'DZD',
  'EGP',
  'ERN',
  'ETB',
  'EUR',
  'FJD',
  'FKP',
  'FOK',
  'GBP',
  'GEL',
  'GGP',
  'GHS',
  'GIP',
  'GMD',
  'GNF',
  'GTQ',
  'GYD',
  'HKD',
  'HNL',
  'HRK',
  'HTG',
  'HUF',
  'IDR',
  'ILS',
  'IMP',
  'INR',
  'IQD',
  'IRR',
  'ISK',
  'JEP',
  'JMD',
  'JOD',
  'JPY',
  'KES',
  'KGS',
  'KHR',
  'KID',
  'KMF',
  'KWD',
  'KYD',
  'KZT',
  'LAK',
  'LBP',
  'LKR',
  'LRD',
  'LSL',
  'LYD',
  'MAD',
  'MDL',
  'MGA',
  'MKD',
  'MMK',
  'MNT',
  'MOP',
  'MRU',
  'MUR',
  'MVR',
  'MWK',
  'MXN',
  'MYR',
  'MZN',
  'NAD',
  'NGN',
  'NIO',
  'NOK',
  'NPR',
  'NZD',
  'OMR',
  'PAB',
  'PEN',
  'PGK',
  'PHP',
  'PKR',
  'PLN',
  'PYG',
  'QAR',
  'RON',
  'RSD',
  'RUB',
  'RWF',
  'SAR',
  'SBD',
  'SCR',
  'SDG',
  'SEK',
  'SGD',
  'SHP',
  'SLE',
  'SLL',
  'SOS',
  'SRD',
  'SSP',
  'STN',
  'SYP',
  'SZL',
  'THB',
  'TJS',
  'TMT',
  'TND',
  'TOP',
  'TRY',
  'TTD',
  'TVD',
  'TWD',
  'TZS',
  'UAH',
  'UGX',
  'USD',
  'UYU',
  'UZS',
  'VES',
];
List<String> resultCountries = [
  'USD',
  'AED',
  'AFN',
  'ALL',
  'AMD',
  'ANG',
  'AOA',
  'ARS',
  'AUD',
  'AWG',
  'AZN',
  'BAM',
  'BBD',
  'BDT',
  'BGN',
  'BHD',
  'BIF',
  'BMD',
  'BND',
  'BOB',
  'BRL',
  'BSD',
  'BTN',
  'BWP',
  'BYN',
  'BZD',
  'CAD',
  'CDF',
  'CHF',
  'CLP',
  'CNY',
  'COP',
  'CRC',
  'CUP',
  'CVE',
  'CZK',
  'DJF',
  'DKK',
  'DOP',
  'DZD',
  'EGP',
  'ERN',
  'ETB',
  'EUR',
  'FJD',
  'FKP',
  'FOK',
  'GBP',
  'GEL',
  'GGP',
  'GHS',
  'GIP',
  'GMD',
  'GNF',
  'GTQ',
  'GYD',
  'HKD',
  'HNL',
  'HRK',
  'HTG',
  'HUF',
  'IDR',
  'ILS',
  'IMP',
  'INR',
  'IQD',
  'IRR',
  'ISK',
  'JEP',
  'JMD',
  'JOD',
  'JPY',
  'KES',
  'KGS',
  'KHR',
  'KID',
  'KMF',
  'KRW',
  'KWD',
  'KYD',
  'KZT',
  'LAK',
  'LBP',
  'LKR',
  'LRD',
  'LSL',
  'LYD',
  'MAD',
  'MDL',
  'MGA',
  'MKD',
  'MMK',
  'MNT',
  'MOP',
  'MRU',
  'MUR',
  'MVR',
  'MWK',
  'MXN',
  'MYR',
  'MZN',
  'NAD',
  'NGN',
  'NIO',
  'NOK',
  'NPR',
  'NZD',
  'OMR',
  'PAB',
  'PEN',
  'PGK',
  'PHP',
  'PKR',
  'PLN',
  'PYG',
  'QAR',
  'RON',
  'RSD',
  'RUB',
  'RWF',
  'SAR',
  'SBD',
  'SCR',
  'SDG',
  'SEK',
  'SGD',
  'SHP',
  'SLE',
  'SLL',
  'SOS',
  'SRD',
  'SSP',
  'STN',
  'SYP',
  'SZL',
  'THB',
  'TJS',
  'TMT',
  'TND',
  'TOP',
  'TRY',
  'TTD',
  'TVD',
  'TWD',
  'TZS',
  'UAH',
  'UGX',
  'UYU',
  'UZS',
  'VES',
];

class _MainScreenState extends State<MainScreen> {
  String countriesUpValue = searchCountries.first;
  String countriesDownValue = resultCountries.first;
  final _searchTextEditingController = TextEditingController();
  final _resultTextEditingController = TextEditingController();
  double _number1 = 0.0;
  double _number2 = 0.0;

  @override
  void initState() {
    super.initState();
    _searchTextEditingController.text = '';
    _resultTextEditingController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MainScreenViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Currency'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 200,
                    height: 40,
                    child: TextFormField(
                      controller: _searchTextEditingController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(hintText: '숫자를 입력하세요'),
                      onChanged: (value) {
                        setState(() {
                          _number1 = double.tryParse(value) ?? 0.0;
                          viewModel.onSearch(countriesUpValue).then((_) {
                            // print(viewModel.currencyInfo!.conversionRates);
                            _resultTextEditingController.text = (_number1 *
                                    viewModel.currencyInfo!
                                        .conversionRates[countriesDownValue]!)
                                .toString();
                            _number2 = double.parse(_resultTextEditingController.text);
                          });
                        });
                      },
                    ),
                  ),
                  DropdownButton(
                    value: countriesUpValue,
                    items: searchCountries
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        countriesUpValue = value!;
                        viewModel.onSearch(countriesUpValue).then((_) {
                          // print(viewModel.currencyInfo!.conversionRates);
                          _resultTextEditingController.text = (_number1 *
                                  viewModel.currencyInfo!
                                      .conversionRates[countriesDownValue]!)
                              .toString();
                        });
                      });

                      // viewModel.onSearch(value!);
                      // searchCountryValueInfo = viewModel
                      //     .currencyInfo!.conversionRates[value] as double;
                      // _resultTextEditingController.text = ''; // 계산 결과
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 200,
                    height: 40,
                    child: TextFormField(
                      controller: _resultTextEditingController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(hintText: '숫자를 입력하세요'),
                      onChanged: (value) {
                        setState(() {
                          _number2 = double.tryParse(value) ?? 0.0;
                          viewModel.onSearch(countriesDownValue).then((_) {
                            // print(viewModel.currencyInfo!.conversionRates);
                            _searchTextEditingController.text = (_number2 *
                                    viewModel.currencyInfo!
                                        .conversionRates[countriesUpValue]!)
                                .toString();
                            _number1 = double.parse(_searchTextEditingController.text);
                          });
                        });
                      },
                    ),
                  ),
                  DropdownButton(
                    value: countriesDownValue,
                    items: resultCountries
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        countriesDownValue = value!;
                        viewModel.onSearch(countriesDownValue).then((_) {
                          // print(viewModel.currencyInfo!.conversionRates);
                          _searchTextEditingController.text = (_number2 *
                              viewModel.currencyInfo!
                                  .conversionRates[countriesUpValue]!)
                              .toString();
                        });
                      });
                      // viewModel.onSearch(value!);
                      // _resultTextEditingController.text =
                      //     searchCountryValueInfo.toString();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
