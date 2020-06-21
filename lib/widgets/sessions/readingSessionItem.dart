import 'package:flutter/material.dart';
import 'package:mybooks/model/session.dart';
import 'package:mybooks/screens/readingSessionDetailScreen.dart';

class ReadingSessionItem extends StatelessWidget {
  final Session session;

  ReadingSessionItem(this.session);

  void viewReadingSessionDetails(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return ReadingSessionDetailScreen(this.session);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).primaryColor, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            leading: this.session.duration != null
                ? CircleAvatar(
                    radius: 18,
                    child: Text(
                      this.session.duration.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  )
                : Icon(
                    Icons.access_time,
                    color: Theme.of(context).primaryColor,
                  ),
            title: Text(this.session.bookTitle),
            trailing: FlatButton(
              child: Text('VIEW'),
              onPressed: () => viewReadingSessionDetails(context),
            ),
          ),
        ),
        SizedBox(
          height: 16,
        )
      ],
    );
  }
}
