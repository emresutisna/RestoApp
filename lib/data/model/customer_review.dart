class CustomerReview {
  final String name;
  final String review;
  final String date;

  CustomerReview({this.review, this.date, this.name});

  factory CustomerReview.fromJson(Map<String, dynamic> json) => CustomerReview(
        name: json['name'],
        review: json['review'],
        date: json['date'],
      );
}
