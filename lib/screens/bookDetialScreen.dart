import 'package:flutter/material.dart';
import 'package:mybooks/model/book.dart';

class BookDetailScreen extends StatelessWidget {
  final Book book;

  BookDetailScreen(this.book);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Detail'),
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}
