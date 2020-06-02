import 'package:flutter/material.dart';

// Widgets
import 'package:mybooks/model/book.dart';
import 'package:mybooks/widgets/books/bookItem.dart';

class MainBooksList extends StatelessWidget {
  final List<Book> books;

  MainBooksList(this.books);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return BookItem(this.books[index]);
      },
      itemCount: this.books.length,
    );
  }
}
