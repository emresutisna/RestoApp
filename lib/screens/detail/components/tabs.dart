import 'package:flutter/material.dart';
import 'package:restaurant_app/constants.dart';

class Tabs extends StatelessWidget {
  final Size size;
  const Tabs({
    Key key,
    @required this.press,
    @required this.size,
  }) : super(key: key);

  final ValueChanged<int> press;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(kDefaultPadding / 2),
      padding: EdgeInsets.all(kDefaultPadding / 4),
      width: size.width, // 80%
      decoration: BoxDecoration(
        color: kSecondaryColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [kDefaultShadow],
      ),
      child: DefaultTabController(
        length: 4,
        child: TabBar(
          indicator: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(12),
          ),
          indicatorColor: kPrimaryColor,
          labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          onTap: press,
          tabs: [
            Tab(text: "Overview"),
            Tab(text: "Food"),
            Tab(text: "Drink"),
            Tab(text: "Review"),
          ],
        ),
      ),
    );
  }
}
