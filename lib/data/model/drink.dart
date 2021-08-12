class Drink {
  String name;

  Drink({this.name});

  Drink.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }
}
