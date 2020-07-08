import 'package:flutter/material.dart';
import 'package:mybooks/model/session.dart';
import 'package:mybooks/widgets/sessions/readingSessionsList.dart';
import 'package:mybooks/widgets/sessions/sessionGraphStats.dart';
import 'package:mybooks/widgets/sessions/mainStats/sessionMainStats.dart';

// Providers
import 'package:provider/provider.dart';
import 'package:mybooks/providers/sessions.provider.dart';

// Widgets
import 'package:mybooks/widgets/misc/noSessions.dart';

class ReadingSessionsScreen extends StatefulWidget {
  @override
  _ReadingSessionsScreenState createState() => _ReadingSessionsScreenState();
}

class _ReadingSessionsScreenState extends State<ReadingSessionsScreen> {
  bool _isLoading = false;
  bool _isInit = true;

  @override
  void initState() {
    // Provider.of<SessionsProvider>(context, listen: false)
    //     .fetchAndSetAllSessions();
    // Future.delayed(Duration.zero).then((_) => {
    //   Provider.of<SessionsProvider>(context).fetchAndSetAllSessions();
    // });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<SessionsProvider>(context)
          .fetchAndSetAllSessions()
          .then((value) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // final sessionsProvider = Provider.of<SessionsProvider>(context);
    // final sessions = sessionsProvider.allSessions;

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
                    Container(
                      height: 400,
                      child: ReadingSessionsList(),
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
