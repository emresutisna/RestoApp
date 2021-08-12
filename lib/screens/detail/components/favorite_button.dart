import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/model/restaurant.dart';
import 'package:restaurant_app/provider/database_provider.dart';

class FavoriteButton extends StatefulWidget {
  final Restaurant restaurant;

  const FavoriteButton({Key key, this.restaurant}) : super(key: key);

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(
      builder: (context, provider, child) {
        return FutureBuilder<bool>(
            future: provider.isFavorite(widget.restaurant.id),
            builder: (context, snapshot) {
              var isFavorite = snapshot.data ?? false;
              return SizedBox(
                height: 64,
                width: 64,
                child: isFavorite
                    ? FlatButton(
                        onPressed: () {
                          provider.removeFavorite(widget.restaurant.id);
                        },
                        child: Icon(
                          Icons.favorite,
                          size: 40,
                          color: Colors.red,
                        ),
                      )
                    : FlatButton(
                        onPressed: () {
                          provider.addFavorite(widget.restaurant);
                        },
                        child: Icon(
                          Icons.favorite_outline,
                          size: 40,
                          color: Colors.red,
                        ),
                      ),
              );
            });
      },
    );
  }
}
