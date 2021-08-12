import 'package:flutter/material.dart';
import 'package:restaurant_app/widgets/bottom_navbar.dart';

import '../../common/enums.dart';
import 'components/body.dart';

class SettingScreen extends StatelessWidget {
  static String routeName = '/setting';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Setting"),
      ),
      body: Body(),
      bottomNavigationBar: BottomNavbar(
        selectedMenu: MenuState.setting,
      ),
    );
  }
}
