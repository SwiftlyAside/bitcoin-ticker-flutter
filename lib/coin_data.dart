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
  Future getCoinData(String selectedCurrency) async {
    //TODO 4: Use a for loop here to loop through the cryptoList and request the data for each of them in turn.
    //TODO 5: Return a Map of the results instead of a single value.
    Response response = await get(
        Uri.parse('$coinAPIURL/BTC/$selectedCurrency?apikey=$apiKey'));
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      return decodedData['rate'];
    } else {
      print(response.statusCode);
      throw 'Problem with the get request.';
    }
  }
}
