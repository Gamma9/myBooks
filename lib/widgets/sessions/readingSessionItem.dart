import 'package:flutter/material.dart';
import 'package:mybooks/model/session.dart';
import 'package:mybooks/screens/readingSessionDetailScreen.dart';

class ReadingSessionItem extends StatelessWidget {
  final Session session;

  ReadingSessionItem(this.session);
  void viewReadingSessionDetails(BuildContext ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(builder: (_) {
        return ReadingSessionDetailScreen(this.session);
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: this.session.running == true
                ? Theme.of(context).primaryColor
                : null,
            border: this.session.running == true
                ? null
                : Border.all(color: Theme.of(context).primaryColor, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            leading: this.session.duration != null
                ? CircleAvatar(
                    backgroundColor:
                        this.session.running == true ? Colors.white : null,
                    radius: 18,
                    child: Text(
                      this.session.duration.toString(),
                      style: TextStyle(
                          color: this.session.running == true
                              ? Theme.of(context).primaryColorDark
                              : Colors.white,
                          fontSize: 16),
                    ),
                  )
                : Icon(
                    Icons.access_time,
                    color: Theme.of(context).primaryColor,
                  ),
            title: Text(
              this.session.book.title.toString(),
              style: TextStyle(
                  color: this.session.running == true ? Colors.white : null),
            ),
            trailing: FlatButton(
              child: Text(
                'VIEW',
                style: TextStyle(
                    color: this.session.running == true ? Colors.white : null),
              ),
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
