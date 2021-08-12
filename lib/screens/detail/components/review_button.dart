import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/common/constants.dart';
import 'package:restaurant_app/provider/detail_provider.dart';

class ReviewButton extends StatefulWidget {
  @override
  _ReviewButtonState createState() => _ReviewButtonState();
}

class _ReviewButtonState extends State<ReviewButton> {
  TextEditingController _controller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    final DetailProvider _detailProvider = Provider.of<DetailProvider>(context);
    return SizedBox(
      height: 64,
      width: 64,
      child: Column(
        children: [
          FlatButton(
            onPressed: () {
              _showDialog(_detailProvider);
            },
            child: Icon(
              Icons.chat_sharp,
              size: 30,
              color: kPrimaryColor,
            ),
          ),
          Text(
            'Write',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  _showDialog(DetailProvider detailProvider) async {
    await showDialog<String>(
      context: context,
      child: new AlertDialog(
        contentPadding: const EdgeInsets.all(16.0),
        content: new Row(
          children: <Widget>[
            new Expanded(
              child: new TextField(
                autofocus: true,
                controller: _controller,
                decoration: new InputDecoration(
                  labelText: 'Review',
                  hintText: 'Enter your review',
                ),
              ),
            )
          ],
        ),
        actions: <Widget>[
          new FlatButton(
              child: const Text('CANCEL'),
              onPressed: () {
                Navigator.pop(context);
              }),
          new FlatButton(
              child: const Text('Send'),
              onPressed: () {
                detailProvider.createReview(_controller.text);
                Navigator.pop(context);
              })
        ],
      ),
    );
  }
}
