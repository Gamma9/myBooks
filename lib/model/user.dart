import 'package:flutter/material.dart';
import 'package:mybooks/model/book.dart';
import 'package:mybooks/model/definition.dart';
import 'package:mybooks/model/session.dart';

class User {
  String id;
  String firstname;
  String lastname;
  String username;
  List<Book> books;
  List<Book> booksRead;
  List<Definition> definitions;
  List<Session> readingSessions;
  String favBook;
  String favCategory; //Change this to enum
  String dob;

  User({
    @required this.id,
    @required this.firstname,
    @required this.lastname,
    @required this.username,
    @required this.books,
    @required this.booksRead,
    @required this.definitions,
    @required this.readingSessions,
    @required this.favBook,
    @required this.favCategory,
    @required this.dob,
  });

  int get totalBooksRead {
    return this.booksRead.length;
  }

  int get totalPages {
    var pages = 0;
    for (int i = 0; i < booksRead.length; i++) {
      pages = pages += booksRead[i].pages;
      print('Title: ${booksRead[i].title} - (${booksRead[i].pages})');
    }
    print(pages);
    return pages;
  }

  List<Session> get allSessions {
    return [...this.readingSessions];
  }

  List<Definition> get allDefinitions {
    return [...this.definitions];
  }

  Book get longestBookRead {
    Book longestBook;
    this.booksRead.forEach((element) {
      if (element.pages > longestBook.pages) {
        return longestBook.pages = element.pages;
      } else if (element.pages <= longestBook.pages) {
        return longestBook.pages;
      }
      print(
          'Longest Book Read:\nTitle: ${longestBook.title}\nAuthor: ${longestBook.author}\nPages: ${longestBook.pages}');
      return longestBook.pages;
    });
    return longestBook;
  }
}
