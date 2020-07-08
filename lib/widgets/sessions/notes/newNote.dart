import 'package:flutter/material.dart';
import 'package:mybooks/model/note.dart';
import 'package:mybooks/providers/sessions.provider.dart';
import 'package:provider/provider.dart';

class NewNote extends StatefulWidget {
  final List<Note> _notes;

  NewNote(this._notes);

  @override
  _NewNoteState createState() => _NewNoteState();
}

class _NewNoteState extends State<NewNote> {
  final _newNoteForm = GlobalKey<FormState>();

  String title;

  String body;

  @override
  Widget build(BuildContext context) {
    final sessionsProvider = Provider.of<SessionsProvider>(context);
    // final notes = sessionsProvider.currentSession.notes;

    void addNewNote(String title, String body) {
      final newNote = Note(
        title: this.title,
        body: this.body,
      );
      sessionsProvider.addNewNote(newNote);
      Navigator.of(context).pop();
    }

    return Form(
      key: this._newNoteForm,
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'New Note',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'What\'s your note?'),
              maxLines: 5,
              onSaved: (noteBody) {
                this.body = noteBody;
              },
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
                  onPressed: () {
                    this._newNoteForm.currentState.save();
                    addNewNote(this.title, this.body);
                  },
                  child: Text('Submit'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
