import 'package:flutter/material.dart';
import 'package:restaurant_app/components/restaurant_carousel.dart';
import 'package:restaurant_app/model/restaurant.dart';

import 'header_with_searchbox.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // It will provie us total height  and width of our screen
    Size size = MediaQuery.of(context).size;
    // it enable scrolling on small device
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          HeaderWithSearchBox(size: size),
          buildCarousel(context),
        ],
      ),
    );
  }

  Widget buildCarousel(BuildContext context) {
    return FutureBuilder<String>(
      future:
          DefaultAssetBundle.of(context).loadString('assets/restaurants.json'),
      builder: (context, snapshot) {
        final List<Restaurant> restaurants = parseRestaurants(snapshot.data);
        return RestaurantCarousel(
          restaurants: restaurants,
        );
      },
    );
  }
}
