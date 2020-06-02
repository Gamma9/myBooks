import 'package:flutter/material.dart';

class NoDefinitions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.do_not_disturb,
            size: 52,
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            'No Defintions',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          )
        ],
      ),
    );
  }
}
