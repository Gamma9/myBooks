import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';

// Providers
import 'package:mybooks/providers/library.provider.dart';

// Model
import 'package:mybooks/model/book.dart';

class NewBook extends StatefulWidget {
  @override
  _NewBookState createState() => _NewBookState();
}

class _NewBookState extends State<NewBook> {
  final _authorFocusNode = FocusNode();
  final _summaryFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  Book book = Book(
    id: '',
    title: '',
    author: '',
    datePublished: '',
    category: null,
    imageUrl: '',
    pages: 0,
  );
  bool isLoading = false;
  Category bookCategory;

  List<Category> categories = [
    Category.Nonfiction,
    Category.SelfHelp,
    Category.Thriller,
    Category.Business,
    Category.Fiction,
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
                  height: 150,
                  decoration: BoxDecoration(
                    border: Border.all(color: Theme.of(context).primaryColor),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.photo,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    DropdownButton<Category>(
                      value: this.book.category,
                      hint: Text('Category'),
                      icon: Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (Category newValue) {
                        setState(() {
                          this.book.category = newValue;
                          print(this.book.category);
                        });
                      },
                      items: this.categories.map<DropdownMenuItem<Category>>(
                        (Category value) {
                          return DropdownMenuItem<Category>(
                            value: value,
                            child: Text(value.toString()),
                          );
                        },
                      ).toList(),
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
