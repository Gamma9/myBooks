import 'package:flutter/material.dart';
import 'package:mybooks/model/definition.dart';

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
  bool isCompleted;
  Category category;
  String categoryStr;
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
    @required this.isCompleted,
    @required this.datePublished,
    @required this.summary,
    @required this.notes,
    @required this.ideas,
    @required this.category,
    @required this.definitions,
    @required this.pages,
  });

  void set bookCategory(Category newCategory) {
    this.category = newCategory;
  }

  void set bookSummary(String newSummary) {
    this.summary = newSummary;
  }
}
