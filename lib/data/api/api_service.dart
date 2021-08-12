import 'dart:convert';

import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:restaurant_app/data/model/customer_review.dart';
import 'package:restaurant_app/data/model/restaurant.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static final String _baseUrl = 'https://restaurant-api.dicoding.dev/';
  static final String baseImageUrl =
      'https://restaurant-api.dicoding.dev/images/medium/';

  Future<RestaurantResults> list() async {
    bool result = await DataConnectionChecker().hasConnection;
    if (result == true) {
      final response = await http.get(_baseUrl + 'list');
      if (response.statusCode == 200) {
        return RestaurantResults.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load restaurant list');
      }
    } else {
      throw Exception('No internet connection');
    }
  }

  Future<RestaurantResult> detail(String id) async {
    bool result = await DataConnectionChecker().hasConnection;
    if (result == true) {
      final response = await http.get(_baseUrl + 'detail/$id');
      if (response.statusCode == 200) {
        return RestaurantResult.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to restaurant detail');
      }
    } else {
      throw Exception('No internet connection');
    }
  }

  Future<RestaurantResults> search(String query) async {
    bool result = await DataConnectionChecker().hasConnection;
    if (result == true) {
      final response = await http.get(_baseUrl + 'search?q=$query');
      if (response.statusCode == 200) {
        return RestaurantResults.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load restaurant list');
      }
    } else {
      throw Exception('No internet connection');
    }
  }

  Future<CustomerReviewResults> createReview(String id, String review) async {
    bool result = await DataConnectionChecker().hasConnection;
    if (result == true) {
      final _response = await http.post(
        _baseUrl + 'review',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'X-Auth-Token': '12345',
        },
        body: jsonEncode(<String, String>{
          'id': id,
          'name': 'Nanang Sutisna',
          'review': review,
        }),
      );
      if (_response.statusCode == 200) {
        return CustomerReviewResults.fromJson(json.decode(_response.body));
      } else {
        throw Exception('Failed to save review');
      }
    } else {
      throw Exception('No internet connection');
    }
  }
}
