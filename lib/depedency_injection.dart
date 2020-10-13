import './models/mock_currency_data.dart';
import './models/prod_currency_data.dart';
import './models/currency_model.dart';

enum Mode { MOCK, PROD }

class DependencyInjection {
  static final _singleton = DependencyInjection._internal();

  static Mode _mode;

  static void selectMode(Mode mode) {
    _mode = mode;
  }

  factory DependencyInjection() => _singleton;

  DependencyInjection._internal();

  static CurrencyRepository get currencyRepository {
    switch (_mode) {
      case Mode.MOCK:
        return MockCurrencyData();
      default:
        return ProdCurrencyData();
    }
  }
}
