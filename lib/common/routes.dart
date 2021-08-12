import 'package:flutter/material.dart';
import 'package:restaurant_app/screens/detail/detail.dart';
import 'package:restaurant_app/screens/favorite/favorite.dart';
import 'package:restaurant_app/screens/home/home.dart';
import 'package:restaurant_app/screens/profile/profile.dart';
import 'package:restaurant_app/screens/setting/setting.dart';
import 'package:restaurant_app/screens/splashscreen/splashscreen.dart';

final Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (context) => HomeScreen(),
  FavoriteScreen.routeName: (context) => FavoriteScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  SettingScreen.routeName: (context) => SettingScreen(),
  SplashScreen.routeName: (context) => SplashScreen(),
  DetailScreen.routeName: (context) => DetailScreen(
        id: ModalRoute.of(context).settings.arguments,
      ),
};
