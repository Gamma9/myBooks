import 'package:flutter/material.dart';

class NoNotifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            minRadius: 36,
            child: Icon(
              Icons.notifications_off,
              size: 32,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            'No Notifications',
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
