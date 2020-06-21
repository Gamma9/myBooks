import 'package:flutter/material.dart';
import 'package:mybooks/widgets/sessions/readingSessionsList.dart';
import 'package:mybooks/widgets/sessions/sessionMainStats.dart';

// Providers
import 'package:provider/provider.dart';
import 'package:mybooks/providers/sessions.provider.dart';
import 'package:mybooks/providers/books.provider.dart';

// Model
import 'package:mybooks/model/session.dart';

// Widgets

class ReadingSessionsScreen extends StatefulWidget {
  @override
  _ReadingSessionsScreenState createState() => _ReadingSessionsScreenState();
}

class _ReadingSessionsScreenState extends State<ReadingSessionsScreen> {
  @override
  Widget build(BuildContext context) {
    final sessionsProvider = Provider.of<SessionsProvider>(context);
    final sessions = sessionsProvider.allSessions;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Card(
              margin: EdgeInsets.symmetric(vertical: 16, horizontal: 0),
              color: Theme.of(context).primaryColor,
              elevation: 6,
              child: Container(
                height: 250,
                padding: EdgeInsets.all(16),
                width: double.infinity,
                child: Column(
                  children: <Widget>[Text('Test')],
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(0),
              color: Theme.of(context).primaryColorDark,
              elevation: 3,
              child: Container(
                height: 150,
                padding: EdgeInsets.all(16),
                width: double.infinity,
                child: SessionMainStats(),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Card(
              color: Theme.of(context).primaryColorLight,
              child: Container(
                height: 500,
                width: double.infinity,
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Reading Sessions',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    // this.sessions.allSessions.length
                    //     ? Center(
                    //         child: Text('No Sessions Completed'),
                    //       )
                    //     :
                    Container(
                        height: 400, child: ReadingSessionsList(sessions)),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 16,
            )
          ],
        ),
      ),

      // child: activeBooks.length <= 0 ? NoBooks() : MainBooksList(activeBooks),
    );
  }
}
