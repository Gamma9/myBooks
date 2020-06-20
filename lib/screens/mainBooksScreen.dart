import 'package:flutter/material.dart';

// Model
import 'package:mybooks/model/book.dart';
import 'package:mybooks/providers/books.provider.dart';

// Widgets
import 'package:mybooks/widgets/books/mainBooksList.dart';
import 'package:mybooks/widgets/misc/noBooks.dart';
import 'package:provider/provider.dart';

class MainBooks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final booksProvider = Provider.of<BooksProvider>(context);
    final activeBooks = booksProvider.getActiveBooks;
    return Container(
      margin: EdgeInsets.all(16),
      child: activeBooks.length <= 0 ? NoBooks() : MainBooksList(activeBooks),
    );
  }
}
