import 'package:flutter/material.dart';
import 'package:mybooks/model/user.dart';

class UserBio extends StatelessWidget {
  final User user;

  UserBio(this.user);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            CircleAvatar(
              child: Text(
                '${this.user.firstname[0]}${this.user.lastname[0]}',
                style: TextStyle(fontSize: 24),
              ),
              minRadius: 36,
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              '${this.user.firstname} ${this.user.lastname}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            Text(
              '@${this.user.username}',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '${this.user.totalBooksRead} books read',
                ),
                SizedBox(
                  width: 16,
                ),
                Text('${this.user.totalPages} total pages')
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Text(
                    this.user.favBook == null
                        ? "No Favorite Book"
                        : this.user.favBook,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
