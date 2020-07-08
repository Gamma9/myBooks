import 'package:flutter/material.dart';
import 'package:mybooks/model/session.dart';
import 'package:mybooks/providers/sessions.provider.dart';
import 'package:mybooks/widgets/misc/noSessions.dart';
import 'package:mybooks/widgets/sessions/readingSessionItem.dart';
import 'package:provider/provider.dart';

class ReadingSessionsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sessionsProvider = Provider.of<SessionsProvider>(context);
    final sessions = sessionsProvider.allSessions;
    return sessions.length <= 0
        ? NoSessions()
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return ReadingSessionItem(sessions[index]);
            },
            itemCount: sessions.length,
          );
  }
}
