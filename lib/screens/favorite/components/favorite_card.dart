import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant_app/data/model/restaurant.dart';
import 'package:restaurant_app/screens/detail/detail.dart';

import '../../../common/constants.dart';

class FavoriteCard extends StatelessWidget {
  const FavoriteCard({
    Key key,
    this.itemIndex,
    this.restaurant,
    this.press,
  }) : super(key: key);

  final int itemIndex;
  final Restaurant restaurant;
  final Function press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return OpenContainer(
      closedColor: Colors.white.withOpacity(0.0),
      openColor: Colors.white.withOpacity(0.0),
      closedElevation: 0,
      openElevation: 0,
      closedBuilder: (context, action) => buildFavoriteCard(size, context),
      openBuilder: (context, action) => DetailScreen(
        id: restaurant.id,
      ),
    );
  }

  Container buildFavoriteCard(Size size, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding / 2,
      ),
      height: 160,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Container(
            height: 136,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              color: itemIndex.isEven ? kPrimaryColor : kTurqouiseColor,
              boxShadow: [kDefaultShadow],
            ),
            child: Container(
              margin: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                color: kMidnightBlue,
                borderRadius: BorderRadius.circular(22),
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Hero(
              tag: '${restaurant.id}',
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                height: 120,
                width: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    restaurant.pictureUrl(),
                    fit: BoxFit.cover,
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: SizedBox(
              height: 136,
              width: size.width - 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    child: Text(
                      restaurant.name,
                      style: TextStyle(color: kCloudColor),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: kDefaultPadding,
                      vertical: kDefaultPadding / 2,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SvgPicture.asset(
                          "assets/icons/star_fill.svg",
                          height: 20,
                        ),
                        SizedBox(width: kDefaultPadding / 2),
                        Text(
                          "${restaurant.rating}",
                          style: TextStyle(color: kCloudColor),
                        )
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: kDefaultPadding * 1.5,
                      vertical: kDefaultPadding / 4,
                    ),
                    decoration: BoxDecoration(
                      color: itemIndex.isEven ? kPrimaryColor : kTurqouiseColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(22),
                        topRight: Radius.circular(22),
                      ),
                    ),
                    child: Text(
                      "${restaurant.city}",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
