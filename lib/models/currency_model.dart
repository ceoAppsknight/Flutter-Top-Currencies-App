import 'dart:async';

class CurrencyModel {
  String id;
  String name;
  String symbol;

  CurrencyModel({
    this.id,
    this.name,
    this.symbol,
  });

  CurrencyModel.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        symbol = map['symbol'];
}

abstract class CurrencyRepository {
  Future<List<CurrencyModel>> fetchAllCurrencies();
}
