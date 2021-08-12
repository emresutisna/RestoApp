import 'package:flutter/material.dart';
import 'package:restaurant_app/screens/favorite/favorite.dart';
import 'package:restaurant_app/screens/home/home.dart';
import 'package:restaurant_app/screens/profile/profile.dart';

import '../constants.dart';
import '../enums.dart';

class BottomNavbar extends StatelessWidget {
  final MenuState selectedMenu;

  const BottomNavbar({
    Key key,
    this.selectedMenu,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: kDefaultPadding * 2,
        right: kDefaultPadding * 2,
        bottom: kDefaultPadding,
      ),
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -10),
            blurRadius: 35,
            color: kPrimaryColor.withOpacity(0.38),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(
              this.selectedMenu == MenuState.home
                  ? Icons.food_bank
                  : Icons.food_bank_outlined,
              size: 40,
              color: kPrimaryColor,
            ),
            onPressed: () {
              Navigator.pushNamed(context, HomeScreen.routeName);
            },
          ),
          IconButton(
            icon: Icon(
              this.selectedMenu == MenuState.favorite
                  ? Icons.favorite
                  : Icons.favorite_border,
              size: 40,
              color: kPrimaryColor,
            ),
            onPressed: () {
              Navigator.pushNamed(context, FavoriteScreen.routeName);
            },
          ),
          IconButton(
            icon: Icon(
              this.selectedMenu == MenuState.profile
                  ? Icons.person
                  : Icons.person_outline,
              size: 40,
              color: kPrimaryColor,
            ),
            onPressed: () {
              Navigator.pushNamed(context, ProfileScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
