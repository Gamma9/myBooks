import 'package:flutter/material.dart';

enum Category {
  Nonfiction,
  Fiction,
  SelfHelp,
  Thriller,
  Business,
}

class Book {
  String id;
  String title;
  String author;
  String imageUrl;
  Category category;
  int pages;

  Book({
    @required this.id,
    @required this.title,
    @required this.author,
    @required this.imageUrl,
    @required this.category,
    @required this.pages,
  });
}
