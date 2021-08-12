import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/screens/home/components/restaurant_card.dart';
import 'package:restaurant_app/data/model/restaurant.dart';
import 'package:restaurant_app/provider/restaurant_provider.dart';
import 'package:restaurant_app/widgets/empty_view.dart';
import 'dart:math' as math;

import '../../../common/constants.dart';
import '../../../common/enums.dart';
import '../../../widgets/error_view.dart';

class RestaurantCarousel extends StatefulWidget {
  @override
  _RestaurantCarouselState createState() => _RestaurantCarouselState();
}

class _RestaurantCarouselState extends State<RestaurantCarousel> {
  PageController _pageController;
  int _initialPage = 1;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: 0.8,
      initialPage: _initialPage,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RestaurantsProvider>(
      builder: (context, state, _) {
        if (state.state == ResultState.Loading) {
          return Center(child: CircularProgressIndicator());
        } else if (state.state == ResultState.HasData) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
            child: AspectRatio(
              aspectRatio: 1.1,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    _initialPage = value;
                  });
                },
                controller: _pageController,
                physics: ClampingScrollPhysics(),
                itemCount: state.result.restaurants.length,
                itemBuilder: (context, index) {
                  var restaurant = state.result.restaurants[index];
                  return _buildRestaurantSlider(index, restaurant);
                },
              ),
            ),
          );
        } else if (state.state == ResultState.NoData) {
          return EmptyView(
            lottie: 'assets/lottie/healthy-or-junk-food.json',
            text: 'No Data!',
          );
        } else if (state.state == ResultState.Error) {
          return Center(
            child: ErrorView(
              text: state.message,
              onRefresh: () => state.query == ''
                  ? state.fetchAllRestaurant()
                  : state.searchRestaurants(state.query),
            ),
          );
        } else {
          return Center(child: Text(''));
        }
      },
    );
  }

  Widget _buildRestaurantSlider(
    int index,
    Restaurant restaurant,
  ) =>
      AnimatedBuilder(
        animation: _pageController,
        builder: (context, child) {
          double value = 0;
          if (_pageController.position.haveDimensions) {
            value = index - _pageController.page;
            value = (value * 0.038).clamp(-1, 1);
          }
          return AnimatedOpacity(
            duration: Duration(milliseconds: 350),
            opacity: _initialPage == index ? 1 : 0.4,
            child: Transform.rotate(
              angle: math.pi * value,
              child: RestaurantCard(restaurant: restaurant),
            ),
          );
        },
      );
}
