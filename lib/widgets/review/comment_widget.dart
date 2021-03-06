import 'package:flutter/material.dart';

class CommentWidget extends StatefulWidget {
  final Function _submitHandler;
  CommentWidget(this._submitHandler);
  @override
  _CommentWidgetState createState() => _CommentWidgetState();
}

class _CommentWidgetState extends State<CommentWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Comment :',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          TextField(
            decoration: InputDecoration(hintText: "Enter Comment Here ..."),
            onChanged: (value) {
              widget._submitHandler(value);
            },
          ),
        ],
      ),
    );
  }
}
