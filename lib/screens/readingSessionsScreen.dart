import 'package:flutter/material.dart';
import 'package:mybooks/widgets/sessions/readingSessionsList.dart';
import 'package:mybooks/widgets/sessions/sessionGraphStats.dart';
import 'package:mybooks/widgets/sessions/sessionMainStats.dart';

// Providers
import 'package:provider/provider.dart';
import 'package:mybooks/providers/sessions.provider.dart';

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
          children: <Widget>[
            SessionGraphStats(),
            SessionMainStats(),
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
                    sessions.length <= 0
                        ? Center(
                            child: Text('No Sessions Completed'),
                          )
                        : Container(
                            height: 400,
                            child: ReadingSessionsList(sessions),
                          ),
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
    );
  }
}