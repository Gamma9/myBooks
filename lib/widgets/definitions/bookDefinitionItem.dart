import 'package:flutter/material.dart';
import 'package:mybooks/model/definition.dart';

class BookDefinitionItem extends StatelessWidget {
  final String bookTitle;
  final String bookDefinition;

  BookDefinitionItem(this.bookTitle, this.bookDefinition);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Test"),
              Text('Encounters: 0'),
            ],
          ),
          Text("Test")
        ],
      ),
    );
  }
}
