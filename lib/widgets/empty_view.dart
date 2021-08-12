import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyView extends StatelessWidget {
  final String lottie;
  final String text;

  const EmptyView({Key key, this.lottie, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset(this.lottie,
              height: MediaQuery.of(context).size.height / 3),
          Text(
            this.text,
            style: TextStyle(
              fontSize: 25,
            ),
          )
        ],
      ),
    );
  }
}
