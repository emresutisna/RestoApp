import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset('assets/lottie/heart-break-or-unlike.json'),
          Text(
            'No favorites data yet!',
            style: TextStyle(
              fontSize: 30,
            ),
          )
        ],
      ),
    );
  }
}
