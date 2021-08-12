import 'package:flutter/material.dart';
import 'package:restaurant_app/model/restaurant.dart';
import 'package:restaurant_app/screens/detail/components/tab_view.dart';
import '../../../constants.dart';
import 'header.dart';

class Body extends StatelessWidget {
  final Restaurant restaurant;

  const Body({Key key, this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Header(size: size, restaurant: restaurant),
          SizedBox(height: kDefaultPadding / 2),
          TabView(
            restaurant: restaurant,
            size: size,
          ),
          SizedBox(height: kDefaultPadding),
        ],
      ),
    );
  }
}
