import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:restaurant_app/constants.dart';

class ErrorView extends StatelessWidget {
  final String text;
  final VoidCallback onRefresh;

  const ErrorView({Key key, this.text, this.onRefresh}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset('assets/lottie/error.json',
              height: MediaQuery.of(context).size.height / 3),
          Text(
            this.text,
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          FlatButton(
            onPressed: () => onRefresh(),
            child: Container(
              padding: EdgeInsets.only(
                left: kDefaultPadding,
                right: kDefaultPadding,
                top: kDefaultPadding / 2,
                bottom: kDefaultPadding / 2,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kDefaultPadding / 2),
                color: kPrimaryColor,
              ),
              child: Text(
                'Refresh',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
