import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:restaurant_app/model/food.dart';

class FoodView extends StatelessWidget {
  final List<Foods> foods;

  FoodView({Key key, this.foods}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(8),
          itemCount: foods.length,
          itemBuilder: (BuildContext context, int index) {
            return _buildFoodItem(context, foods[index]);
          }),
    );
  }
}

Widget _buildFoodItem(BuildContext context, Foods food) {
  return Card(
    child: ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      title: Text(food.name),
      trailing: Icon(Icons.chevron_right),
    ),
  );
}
