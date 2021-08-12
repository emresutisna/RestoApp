import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'components/body.dart';

class DetailScreen extends StatelessWidget {
  static String routeName = '/detail';
  final String id;
  const DetailScreen({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(id: id),
    );
  }
}
