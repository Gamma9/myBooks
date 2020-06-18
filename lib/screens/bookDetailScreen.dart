import 'package:flutter/material.dart';
import 'package:mybooks/model/book.dart';

class BookDetailScreen extends StatelessWidget {
  final Book book;

  BookDetailScreen(this.book);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.book.title),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            child: Center(
              child: Icon(
                Icons.photo,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 32,
            ),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  this.book.title,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text(
                  this.book.author,
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  this.book.category.toString(),
                  style: TextStyle(fontSize: 14),
                ),
                Text(this.book.datePublished),
                Text(this.book.pages.toString()),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.star_border,
                      color: Colors.amber,
                    ),
                    Icon(
                      Icons.star_border,
                      color: Colors.amber,
                    ),
                    Icon(
                      Icons.star_border,
                      color: Colors.amber,
                    ),
                    Icon(
                      Icons.star_border,
                      color: Colors.amber,
                    ),
                    Icon(
                      Icons.star_border,
                      color: Colors.amber,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 32,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Ideas',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                  child: Container(
                    padding: EdgeInsets.all(16),
                    height: 100,
                    width: double.infinity,
                    child: this.book.ideas == null
                        ? Text('No ideas yet...')
                        : Text(this.book.ideas),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 32,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Notes',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                  child: Container(
                    padding: EdgeInsets.all(16),
                    height: 100,
                    width: double.infinity,
                    child: this.book.notes == null
                        ? Text('No notes yet...')
                        : Text(this.book.notes),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
