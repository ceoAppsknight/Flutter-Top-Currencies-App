import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';

import '../models/currency_model.dart';

class TopCurrencyListBuilder extends StatelessWidget {
  const TopCurrencyListBuilder({
    Key key,
    @required List<CurrencyModel> currencies,
    @required RandomColor randomColor,
  })  : _currencies = currencies,
        _randomColor = randomColor,
        super(key: key);

  final List<CurrencyModel> _currencies;
  final RandomColor _randomColor;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(10),
      itemCount: _currencies.length,
      itemBuilder: (context, index) => ListTile(
        leading: CircleAvatar(
          backgroundColor: _randomColor.randomColor(),
          child: Text(
            _currencies[index].symbol.substring(4),
          ),
        ),
        title: Text(
          _currencies[index].name,
        ),
        subtitle: Text(
          _currencies[index].symbol,
        ),
      ),
      separatorBuilder: (context, index) => Divider(
        color: Color(0xff262C72),
        thickness: 2.5,
      ),
    );
  }
}
