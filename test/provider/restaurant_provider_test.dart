import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/model/restaurant.dart';
import 'package:restaurant_app/provider/restaurant_provider.dart';

class MockApiService extends Mock implements ApiService {}

const apiResponse = {
  'error': false,
  'message': 'success',
  'count': 1,
  'restaurants': [
    {
      "id": "rqdv5juczeskfw1e867",
      "name": "Melting Pot",
      "description":
          "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. ...",
      "pictureId": "14",
      "city": "Medan",
      "rating": 4.2
    },
  ]
};

const testRestaurant = {
  "id": "rqdv5juczeskfw1e867",
  "name": "Melting Pot",
  "description":
      "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. ...",
  "pictureId": "14",
  "city": "Medan",
  "rating": 4.2
};

const searchResponse = {
  "error": false,
  "founded": 1,
  "restaurants": [
    {
      "id": "rqdv5juczeskfw1e867",
      "name": "Melting Pot",
      "description":
          "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. ...",
      "pictureId": "14",
      "city": "Medan",
      "rating": 4.2
    },
  ]
};

const testDetailRestaurant = {
  "id": "rqdv5juczeskfw1e867",
  "name": "Melting Pot",
  "description":
      "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. ...",
  "city": "Medan",
  "address": "Jln. Pandeglang no 19",
  "pictureId": "14",
  "categories": [
    {"name": "Italia"},
    {"name": "Modern"}
  ],
  "menus": {
    "foods": [
      {"name": "Paket rosemary"},
      {"name": "Toastie salmon"}
    ],
    "drinks": [
      {"name": "Es krim"},
      {"name": "Sirup"}
    ]
  },
  "rating": 4.2,
  "customerReviews": [
    {
      "name": "Ahmad",
      "review": "Tidak rekomendasi untuk pelajar!",
      "date": "13 November 2019"
    }
  ]
};

void main() {
  group('Restaurant Provider Test', () {
    RestaurantsProvider restaurantProvider;
    ApiService apiService;
    setUp(() {
      apiService = MockApiService();
      when(apiService.list())
          .thenAnswer((_) async => RestaurantResults.fromJson(apiResponse));
      restaurantProvider = RestaurantsProvider(apiService: apiService);
    });
    test('verify that fetch all restaurants json parse run as expected',
        () async {
      var result = restaurantProvider.result.restaurants[0];
      var jsonRestaurant = Restaurant.fromJson(testRestaurant);
      expect(result.id == jsonRestaurant.id, true);
      expect(result.name == jsonRestaurant.name, true);
      expect(result.description == jsonRestaurant.description, true);
      expect(result.pictureId == jsonRestaurant.pictureId, true);
      expect(result.city == jsonRestaurant.city, true);
      expect(result.rating == jsonRestaurant.rating, true);
    });

    test('verify that restaurants search json parse run as expected', () async {
      when(apiService.search('melting'))
          .thenAnswer((_) async => RestaurantResults.fromJson(searchResponse));
      var result = restaurantProvider.result.restaurants[0];
      var jsonRestaurant = Restaurant.fromJson(testRestaurant);
      expect(result.id == jsonRestaurant.id, true);
      expect(result.name == jsonRestaurant.name, true);
      expect(result.description == jsonRestaurant.description, true);
      expect(result.pictureId == jsonRestaurant.pictureId, true);
      expect(result.city == jsonRestaurant.city, true);
      expect(result.rating == jsonRestaurant.rating, true);
    });
  });
}
