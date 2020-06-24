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
    return [...this._books];
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

  Book get longestBookRead {
    Book longestBook;
    this._books.forEach((element) {
      if (element.isCompleted == true && element.pages > longestBook.pages) {
        longestBook = element;
      }
    });
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
        var bookCategory;
        var bookStatus;
        switch (bookData['category']) {
          case Category.Nonfiction:
            {
              bookCategory = 'Nonfiction';
            }
            break;
          case Category.Business:
            {
              bookCategory = 'Business';
            }
            break;
          case Category.SelfHelp:
            {
              bookCategory = 'Self-Help';
            }
            break;
          case Category.Thriller:
            {
              bookCategory = 'Thriller';
            }
            break;
          case Category.Fiction:
            {
              bookCategory = 'Fiction';
            }
            break;
        }

        loadedBooks.add(
          Book(
            id: bookId,
            imageUrl: bookData['imageUrl'],
            title: bookData['title'],
            author: bookData['author'],
            datePublished: bookData['datePublished'],
            pages: bookData['pages'],
            category: bookCategory,
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

    switch (book.category) {
      case Category.Nonfiction:
        {
          book.categoryStr = 'Nonfiction';
        }
        break;
      case Category.Business:
        {
          book.categoryStr = 'Business';
        }
        break;
      case Category.SelfHelp:
        {
          book.categoryStr = 'Self-Help';
        }
        break;
      case Category.Thriller:
        {
          book.categoryStr = 'Thriller';
        }
        break;
      case Category.Fiction:
        {
          book.categoryStr = 'Fiction';
        }
        break;
    }

    http
        .post(
      url,
      body: json.encode({
        'title': book.title,
        'author': book.author,
        'imageUrl': 'Testing',
        'pages': book.pages,
        'datePublished': book.datePublished,
        'category': book.categoryStr,
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
