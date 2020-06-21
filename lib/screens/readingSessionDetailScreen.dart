import 'package:flutter/material.dart';
import 'package:mybooks/model/book.dart';
import 'package:mybooks/model/session.dart';
import 'package:mybooks/providers/sessions.provider.dart';
import 'package:mybooks/widgets/definitions/newDefinition.dart';
import 'package:mybooks/widgets/sessions/ideasList.dart';
import 'package:mybooks/widgets/sessions/newIdea.dart';
import 'package:mybooks/widgets/sessions/newNote.dart';
import 'package:mybooks/widgets/sessions/notesList.dart';
import 'package:provider/provider.dart';

class ReadingSessionDetailScreen extends StatefulWidget {
  final Session _session;
  //  = Session(
  //   start: DateTime.now().toString(),
  //   book: Book(),
  //   end: '',
  //   isCompleted: false,
  //   duration: 0,
  //   totalPagesRead: 0,
  //   definitions: [],
  //   ideas: [],
  //   notes: [],
  // );

  ReadingSessionDetailScreen(this._session);

  @override
  _ReadingSessionDetailScreenState createState() =>
      _ReadingSessionDetailScreenState();
}

class _ReadingSessionDetailScreenState
    extends State<ReadingSessionDetailScreen> {
  int timer;
  final _form = GlobalKey<FormState>();

  void startAddNewDefinition(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewDefinition(this.widget._session.definitions);
        });
  }

  void startAddNewIdea(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewIdea(this.widget._session.ideas);
        });
  }

  void startAddNewNote(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewNote(this.widget._session.notes);
        });
  }

  @override
  Widget build(BuildContext context) {
    final sessionsProvider = Provider.of<SessionsProvider>(context);
    final totalSessionsNum = sessionsProvider.allSessions.length;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Session #${totalSessionsNum.toString()}'),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Container(
              height: 250,
              color: Theme.of(context).primaryColor,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '43 mins', // Have an updating clock here
                      style: TextStyle(color: Colors.white, fontSize: 42),
                    ),
                    Text(
                      this.widget._session.bookTitle,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        'Reading Session',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.green,
                        radius: 4,
                      ),
                    ],
                  ),
                  Text(
                    this.widget._session.bookTitle,
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    this.widget._session.book.author,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context).primaryColor,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text('Status'),
                                  Text('Active'),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text('Category'),
                                  Text('NonFiction'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context).primaryColor,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text('Pages/min.'),
                                  Text('0'),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text('Chapters'),
                                  Text('0'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ListTile(
                      title: Text(
                        'Definitions',
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: IconButton(
                        onPressed: () => startAddNewDefinition(context),
                        icon: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Card(
                    child: Container(
                      padding: EdgeInsets.all(16),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                this.widget._session.ideas == null
                                    ? 'Ideas (0)'
                                    : 'Ideas (${this.widget._session.ideas.length})',
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.add,
                                    color: Theme.of(context).primaryColor),
                                onPressed: () => startAddNewIdea(context),
                              ),
                            ],
                          ),
                          this.widget._session.ideas == null
                              ? Text('...')
                              : IdeasList(this.widget._session.ideas),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Container(
                      padding: EdgeInsets.all(16),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                this.widget._session.notes == null
                                    ? 'Notes (0)'
                                    : 'Notes (${this.widget._session.notes.length})',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.add,
                                    color: Theme.of(context).primaryColor),
                                onPressed: () => startAddNewNote(context),
                              ),
                            ],
                          ),
                          this.widget._session.notes == null
                              ? Text('...')
                              : NotesList(this.widget._session.notes),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
