import 'package:flutter/material.dart';
import 'package:mybooks/model/book.dart';
import 'package:mybooks/providers/books.provider.dart';
import 'package:mybooks/widgets/books/booksList.dart';
import 'package:mybooks/widgets/books/booksSummary.dart';
import 'package:provider/provider.dart';

class Books extends StatefulWidget {
  @override
  _BooksState createState() => _BooksState();
}

class _BooksState extends State<Books> {
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });

      Provider.of<BooksProvider>(context).fetchAndSetBooks().then((_) => {});
      setState(() {
        _isLoading = false;
      });
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final booksProvider = Provider.of<BooksProvider>(context);
    final currentBooks = booksProvider.getAllBooks;
    return Container(
      margin: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          BooksSummary(),
          SizedBox(height: 16),
          Container(
            height: 325,
            child: this._isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : BooksList(currentBooks),
          ),
        ],
      ),
    );
  }
}
