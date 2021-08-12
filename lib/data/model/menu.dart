import 'drink.dart';
import 'food.dart';

class Menus {
  List<Food> foods;
  List<Drink> drinks;

  Menus({this.foods, this.drinks});

  Menus.fromJson(Map<String, dynamic> json) {
    if (json['foods'] != null) {
      foods = new List<Food>();
      json['foods'].forEach((v) {
        foods.add(new Food.fromJson(v));
      });
    }
    if (json['drinks'] != null) {
      drinks = new List<Drink>();
      json['drinks'].forEach((v) {
        drinks.add(new Drink.fromJson(v));
      });
    }
  }
}
