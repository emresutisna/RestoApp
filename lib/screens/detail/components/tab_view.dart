import 'package:flutter/widgets.dart';
import 'package:restaurant_app/model/restaurant.dart';
import 'package:restaurant_app/screens/detail/components/description_view.dart';
import 'package:restaurant_app/screens/detail/components/food.dart';
import 'package:restaurant_app/screens/detail/components/tabs.dart';

import 'drink.dart';

class TabView extends StatefulWidget {
  final Restaurant restaurant;
  final Size size;

  const TabView({Key key, this.restaurant, this.size}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {
  int activeTabNum = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Tabs(
          press: (value) {
            setState(() {
              activeTabNum = value;
            });
          },
          size: widget.size,
        ),
        Container(
          child: activeTabNum == 0
              ? DescriptionView(
                  description: widget.restaurant.description,
                )
              : activeTabNum == 1
                  ? FoodView(
                      foods: widget.restaurant.menus.foods,
                    )
                  : DrinkView(
                      drinks: widget.restaurant.menus.drinks,
                    ),
        ),
      ],
    );
  }
}
