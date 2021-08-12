import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:restaurant_app/model/drink.dart';

class DrinkView extends StatelessWidget {
  final List<Drinks> drinks;

  DrinkView({Key key, this.drinks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(8),
          itemCount: drinks.length,
          itemBuilder: (BuildContext context, int index) {
            return _buildDrinkItem(context, drinks[index]);
          }),
    );
  }
}

Widget _buildDrinkItem(BuildContext context, Drinks drink) {
  return Card(
    child: ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      title: Text(drink.name),
      trailing: Icon(Icons.chevron_right),
    ),
  );
}
