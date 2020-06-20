import 'package:flutter/material.dart';
import 'package:mybooks/model/definition.dart';

enum Category {
  Nonfiction,
  Fiction,
  SelfHelp,
  Thriller,
  Business,
}

enum Status { Completed, Active, Nonactive }

class Book {
  String id;
  String title;
  String author;
  String imageUrl;
  String datePublished;
  Category category;
  String categoryStr;
  Status status;
  String statusStr;
  int pages;
  List<Definition> definitions;
  String summary;
  String notes;
  String ideas;

  Book({
    @required this.id,
    @required this.title,
    @required this.author,
    @required this.imageUrl,
    @required this.datePublished,
    @required this.status,
    @required this.summary,
    @required this.notes,
    @required this.ideas,
    @required this.category,
    @required this.definitions,
    @required this.pages,
  });

  void set bookCategory(Category category) {}

  void set bookStatus(Status status) {}
}
