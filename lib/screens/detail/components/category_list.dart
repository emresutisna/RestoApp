import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/common/enums.dart';
import 'package:restaurant_app/provider/detail_provider.dart';
import 'package:restaurant_app/screens/detail/components/category_card.dart';

import '../../../common/constants.dart';

class CategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<DetailProvider>(
      builder: (context, state, _) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
          child: SizedBox(
            height: 36,
            child: state.state == ResultState.HasData
                ? ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.result.restaurant.categories.length,
                    itemBuilder: (context, index) => CategoryCard(
                      category: state.result.restaurant.categories[index],
                    ),
                  )
                : Center(child: Text('')),
          ),
        );
      },
    );
  }
}
