import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant_app/model/restaurant.dart';
import 'package:restaurant_app/screens/detail/components/favorite_button.dart';

import '../../../constants.dart';

class Header extends StatelessWidget {
  final Size size;
  final Restaurant restaurant;

  const Header({
    Key key,
    @required this.size,
    @required this.restaurant,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.4,
      child: Stack(
        children: <Widget>[
          Container(
            height: size.height * 0.4 - 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(restaurant.picture),
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.4), BlendMode.darken),
              ),
            ),
          ),
          // Rating Box
          Positioned(
            bottom: 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: kDefaultPadding),
                  child: Text(
                    restaurant.name,
                    style: TextStyle(
                      fontSize: kDefaultPadding * 1.5,
                      color: kBackgroundColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: kDefaultPadding),
                  child: Text(
                    restaurant.city,
                    style: TextStyle(
                      fontSize: kDefaultPadding,
                      color: kBackgroundColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: kDefaultPadding,
            child: Container(
              width: size.width * 0.9,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 5),
                    blurRadius: 50,
                    color: Color(0xFF12153D).withOpacity(0.2),
                  ),
                ],
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SvgPicture.asset("assets/icons/star_fill.svg"),
                        SizedBox(height: kDefaultPadding / 4),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(color: Colors.black),
                            children: [
                              TextSpan(
                                text: "${restaurant.rating}/",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              TextSpan(text: "5\n"),
                            ],
                          ),
                        ),
                      ],
                    ),
                    FavoriteButton(),
                  ],
                ),
              ),
            ),
          ),
          // Back Button
          SafeArea(
            child: IconButton(
              icon: Container(
                decoration: BoxDecoration(
                  color: kPrimaryColor.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(kDefaultPadding / 2),
                ),
                child: Icon(
                  Icons.chevron_left,
                  color: kBackgroundColor,
                  size: 40,
                ),
              ),
              iconSize: 40,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
