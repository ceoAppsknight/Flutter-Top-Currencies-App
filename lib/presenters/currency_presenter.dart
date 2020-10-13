import '../depedency_injection.dart';
import '../models/currency_model.dart';

abstract class CurrencyViewContract {
  void onLoadCurrencyComplete(List<CurrencyModel> items);
  void onLoadCurrenciesError();
}

class CurrencyListPresenter {
  CurrencyViewContract _view;
  CurrencyRepository _repository;

  CurrencyListPresenter(this._view) {
    _repository = DependencyInjection.currencyRepository;
  }

  void loadCurrencies() {
    _repository
        .fetchAllCurrencies()
        .then((c) => _view.onLoadCurrencyComplete(c))
        .catchError((onError) => _view.onLoadCurrenciesError());
  }
}
