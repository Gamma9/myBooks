import 'package:flutter/material.dart';

// Model
import 'package:mybooks/model/user.dart';
import 'package:mybooks/widgets/books/booksReadList.dart';
import '../data/user.dart';

// Widgets
import 'package:mybooks/widgets/user/userBio.dart';

class UserProfile extends StatelessWidget {
  final User user = User(
    id: DateTime.now().toString(),
    firstname: "Cameron",
    lastname: "Gamble",
    username: "stopitcam",
    books: [],
    booksRead: 0,
    dob: 'November 30, 1995',
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          UserBio(this.user),
          BooksReadList(this.user.books),
        ],
      ),
    );
  }
}
