import 'package:flutter/material.dart';
import 'package:mybooks/model/user.dart';

class AuthProvider with ChangeNotifier {
  bool isAuth = false;
  final User user = User(
    readingSessions: [],
    id: DateTime.now().toString(),
    firstname: "Cameron",
    lastname: "Gamble",
    username: "stopitcam",
    dob: 'November 30, 1995',
    books: [],
    booksRead: [],
    definitions: [],
    favBook: null,
    favCategory: '',
  );

  Future<void> login(
    String username,
    String password,
  ) {
    if (username != null || username.isNotEmpty) {
      if (password != null || password.isNotEmpty) {
        print('username: ${username} password: ${password}');
        isAuth = true;
      }
    } else {}
    // const url = 'https://something-firebase.firebaseio.com/myBooks-2a235';
    // this.http.post(url, body: json.encode({username, password}));
  }

  Future<void> signup(
    String firstname,
    String lastname,
    String username,
    String password,
  ) {
    if (username != null || username.isNotEmpty) {
      if (password != null || password.isNotEmpty) {
        print(
            'New User! \n\nfirstname: ${firstname}\nlastname: ${lastname}\nusername: ${username} password: ${password}');
        isAuth = true;
      }
    } else {}
    // https://something-firebase.firebaseio.com/myBooks-2a235';
    // this.http.post(ur
  }
}