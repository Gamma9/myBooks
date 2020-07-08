import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mybooks/model/user.dart';

class AuthProvider with ChangeNotifier {
  String _token;
  DateTime _expDate;
  String _userId;

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
    String email,
    String password,
  ) async {
    const url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyDrUxNx8x4CwqqbjI4qDH_gbw1xNbXt7UE';

    final response = await http.post(
      url,
      body: json.encode({
        'email': email,
        'password': password,
        'returnSecureToken': true,
      }),
    );
    print(json.decode(response.body));
  }
}
