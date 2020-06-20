import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Model
import 'package:mybooks/model/book.dart';
import 'package:mybooks/model/definition.dart';

class BooksProvider with ChangeNotifier {
  List<Book> _books = [
    // Book(
    //   id: DateTime.now().toString(),
    //   title: 'The Better Angels Of Our Nature',
    //   imageUrl: null,
    //   author: 'Steven Pinker',
    //   category: Category.Nonfiction,
    //   // imageUrl: "",
    //   datePublished: "Testing",
    //   pages: 864,
    // ),
    // Book(
    //   id: DateTime.now().toString(),
    //   title: 'The Laws Of Human Nature',
    //   imageUrl: null,
    //   author: 'Robert Greene',
    //   datePublished: "Testing",
    //   category: Category.Nonfiction,
    //   // imageUrl: "",
    //   pages: 864,
    // ),
    // Book(
    //   id: DateTime.now().toString(),
    //   title: 'Mastery',
    //   imageUrl: null,
    //   author: 'Robert Greene',
    //   datePublished: 'Testing',
    //   category: Category.Nonfiction,
    //   // imageUrl: "",
    //   pages: 864,
    // ),
  ];

  Book findById(String id) {
    return this._books.firstWhere((element) => element.id == id);
  }

  List<Book> get getAllBooks {
    return [...this._books];
  }

  List<Book> get getActiveBooks {
    List<Book> activeBooks = [];
    this._books.forEach((element) {
      if (element.status == Status.Active) {
        activeBooks.add(element);
      }
    });
    return activeBooks;
  }

  List<Book> get allBooksRead {
    List<Book> booksRead = [];
    this._books.forEach((element) {
      if (element.status == Status.Completed) {
        booksRead.add(element);
      }
    });
    return booksRead;
  }

  List<Definition> get allDefinitions {
    List<Definition> allDefinitions = [];
    this._books.forEach((element) {
      if (element.definitions != null) {
        // allDefinitions.add(element.definitions.);
      }
    });
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

        switch (bookData['status']) {
          case Status.Active:
            {
              bookStatus = 'Active';
            }
            break;
          case Status.Completed:
            {
              bookStatus = 'Completed';
            }
            break;
          case Status.Nonactive:
            {
              bookStatus = 'Nonactive';
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
            status: bookStatus,
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

    switch (book.status) {
      case Status.Active:
        {
          book.statusStr = 'Active';
        }
        break;
      case Status.Completed:
        {
          book.statusStr = 'Completed';
        }
        break;
      case Status.Nonactive:
        {
          book.statusStr = 'Nonactive';
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
        'status': book.statusStr,
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
        status: book.status,
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
