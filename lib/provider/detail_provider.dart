import 'package:flutter/material.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/model/restaurant.dart';

import '../enums.dart';

class DetailProvider extends ChangeNotifier {
  final ApiService apiService;
  final String id;

  DetailProvider({@required this.apiService, @required this.id}) {
    fetchDetail(this.id);
  }

  RestaurantResult _restaurantResult;
  String _message = '';
  ResultState _state;

  String get message => _message;

  RestaurantResult get result => _restaurantResult;

  ResultState get state => _state;

  Future<dynamic> fetchDetail(String id) async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      final result = await apiService.detail(id);
      if (result.restaurant == null) {
        _state = ResultState.NoData;
        notifyListeners();
        return _message = 'Data not found';
      } else {
        _state = ResultState.HasData;
        notifyListeners();
        return _restaurantResult = result;
      }
    } catch (e) {
      _state = ResultState.Error;
      notifyListeners();
      return _message = '$e';
    }
  }
}
