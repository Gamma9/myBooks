import 'package:flutter/material.dart';
import 'package:mybooks/model/book.dart';
import 'package:mybooks/widgets/books/booksList.dart';
import 'package:mybooks/widgets/books/booksSummary.dart';

class Books extends StatelessWidget {
  final List<Book> booksList = [
    Book(
      id: DateTime.now().toString(),
      title: 'The Better Angels Of Our Nature',
      imageUrl: null,
      author: 'Steven Pinker',
      category: Category.Nonfiction,
      // imageUrl: "",
      pages: 864,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          BooksSummary(),
          SizedBox(height: 16),
          Container(
            height: 325,
            child: BooksList(this.booksList),
          ),
        ],
      ),
    );
  }
}
