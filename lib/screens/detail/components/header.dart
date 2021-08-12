import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/widgets/error_view.dart';
import 'package:restaurant_app/provider/detail_provider.dart';
import 'package:restaurant_app/screens/detail/components/favorite_button.dart';
import 'package:restaurant_app/screens/detail/components/review_button.dart';

import '../../../common/constants.dart';
import '../../../common/enums.dart';

class Header extends StatelessWidget {
  final Size size;

  const Header({
    Key key,
    @required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DetailProvider>(
      builder: (context, state, _) {
        if (state.state == ResultState.HasData) {
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
                      image: NetworkImage(state.result.restaurant.pictureUrl()),
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.4), BlendMode.darken),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 120,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: kDefaultPadding),
                        child: Text(
                          state.result.restaurant.name,
                          style: TextStyle(
                            fontSize: kDefaultPadding * 1.5,
                            color: kBackgroundColor,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: kDefaultPadding),
                        child: Text(
                          state.result.restaurant.city,
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPadding),
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
                                      text:
                                          "${state.result.restaurant.rating}/",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    TextSpan(text: "5\n"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          FavoriteButton(
                            restaurant: state.result.restaurant,
                          ),
                          ReviewButton(),
                        ],
                      ),
                    ),
                  ),
                ),
                SafeArea(
                  child: IconButton(
                    icon: Container(
                      decoration: BoxDecoration(
                        color: kPrimaryColor.withOpacity(0.7),
                        borderRadius:
                            BorderRadius.circular(kDefaultPadding / 2),
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
        } else if (state.state == ResultState.NoData) {
          return Center(child: Text(state.message));
        } else if (state.state == ResultState.Error) {
          return ErrorView(
            text: state.message,
            onRefresh: () => state.fetchDetail(state.id),
          );
        } else {
          return Center(child: Text(''));
        }
      },
    );
  }
}
