import 'package:flutter/material.dart';
import 'package:mybooks/model/book.dart';
import 'package:mybooks/widgets/books/bookItem.dart';

class BooksReadList extends StatelessWidget {
  final List<Book> booksRead;

  BooksReadList(this.booksRead);

  @override
  Widget build(BuildContext context) {
    return this.booksRead.length <= 0
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 64,
              ),
              Icon(
                Icons.do_not_disturb,
                size: 56,
              ),
              SizedBox(
                height: 16,
              ),
              Text('No Books Read'),
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
