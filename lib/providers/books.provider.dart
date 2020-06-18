import 'package:flutter/material.dart';
import 'package:mybooks/model/book.dart';

class BooksProvider with ChangeNotifier {
  List<Book> _books = [];

  List<Book> get getBooksList {
    return this._books;
  }

  void addNewBook(Book book) {
    final newBook = Book(
      imageUrl: book.imageUrl,
      author: book.author,
      title: book.title,
      pages: book.pages,
      datePublished: book.datePublished,
      category: book.category,
    );
    this._books.add(newBook);
    notifyListeners();
  }
}
