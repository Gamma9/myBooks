import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';

// Providers
import 'package:mybooks/providers/library.provider.dart';

// Model
import 'package:mybooks/model/book.dart';

// enum Category { Thriller, Business, Fiction, Nonfiction, Selfhelp }

class NewBook extends StatefulWidget {
  @override
  _NewBookState createState() => _NewBookState();
}

class _NewBookState extends State<NewBook> {
  final _titleFocusNode = FocusNode();
  final _authorFocusNode = FocusNode();
  final _summaryFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  bool isLoading = false;
  Book book = Book(
    id: '',
    title: '',
    author: '',
    datePublished: '',
    category: '',
    imageUrl: '',
    pages: 0,
  );

  List<String> categories = [
    "Nonfiction",
    "Fiction",
    "Thriller",
    "Business",
    "Selfhelp"
  ];

  void _showPageNumPicker() {
    showDialog<int>(
      context: context,
      builder: (BuildContext ctx) {
        return Card(
          margin: EdgeInsets.all(64),
          child: Container(
            child: new NumberPicker.integer(
              initialValue: this.book.pages,
              minValue: 0,
              maxValue: 2000,
              onChanged: (value) => setState(() {
                this.book.pages = value;
              }),
              highlightSelectedValue: true,
            ),
          ),
        );
      },
    ).then(
      (int value) {
        if (value != null) {
          setState(() {
            this.book.pages = value;
            return this.book.pages;
          });
        }
      },
    );
  }

  void _saveForm() {
    setState(() {
      this.isLoading = true;
      print('Loading...');
    });
    this._form.currentState.save();
    final Book book = Book(
      imageUrl: this.book.imageUrl,
      title: this.book.title,
      author: this.book.author,
      category: this.book.category,
      isCompleted: this.book.isCompleted,
      datePublished: this.book.datePublished,
      pages: this.book.pages,
      ideas: '',
      notes: '',
      summary: '',
      definitions: [],
    );
    Provider.of<LibraryProvider>(context, listen: false).addNewBook(book);
    this.isLoading = false;
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    this._authorFocusNode.dispose();
    this._summaryFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Book"),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: Form(
          key: this._form,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Theme.of(context).primaryColor),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 64, vertical: 0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 150,
                          child: this.book.imageUrl.isEmpty
                              ? Center(child: CircularProgressIndicator())
                              : FittedBox(
                                  fit: BoxFit.fill,
                                  child: Image.network(this.book.imageUrl),
                                ),
                        ),
                        TextFormField(
                          decoration:
                              InputDecoration(labelText: 'Image URL...'),
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (imageUrl) {
                            setState(() {
                              this.book.imageUrl = imageUrl;
                            });
                            FocusScope.of(context)
                                .requestFocus(this._titleFocusNode);
                          },
                          onSaved: (imageUrl) {
                            setState(() {
                              this.book.imageUrl = imageUrl;
                            });
                          },
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: this.book.category != null
                            ? Theme.of(context).primaryColor
                            : null,
                      ),
                      child: Text(
                        this.book.category.isEmpty
                            ? 'Pick category...'
                            : this.book.category,
                        style: TextStyle(
                            color: this.book.category != null
                                ? Colors.white
                                : null),
                      ),
                    ),
                    PopupMenuButton<Category>(
                      onSelected: (Category result) {
                        setState(() {
                          this.book.setCategory = result;
                        });
                      },
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuEntry<Category>>[
                        const PopupMenuItem<Category>(
                          value: Category.Fiction,
                          child: Text('Fiction'),
                        ),
                        const PopupMenuItem<Category>(
                          value: Category.Nonfiction,
                          child: Text('Nonfiction'),
                        ),
                        const PopupMenuItem<Category>(
                          value: Category.SelfHelp,
                          child: Text('Self Help'),
                        ),
                        const PopupMenuItem<Category>(
                          value: Category.Business,
                          child: Text('Business'),
                        ),
                        const PopupMenuItem<Category>(
                          value: Category.Thriller,
                          child: Text('Thriller'),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    RaisedButton(
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      child: Text('${this.book.pages} Pages'),
                      onPressed: () => this._showPageNumPicker(),
                    ),
                  ],
                ),
                Text(
                  'Title',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 8,
                ),
                Card(
                  margin: EdgeInsets.all(0),
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextFormField(
                      focusNode: _titleFocusNode,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context)
                            .requestFocus(this._authorFocusNode);
                      },
                      onSaved: (value) {
                        this.book.title = value;
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'Author',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 8,
                ),
                Card(
                  margin: EdgeInsets.all(0),
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextFormField(
                      focusNode: this._authorFocusNode,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context)
                            .requestFocus(this._summaryFocusNode);
                      },
                      onSaved: (value) {
                        this.book.author = value;
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'Summary',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 8,
                ),
                Card(
                  margin: EdgeInsets.all(0),
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextFormField(
                      maxLines: 5,
                      focusNode: this._summaryFocusNode,
                      textInputAction: TextInputAction.done,
                      onSaved: (value) {
                        this.book.summary = value;
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    RaisedButton(
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      child: Text("Submit"),
                      onPressed: () => this._saveForm(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// https://catalystmagazine.net/wp-content/uploads/2013/11/Screen-Shot-2019-01-15-at-2.19.50-PM.png
