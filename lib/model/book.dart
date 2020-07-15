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
  String category;
  // String categoryStr;
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

  set setCategory(Category newCategory) {
    switch (newCategory) {
      case Category.Business:
        {
          this.category = 'business';
        }
        break;
      case Category.Fiction:
        {
          this.category = 'fiction';
        }
        break;
      case Category.Nonfiction:
        {
          this.category = 'nonfiction';
        }
        break;
      case Category.SelfHelp:
        {
          this.category = 'selfhelp';
        }
        break;
      case Category.Thriller:
        {
          this.category = 'thriller';
        }
        break;
      default:
        break;
    }
  }

  void set bookSummary(String newSummary) {
    this.summary = newSummary;
  }
}
