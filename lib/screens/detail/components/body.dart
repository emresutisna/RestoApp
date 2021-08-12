import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/provider/detail_provider.dart';
import 'package:restaurant_app/screens/detail/components/category_list.dart';
import 'package:restaurant_app/screens/detail/components/tab_view.dart';
import '../../../constants.dart';
import 'header.dart';

class Body extends StatelessWidget {
  final String id;

  const Body({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider<DetailProvider>(
      create: (_) => DetailProvider(apiService: ApiService(), id: id),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Header(size: size),
            SizedBox(height: kDefaultPadding / 2),
            CategoryList(),
            TabView(
              size: size,
            ),
            SizedBox(height: kDefaultPadding),
          ],
        ),
      ),
    );
  }
}
