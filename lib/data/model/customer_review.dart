class CustomerReviewResults {
  bool error;
  String message;
  List<CustomerReview> customerReviews;

  CustomerReviewResults({this.error, this.message, this.customerReviews});

  factory CustomerReviewResults.fromJson(Map<String, dynamic> json) =>
      CustomerReviewResults(
        error: json['error'],
        message: json['message'],
        customerReviews: List<CustomerReview>.from(
          json['customerReviews'].map((x) => CustomerReview.fromJson(x)),
        ),
      );
}

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
