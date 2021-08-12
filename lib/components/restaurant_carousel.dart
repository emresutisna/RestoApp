import 'package:flutter/material.dart';
import 'package:restaurant_app/components/restaurant_card.dart';
import 'package:restaurant_app/model/restaurant.dart';
import 'dart:math' as math;

import '../constants.dart';

class RestaurantCarousel extends StatefulWidget {
  final List<Restaurant> restaurants;

  const RestaurantCarousel({Key key, this.restaurants}) : super(key: key);

  @override
  _RestaurantCarouselState createState() => _RestaurantCarouselState();
}

class _RestaurantCarouselState extends State<RestaurantCarousel> {
  PageController _pageController;
  int initialPage = 1;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: 0.8,
      initialPage: initialPage,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: AspectRatio(
        aspectRatio: 1.1,
        child: PageView.builder(
          onPageChanged: (value) {
            setState(() {
              initialPage = value;
            });
          },
          controller: _pageController,
          physics: ClampingScrollPhysics(),
          itemCount: widget.restaurants.length,
          itemBuilder: (context, index) => buildRestaurantSlider(index),
        ),
      ),
    );
  }

  Widget buildRestaurantSlider(int index) => AnimatedBuilder(
        animation: _pageController,
        builder: (context, child) {
          double value = 0;
          if (_pageController.position.haveDimensions) {
            value = index - _pageController.page;
            value = (value * 0.038).clamp(-1, 1);
          }
          return AnimatedOpacity(
            duration: Duration(milliseconds: 350),
            opacity: initialPage == index ? 1 : 0.4,
            child: Transform.rotate(
              angle: math.pi * value,
              child: RestaurantCard(restaurant: widget.restaurants[index]),
            ),
          );
        },
      );
}
