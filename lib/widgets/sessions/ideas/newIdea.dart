import 'package:flutter/material.dart';
import 'package:mybooks/model/idea.dart';
import 'package:mybooks/providers/sessions.provider.dart';
import 'package:provider/provider.dart';

class NewIdea extends StatefulWidget {
  final List<Idea> _ideas;

  NewIdea(this._ideas);
  @override
  _NewIdeaState createState() => _NewIdeaState();
}

class _NewIdeaState extends State<NewIdea> {
  final _newIdeaForm = GlobalKey<FormState>();
  final _bodyFocusNode = FocusNode();
  bool isTitleEnabled = true;
  String title;
  String body;

  @override
  Widget build(BuildContext context) {
    final sessionsProvider = Provider.of<SessionsProvider>(context);

    void addNewIdea(String title, String thoughtBody) {
      final newIdea = Idea(
        title: title,
        body: thoughtBody,
      );
      sessionsProvider.addNewIdea(newIdea);
      Navigator.of(context).pop();
    }

    return Container(
      padding: EdgeInsets.all(16),
      child: Form(
        key: this._newIdeaForm,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'New Idea',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: <Widget>[
                this.isTitleEnabled
                    ? Expanded(
                        child: TextFormField(
                          decoration:
                              InputDecoration(labelText: 'Thought Title'),
                          maxLength: 80,
                          onFieldSubmitted: (_) {
                            FocusScope.of(context)
                                .requestFocus(this._bodyFocusNode);
                          },
                          onSaved: (newTitle) => {
                            if (this.isTitleEnabled == true &&
                                    this.title != null ||
                                this.title == '')
                              {this.title = newTitle}
                            else if (this.isTitleEnabled == false)
                              {this.title = ''}
                            else
                              {},
                          },
                        ),
                      )
                    : SizedBox(
                        width: 0,
                      ),
                SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Do you want a title?'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        RaisedButton(
                          color: this.isTitleEnabled == true
                              ? Theme.of(context).primaryColor
                              : Colors.white,
                          textColor: this.isTitleEnabled == true
                              ? Colors.white
                              : Theme.of(context).primaryColor,
                          child: Text('Yes'),
                          onPressed: () {
                            setState(() {
                              this.isTitleEnabled = true;
                              print('Title is enabled!');
                            });
                          },
                        ),
                        RaisedButton(
                          child: Text('No'),
                          color: this.isTitleEnabled == false
                              ? Theme.of(context).primaryColor
                              : Colors.white,
                          textColor: this.isTitleEnabled == false
                              ? Colors.white
                              : Theme.of(context).primaryColor,
                          onPressed: () {
                            setState(() {
                              this.isTitleEnabled = false;
                              this.title = '';
                              print('Title has been disabled...');
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            TextFormField(
              maxLines: 5,
              autovalidate: true,
              focusNode: this._bodyFocusNode,
              decoration: InputDecoration(labelText: 'What\'s your thought?'),
              onSaved: (newBody) => {this.body = newBody},
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
                  child: Text('Submit'),
                  onPressed: () => {
                    this._newIdeaForm.currentState.save(),
                    addNewIdea(
                      this.title,
                      this.body,
                    )
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
