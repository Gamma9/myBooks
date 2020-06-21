import 'package:flutter/material.dart';
import 'package:mybooks/model/session.dart';
import 'package:mybooks/widgets/sessions/sessionItem.dart';

class SessionsList extends StatelessWidget {
  final List<Session> sessions;

  SessionsList(this.sessions);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return SessionItem();
      },
      itemCount: this.sessions.length,
    );
  }
}
