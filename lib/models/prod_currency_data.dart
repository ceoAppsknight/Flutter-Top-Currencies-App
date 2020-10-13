import 'dart:convert';
import 'package:http/http.dart' as http;

import './currency_model.dart';
import '../exception/http_exception.dart';

class ProdCurrencyData implements CurrencyRepository {
  String currencyURL =
      "https://fcsapi.com/api-v2/forex/list?type=forex&top_symbol=1&access_key=wCCyD23CrQ44RVrAapHPyqBalgT0kHCsUncOBeo0Wop2FriwZx";
  @override
  Future<List<CurrencyModel>> fetchAllCurrencies() async {
    http.Response response = await http.get(currencyURL);
    final List responseBody = (jsonDecode(response.body))['response'];
    final statusCode = response.statusCode;
    if (statusCode != 200 || responseBody == null) {
      throw HttpException(
        'An error ocurred : [Status Code : $statusCode]',
      );
    }
    return responseBody.map((e) => CurrencyModel.fromMap(e)).toList();
  }
}
