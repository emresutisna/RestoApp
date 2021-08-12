import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/common/constants.dart';
import 'package:restaurant_app/widgets/empty_view.dart';
import 'package:restaurant_app/provider/database_provider.dart';
import 'package:restaurant_app/screens/favorite/components/favorite_card.dart';

import '../../../common/enums.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(
      builder: (context, provider, child) {
        if (provider.state == ResultState.HasData) {
          return Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: Text(
                  'Your Favorites',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: provider.restaurants.length,
                  itemBuilder: (context, index) {
                    return FavoriteCard(
                      restaurant: provider.restaurants[index],
                      itemIndex: index,
                    );
                  },
                ),
              ),
            ],
          );
        } else {
          return Container(
            child: EmptyView(
              lottie: 'assets/lottie/heart-break-or-unlike.json',
              text: 'No favorite restaurants yet!',
            ),
          );
        }
      },
    );
  }
}
