import 'package:flutter/material.dart';
import 'package:restaurant_app/widgets/bottom_navbar.dart';
import 'package:restaurant_app/common/enums.dart';

import 'components/body.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Body(),
      bottomNavigationBar: BottomNavbar(
        selectedMenu: MenuState.profile,
      ),
    );
  }
}
