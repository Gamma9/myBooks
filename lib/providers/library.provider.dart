import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Model
import 'package:mybooks/model/book.dart';
import 'package:mybooks/model/definition.dart';

class LibraryProvider with ChangeNotifier {
  List<Book> _books = [];

  Book findById(String id) {
    return this._books.firstWhere((element) => element.id == id);
  }

  List<Book> get getAllBooks {
    // this.fetchAndSetBooks();
    return [...this._books];
  }

  // TODO: Implement total pages read
  int get totalPagesRead {
    int totalPages = 0;
    // this._books.forEach((element) {
    //   if (this._books != null) {
    //     if (element.pages != null && element.isCompleted == true) {
    //       totalPages += element.pages;
    //     }
    //   } else {
    //     print('Called totalPagesRead on null books');
    //     return;
    //   }
    // });
    return totalPages;
  }

  List<Book> get allBooksRead {
    List<Book> booksRead = [];
    this._books.forEach((element) {
      if (element.isCompleted == true) {
        booksRead.add(element);
      }
    });
    return booksRead;
  }

  List<Definition> get allDefinitions {
    List<Definition> allDefinitions = [];
    this._books.forEach((element) {});
    return allDefinitions;
  }

  String get longestBookRead {
    var longestBook = 'Test';
    // this._books.forEach((element) {
    //   if (element.isCompleted == true && element.pages > longestBook.pages) {
    //     longestBook = element;
    //     print('New Longest Book: ${element.title} - ${element.pages} pages');
    //   } else {
    //     longestBook = longestBook;
    //     print(
    //         'No new book: ${element.title} is still the longest book you have read with ${element.pages} pages');
    //   }
    // });
    // return longestBook.title;
    return longestBook;
  }

  String get favCategory {
    String category;
    this._books.forEach((element) {
      if (element.category == Category.Business) {
        category = 'Business';
      } else if (element.category == Category.Fiction) {
        category = 'Fiction';
      } else if (element.category == Category.Nonfiction) {
        category = 'Nonfiction';
      } else if (element.category == Category.SelfHelp) {
        category = 'Self-help';
      } else if (element.category == Category.Thriller) {
        category = 'Thriller';
      }
    });
    return category;
  }

  Future<void> fetchAndSetBooks() async {
    const url = 'https://mybooks-2e36f.firebaseio.com/books.json';
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Book> loadedBooks = [];
      extractedData.forEach((bookId, bookData) {
        loadedBooks.add(
          Book(
            id: bookId,
            imageUrl: bookData['imageUrl'],
            title: bookData['title'],
            author: bookData['author'],
            datePublished: bookData['datePublished'],
            isCompleted: bookData['isCompleted'],
            pages: bookData['pages'],
            category: bookData['category'],
            summary: bookData['summary'],
            definitions: bookData['definitions'],
            notes: bookData['notes'],
            ideas: bookData['ideas'],
          ),
        );
      });
      this._books = loadedBooks;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  void addNewBook(Book book) {
    const url = 'https://mybooks-2e36f.firebaseio.com/books.json';

    http
        .post(
      url,
      body: json.encode({
        'title': book.title,
        'author': book.author,
        'imageUrl': book.imageUrl,
        'pages': book.pages,
        'datePublished': book.datePublished,
        'isCompleted': book.isCompleted,
        'category': book.category,
        'summary': book.summary,
        'ideas': book.ideas,
        'notes': book.notes,
        'definitions': book.definitions,
      }),
    )
        .then((response) {
      final newBook = Book(
        id: json.decode(response.body)['name'],
        title: book.title,
        imageUrl: book.imageUrl,
        isCompleted: book.isCompleted,
        author: book.author,
        pages: book.pages,
        datePublished: book.datePublished,
        category: book.category,
        summary: book.summary,
        ideas: book.ideas,
        notes: book.notes,
        definitions: book.definitions,
      );
      this._books.add(newBook);
      print(json.decode(response.body));
      notifyListeners();
    });
  }
}
