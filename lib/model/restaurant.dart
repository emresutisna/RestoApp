import 'dart:convert';

import 'menu.dart';

class RestaurantData {
  List<Restaurant> restaurants;

  RestaurantData({this.restaurants});

  RestaurantData.fromJson(Map<String, dynamic> json) {
    if (json['restaurants'] != null) {
      restaurants = new List<Restaurant>();
      json['restaurants'].forEach((v) {
        restaurants.add(new Restaurant.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.restaurants != null) {
      data['restaurants'] = this.restaurants.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Restaurant {
  String id;
  String name;
  String description;
  String picture;
  String city;
  double rating;
  Menus menus;

  Restaurant(
      {this.id,
      this.name,
      this.description,
      this.picture,
      this.city,
      this.rating,
      this.menus});

  Restaurant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    picture = json['pictureId'];
    city = json['city'];
    rating = json['rating'];
    menus = json['menus'] != null ? new Menus.fromJson(json['menus']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['pictureId'] = this.picture;
    data['city'] = this.city;
    data['rating'] = this.rating;
    if (this.menus != null) {
      data['menus'] = this.menus.toJson();
    }
    return data;
  }
}

List<Restaurant> parseRestaurants(String json) {
  if (json == null) {
    return [];
  }
  final Map<String, dynamic> parsedJson = jsonDecode(json);
  return RestaurantData.fromJson(parsedJson).restaurants;
}
