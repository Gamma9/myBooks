import 'package:flutter/material.dart';
import 'package:mybooks/model/book.dart';
import 'package:mybooks/widgets/books/bookItem.dart';
import 'package:mybooks/widgets/misc/noBooks.dart';

class BooksReadList extends StatelessWidget {
  final List<Book> booksRead;

  BooksReadList(this.booksRead);

  @override
  Widget build(BuildContext context) {
    return this.booksRead.length <= 0
        ? Column(
            children: <Widget>[
              SizedBox(
                height: 64,
              ),
              NoBooks()
            ],
          )
        : Container(
            height: 200,
            child: ListView.builder(
              itemBuilder: (ctx, index) {
                return BookItem(this.booksRead[index]);
              },
            ),
          );
  }
}
