import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../constants.dart';

class DescriptionView extends StatelessWidget {
  final String description;

  const DescriptionView({Key key, this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: kDefaultPadding / 2,
        horizontal: kDefaultPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Description",
            style: Theme.of(context).textTheme.headline5,
          ),
          SizedBox(
            height: kDefaultPadding / 2,
          ),
          Text(
            description,
            style: TextStyle(
              color: Color(0xFF737599),
            ),
          )
        ],
      ),
    );
  }
}
