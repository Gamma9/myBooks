import 'package:flutter/material.dart';

// Model
// import 'package:mybooks/model/book.dart';

// Providers
import 'package:provider/provider.dart';
import 'package:mybooks/providers/library.provider.dart';

// Widgets
import 'package:mybooks/widgets/books/booksList.dart';
import 'package:mybooks/widgets/books/booksSummary.dart';
import 'package:mybooks/widgets/misc/noLoadedBooks.dart';

class LibraryScreen extends StatefulWidget {
  @override
  _LibraryScreenState createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
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

      Provider.of<LibraryProvider>(context).fetchAndSetBooks();
      setState(() {
        _isLoading = false;
      });
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final libraryProvider = Provider.of<LibraryProvider>(context);
    final currentBooks = libraryProvider.getAllBooks;
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
                : currentBooks.length <= 0
                    ? NoLoadedBooks()
                    : BooksList(currentBooks),
          ),
        ],
      ),
    );
  }
}
