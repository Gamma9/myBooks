import 'package:flutter/material.dart';
import 'package:mybooks/model/book.dart';

class User {
  String id;
  String firstname;
  String lastname;
  String username;
  List<Book> books;
  List<Book> booksRead;
  String favBook;
  String dob;

  User({
    @required this.id,
    @required this.firstname,
    @required this.lastname,
    @required this.username,
    @required this.books,
    @required this.booksRead,
    @required this.favBook,
    @required this.dob,
  });

  int get totalBooksRead {
    return this.booksRead.length;
  }
}
