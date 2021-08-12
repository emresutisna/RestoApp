import 'package:flutter/material.dart';
import 'package:restaurant_app/components/empty_view.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: EmptyView(
        lottie: 'assets/lottie/heart-break-or-unlike.json',
        text: 'No favorite restaurants yet!',
      ),
    );
  }
}
