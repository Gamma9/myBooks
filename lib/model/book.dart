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
  String datePublished;
  Category category;
  int pages;
  String notes;
  String ideas;

  Book({
    @required this.id,
    @required this.title,
    @required this.author,
    @required this.imageUrl,
    @required this.datePublished,
    @required this.category,
    @required this.pages,
  });
}
