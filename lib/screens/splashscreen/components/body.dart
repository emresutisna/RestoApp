import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:restaurant_app/screens/home/home.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3),
        () => Navigator.pushReplacementNamed(context, HomeScreen.routeName));

    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Lottie.asset('assets/lottie/restaurant.json'),
      ),
    );
  }
}
