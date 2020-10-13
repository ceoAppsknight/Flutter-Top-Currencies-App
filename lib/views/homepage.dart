import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';

import '../widgets/currency_list_builder.dart';
import '../presenters/currency_presenter.dart';
import '../models/currency_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> implements CurrencyViewContract {
  CurrencyListPresenter _presenter;
  List<CurrencyModel> _currencies;
  RandomColor _randomColor = RandomColor();
  bool _isLoading;
  bool _isError = false;

  _HomePageState() {
    _presenter = CurrencyListPresenter(this);
  }

  @override
  void initState() {
    _isLoading = true;
    _presenter.loadCurrencies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var alertDialog = AlertDialog(
      content: Text('An Error Occurred. Try to restart the app'),
      elevation: 5.0,
      title: Text('Error!'),
      actions: [
        FlatButton(
          onPressed: () {
            setState(() {
              _isError = false;
              _isLoading = true;
            });
            Navigator.of(context).pop();
          },
          child: Text('OK'),
        )
      ],
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Top Currencies'),
      ),
      body: (_isLoading || _isError)
          ? _isError
              ? alertDialog
              : Center(
                  child: CircularProgressIndicator(),
                )
          : TopCurrencyListBuilder(
              currencies: _currencies, randomColor: _randomColor),
    );
  }

  @override
  void onLoadCurrenciesError() {
    setState(() {
      _isError = true;
      print('Error Detected');
    });
  }

  @override
  void onLoadCurrencyComplete(List<CurrencyModel> items) {
    setState(() {
      _currencies = items;
      _isLoading = false;
    });
  }
}
