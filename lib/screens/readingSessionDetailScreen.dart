import 'package:flutter/material.dart';
import 'package:mybooks/model/book.dart';
import 'package:mybooks/model/session.dart';
import 'package:mybooks/providers/sessions.provider.dart';
import 'package:mybooks/widgets/definitions/newDefinition.dart';
import 'package:mybooks/widgets/sessions/ideas/ideasList.dart';
import 'package:mybooks/widgets/sessions/ideas/newIdea.dart';
import 'package:mybooks/widgets/sessions/notes/newNote.dart';
import 'package:mybooks/widgets/sessions/notes/notesList.dart';
import 'package:provider/provider.dart';

class ReadingSessionDetailScreen extends StatefulWidget {
  final Session _session;

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
    final currentSession = sessionsProvider.getCurrentSession();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Session'),
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
                      currentSession.title,
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
                    currentSession.title,
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    currentSession.book.author,
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
                                  Text('Session #'),
                                  // Text(this.widget._session.id.substring(0, 5)),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text('Status'),
                                  Text(this.widget._session.status.toString()),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text('Category'),
                                  Text(
                                      this.widget._session.category.toString()),
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
                                  Text(
                                    (this.widget._session.totalPagesRead / 60)
                                        .round()
                                        .toString(),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text('Pages read'),
                                  Text(
                                    this
                                        .widget
                                        ._session
                                        .totalPagesRead
                                        .toString(),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text('Time Spent'),
                                  Text(
                                    '${this.widget._session.duration.toString()} mins',
                                  ),
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
