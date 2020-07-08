import 'package:flutter/material.dart';

// Models
import 'package:mybooks/model/book.dart';
import 'package:mybooks/screens/bookDetailScreen.dart';
import 'package:mybooks/widgets/misc/ratingStars.dart';

class BookItem extends StatelessWidget {
  final Book book;

  BookItem(this.book);

  void navToBookDetail(BuildContext context, Book book) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return BookDetailScreen(book);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              GestureDetector(
                child: Container(
                  height: 150,
                  width: 100,
                  child: Card(
                    elevation: 6,
                    child: this.book.imageUrl == null
                        ? Container(
                            color: Theme.of(context).primaryColorLight,
                            child: Center(
                              child: Icon(Icons.photo),
                            ),
                          )
                        : FittedBox(
                            fit: BoxFit.cover,
                            child: Image.network(this.book.imageUrl),
                          ),
                  ),
                ),
                onTap: () => navToBookDetail(context, this.book),
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: GestureDetector(
                  child: Card(
                    elevation: 2,
                    child: Container(
                      height: 150,
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            this.book.title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Text(
                            this.book.author,
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text('${this.book.pages.toString()} pages'),
                          Text(this.book.category == null
                              ? 'No Category'
                              : this.book.category.toString()),
                        ],
                      ),
                    ),
                  ),
                  onTap: () => navToBookDetail(context, this.book),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
