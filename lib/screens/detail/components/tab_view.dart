import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/detail_provider.dart';
import 'package:restaurant_app/screens/detail/components/description_view.dart';
import 'package:restaurant_app/screens/detail/components/food.dart';
import 'package:restaurant_app/screens/detail/components/review.dart';
import 'package:restaurant_app/screens/detail/components/tabs.dart';

import '../../../common/enums.dart';
import 'drink.dart';

class TabView extends StatefulWidget {
  final Size size;

  const TabView({Key key, this.size}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {
  int _activeTabNum = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<DetailProvider>(
      builder: (context, state, _) {
        if (state.state == ResultState.Loading) {
          return Center(child: CircularProgressIndicator());
        } else if (state.state == ResultState.HasData) {
          return Column(
            children: [
              Tabs(
                press: (value) {
                  setState(() {
                    _activeTabNum = value;
                  });
                },
                size: widget.size,
              ),
              Container(
                child: _activeTabNum == 0
                    ? DescriptionView(
                        description: state.result.restaurant.description,
                      )
                    : _activeTabNum == 1
                        ? FoodView(
                            foods: state.result.restaurant.menus.foods,
                          )
                        : _activeTabNum == 2
                            ? DrinkView(
                                drinks: state.result.restaurant.menus.drinks,
                              )
                            : ReviewWidget(
                                reviews:
                                    state.result.restaurant.customerReviews,
                              ),
              ),
            ],
          );
        } else if (state.state == ResultState.NoData) {
          return Center(child: Text(state.message));
        } else if (state.state == ResultState.Error) {
          return Center(child: Text(state.message));
        } else {
          return Center(child: Text(''));
        }
      },
    );
  }
}
