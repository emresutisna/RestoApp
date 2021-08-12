import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/model/category.dart';
import 'package:restaurant_app/data/model/customer_review.dart';

import 'menu.dart';

class RestaurantResults {
  bool error;
  String message;
  List<Restaurant> restaurants;

  RestaurantResults({this.error, this.message, this.restaurants});

  factory RestaurantResults.fromJson(Map<String, dynamic> json) =>
      RestaurantResults(
        error: json['error'],
        message: json['message'] != null ? json['message'] : '',
        restaurants: List<Restaurant>.from(
            json['restaurants'].map((x) => Restaurant.fromJson(x))),
      );
}

class RestaurantResult {
  bool error;
  String message;
  Restaurant restaurant;

  RestaurantResult({this.error, this.message, this.restaurant});

  factory RestaurantResult.fromJson(Map<String, dynamic> json) =>
      RestaurantResult(
        error: json['error'],
        message: json['message'],
        restaurant: Restaurant.fromJson(json['restaurant']),
      );
}

class Restaurant {
  String id;
  String name;
  String description;
  String pictureId;
  String city;
  double rating;
  Menus menus;
  List<Category> categories;
  List<CustomerReview> customerReviews;

  Restaurant({
    this.id,
    this.name,
    this.description,
    this.pictureId,
    this.city,
    this.rating,
    this.menus,
    this.categories,
    this.customerReviews,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        pictureId: json['pictureId'],
        city: json['city'],
        rating: json['rating'].toDouble(),
        menus: json['menus'] != null ? new Menus.fromJson(json['menus']) : null,
        categories: json['categories'] != null
            ? List<Category>.from(
                json['categories'].map((x) => Category.fromJson(x)))
            : null,
        customerReviews: json['customerReviews'] != null
            ? List<CustomerReview>.from(
                json['customerReviews'].map((x) => CustomerReview.fromJson(x)))
            : null,
      );
  String pictureUrl() => ApiService.baseImageUrl + this.pictureId;
}
