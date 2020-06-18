import 'package:flutter/material.dart';

// Model
import 'package:mybooks/model/book.dart';

// Widgets
import 'package:mybooks/widgets/books/mainBooksList.dart';

class MainBooks extends StatelessWidget {
  final List<Book> booksList = [
    Book(
      id: DateTime.now().toString(),
      title: 'The Better Angels Of Our Nature',
      imageUrl: null,
      author: 'Steven Pinker',
      datePublished: "12/20/2011",
      category: Category.Nonfiction,
      pages: 864,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      child: this.booksList.length <= 0
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    minRadius: 36,
                    child: Icon(
                      Icons.book,
                      size: 32,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    'No Books',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          : MainBooksList(this.booksList),
    );
  }
}
