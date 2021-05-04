import 'dart:convert';

import 'package:http/http.dart';

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
  'KRW',
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

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = '47418652-566F-4111-92DC-696FA28C6726';

class CoinData {
  Future getCoinData() async {
    Response response =
        await get(Uri.parse('$coinAPIURL/BTC/USD?apikey=$apiKey'));

    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      return decodedData['rate'];
    } else {
      print(response.statusCode);
      throw 'Problem with the get request.';
    }
  }
}
