import 'package:flutter/material.dart';
import 'package:mybooks/model/book.dart';

class NewBook extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  var bookPages = 0;
  Category bookCategory;

  saveForm(BuildContext ctx) {
    // Provider.of(ctx)
    print('Save form');
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
                    child: TextFormField(),
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
                    child: TextFormField(),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                // Row(
                //   children: <Widget>[
                //     Expanded(
                //         child: DropdownButton(
                //       value: this.bookCategory,
                //       hint: Text('Category'),
                //       icon: Icon(Icons.bookmark_border),
                //       onChanged: (newCategory) =>
                //           this.bookCategory = newCategory,
                //       items: [
                //         DropdownMenuItem(
                //           value: Category.Nonfiction,
                //         ),
                //       ],
                //     )),
                //     SizedBox(
                //       width: 16,
                //     ),
                //     DropdownButton(
                //       value: this.bookPages,
                //       icon: Icon(Icons.bookmark_border),
                //     )
                //   ],
                // ),
                Text(
                  'Description',
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
                      onPressed: () => this.saveForm(context),
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
