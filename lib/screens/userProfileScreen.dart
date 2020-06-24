import 'package:flutter/material.dart';

// Model
import 'package:mybooks/providers/auth.provider.dart';
import 'package:mybooks/providers/library.provider.dart';
import 'package:mybooks/widgets/books/booksReadList.dart';
import 'package:provider/provider.dart';

// Widgets
import 'package:mybooks/widgets/user/userBio.dart';

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final currentUser = authProvider.user;
    final booksRead = currentUser.booksRead;

    return Container(
      margin: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          UserBio(currentUser),
          BooksReadList(booksRead),
        ],
      ),
    );
  }
}
