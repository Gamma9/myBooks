import 'package:flutter/material.dart';

class RatingStars extends StatefulWidget {
  final rating = 0;

  @override
  _RatingStarsState createState() => _RatingStarsState();
}

class _RatingStarsState extends State<RatingStars> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Icon(
            Icons.star_border,
            color: Colors.amber,
          ),
          Icon(
            Icons.star_border,
            color: Colors.amber,
          ),
          Icon(
            Icons.star_border,
            color: Colors.amber,
          ),
          Icon(
            Icons.star_border,
            color: Colors.amber,
          ),
          Icon(
            Icons.star_border,
            color: Colors.amber,
          )
        ],
      ),
    );
  }
}
