import 'package:flutter/material.dart';
import 'package:mybooks/model/session.dart';
import 'package:mybooks/widgets/sessions/readingSessionItem.dart';

class ReadingSessionsList extends StatelessWidget {
  final List<Session> sessions;

  ReadingSessionsList(this.sessions);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return ReadingSessionItem(this.sessions[index]);
      },
      itemCount: this.sessions.length,
    );
  }
}
