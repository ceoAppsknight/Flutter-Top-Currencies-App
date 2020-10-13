import './currency_model.dart';

class MockCurrencyData implements CurrencyRepository {
  @override
  Future<List<CurrencyModel>> fetchAllCurrencies() {
    return Future.value(_currencies);
  }
}

var _currencies = [
  CurrencyModel(
    id: '1',
    name: 'Euro US Dollar',
    symbol: "EUR\/USD",
  ),
  CurrencyModel(
    id: '2',
    name: 'Euro Swiss Franc',
    symbol: "EUR\/CHF",
  ),
  CurrencyModel(
    id: '3',
    name: 'Euro Japanese Yen',
    symbol: "EUR\/JPY",
  ),
];
