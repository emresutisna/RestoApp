import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/restaurant_provider.dart';

import '../../../common/constants.dart';

class SearchBox extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  String _query = '';
  TextEditingController controller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<RestaurantsProvider>(builder: (context, state, _) {
      return Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            height: 54,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 50,
                  color: kPrimaryColor.withOpacity(0.23),
                ),
              ],
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: controller,
                    onChanged: (value) {
                      setState(() {
                        _query = value;
                      });
                      if (value != '') {
                        state.searchRestaurants(value);
                      } else {
                        state.fetchAllRestaurant();
                      }
                    },
                    decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: TextStyle(
                        color: kPrimaryColor.withOpacity(0.5),
                      ),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (_query != '') {
                      state.fetchAllRestaurant();
                      controller.clear();
                      setState(() {
                        _query = '';
                      });
                    }
                  },
                  iconSize: 25,
                  icon: _query == ''
                      ? Icon(
                          Icons.search,
                          size: 25,
                        )
                      : Icon(
                          Icons.close,
                          size: 25,
                        ),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
