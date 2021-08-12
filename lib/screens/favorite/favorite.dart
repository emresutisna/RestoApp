import 'package:flutter/material.dart';
import 'package:restaurant_app/components/bottom_navbar.dart';
import 'package:restaurant_app/enums.dart';

import 'components/body.dart';

class FavoriteScreen extends StatelessWidget {
  static String routeName = '/favorite';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite"),
      ),
      body: Body(),
      bottomNavigationBar: BottomNavbar(
        selectedMenu: MenuState.favorite,
      ),
    );
  }
}
