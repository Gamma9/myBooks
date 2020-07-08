import 'package:flutter/material.dart';
import 'package:mybooks/model/book.dart';
import 'package:mybooks/screens/newSessionScreen.dart';

class BookDetailScreen extends StatelessWidget {
  final Book book;

  BookDetailScreen(this.book);

  void startNewSession(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) {
        return NewSessionScreen(this.book);
      }),
    );
  }

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
              child: Container(
                height: 175,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Image.network(this.book.imageUrl),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          InkWell(
            splashColor: Theme.of(context).primaryColorLight,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 32, vertical: 0),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorDark,
                  borderRadius: BorderRadius.circular(16)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Start A New Session',
                    style: TextStyle(color: Colors.white),
                  ),
                  Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            onTap: () => startNewSession(context),
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
                  this.book.datePublished.isEmpty
                      ? 'No Published Date'
                      : this.book.datePublished.toString(),
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  this.book.category.toString(),
                ),
                Text('${this.book.pages.toString()} pages'),
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
                    child: this.book.ideas.isEmpty
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
                    child: this.book.notes.isEmpty
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
