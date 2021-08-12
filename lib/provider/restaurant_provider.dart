import 'package:flutter/material.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/model/restaurant.dart';

import '../enums.dart';

class RestaurantsProvider extends ChangeNotifier {
  final ApiService apiService;

  RestaurantsProvider({@required this.apiService}) {
    fetchAllRestaurant();
  }

  RestaurantResults _restaurantsResult;
  String _message = '';
  String _query = '';
  ResultState _state;

  String get message => _message;
  String get query => _query;

  RestaurantResults get result => _restaurantsResult;

  ResultState get state => _state;

  Future<dynamic> fetchAllRestaurant() async {
    try {
      _state = ResultState.Loading;
      _query = '';
      notifyListeners();
      final result = await apiService.list();
      if (result.restaurants.isEmpty) {
        _state = ResultState.NoData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.HasData;
        notifyListeners();
        return _restaurantsResult = result;
      }
    } catch (e) {
      _state = ResultState.Error;
      notifyListeners();
      return _message = '$e';
    }
  }

  Future<dynamic> searchRestaurants(String query) async {
    try {
      _state = ResultState.Loading;
      _query = query;
      notifyListeners();
      final result = await apiService.search(query);
      if (result.restaurants.isEmpty) {
        _state = ResultState.NoData;
        notifyListeners();
        return _message = 'Not found';
      } else {
        _state = ResultState.HasData;
        notifyListeners();
        return _restaurantsResult = result;
      }
    } catch (e) {
      _state = ResultState.Error;
      notifyListeners();
      return _message = '$e';
    }
  }
}
