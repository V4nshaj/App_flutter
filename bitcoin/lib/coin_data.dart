import 'dart:convert';

import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const apiKey = 'F24F9858-4F7E-45A6-861B-3AB71FD4BB6B';

class CoinData {
  int a = 10;
  static Future<dynamic> getRate(String currency, String coin) async {
    //helps in taking
    //async
    var url =
        'https://rest.coinapi.io/v1/exchangerate/$coin/$currency?apikey=$apiKey';

    var data = await http.get(Uri.parse(
        url)); //uri helps to convert url into different package of uri
    //http request
    print(jsonDecode(data.body)); //jsonDecode as it converts json into map
    var d = jsonDecode(data.body);
    return (d['rate']);
  }
}
