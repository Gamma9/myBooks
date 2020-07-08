import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mybooks/model/book.dart';
import 'package:mybooks/model/session.dart';
import 'package:mybooks/model/session.dart' as Status;
import 'package:mybooks/providers/sessions.provider.dart';
import 'package:mybooks/screens/homeScreen.dart';
import 'package:mybooks/screens/readingSessionDetailScreen.dart';
import 'package:mybooks/screens/readingSessionsScreen.dart';
import 'package:provider/provider.dart';

class NewSessionScreen extends StatelessWidget {
  final Book book;

  NewSessionScreen(this.book);

  @override
  Widget build(BuildContext context) {
    final sessionsProvider = Provider.of<SessionsProvider>(context);
    final timestamp = DateTime.now();
    final newSession = Session(
      title: this.book.title,
      running: false,
      duration: 0,
      timestamp: timestamp,
      start: '',
      end: '',
      totalPagesRead: 0,
      stopwatch: new Stopwatch(),
      status: '',
      isCompleted: false,
      book: this.book,
      ideas: [],
      definitions: [],
      notes: [],
    );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('New Session'),
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
                      '0 mins', // Have an updating clock here
                      style: TextStyle(color: Colors.white, fontSize: 42),
                    ),
                    Text(
                      newSession.title,
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
                        'New Reading Session',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Text(
                    newSession.book.title,
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    newSession.book.author,
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
                                  Text('NEW')
                                  // Text(sessionsProvider.allSessions.length
                                  //     .toString()),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text('Pages'),
                                  Text(newSession.totalPagesRead.toString()),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text('Category'),
                                  Text(newSession.book.category.toString()),
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
                                  Text('Pages read'),
                                  Text(
                                    newSession.totalPagesRead.toString(),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text('Time Spent'),
                                  Text(
                                    '0 mins',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 32),
                  Center(
                    child: RaisedButton(
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        child: Text("Start New Session"),
                        onPressed: () {
                          sessionsProvider.startNewSession(newSession);
                          Navigator.of(context).pop();
                        }),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Center(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(newSession.book.title),
                          Text(newSession.book.author),
                          Text(newSession.book.category),
                          Text(newSession.book.pages.toString()),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
