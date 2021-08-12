import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:restaurant_app/data/model/customer_review.dart';

class ReviewWidget extends StatelessWidget {
  final List<CustomerReview> reviews;

  ReviewWidget({Key key, this.reviews}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(8),
          itemCount: reviews.length,
          itemBuilder: (BuildContext context, int index) {
            return _buildReviewItem(context, reviews[index]);
          }),
    );
  }
}

Widget _buildReviewItem(BuildContext context, CustomerReview review) {
  return Card(
    child: ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      title: Text(review.name),
      subtitle: Text(review.review),
      trailing: Text(review.date),
      leading: Icon(Icons.chat_bubble),
    ),
  );
}
