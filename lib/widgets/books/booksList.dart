import 'package:flutter/material.dart';

// Model
import 'package:mybooks/model/book.dart';

// Widgets
import 'package:mybooks/widgets/books/bookItem.dart';

class BooksList extends StatelessWidget {
  final List<Book> books;

  BooksList(this.books);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return BookItem(
          this.books[index],
        );
      },
      itemCount: this.books.length,
    );
  }
}
