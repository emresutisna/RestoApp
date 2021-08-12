import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:restaurant_app/model/restaurant.dart';

import 'components/body.dart';

class DetailScreen extends StatelessWidget {
  final Restaurant restaurant;
  const DetailScreen({Key key, this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(restaurant: restaurant),
    );
  }
}
