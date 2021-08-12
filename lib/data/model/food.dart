class Food {
  String name;

  Food({this.name});

  Food.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }
}
