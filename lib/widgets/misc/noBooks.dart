import 'package:flutter/material.dart';

class NoBooks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            minRadius: 36,
            child: Icon(
              Icons.book,
              size: 32,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            'No Books',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
