import 'package:flutter/material.dart';
import 'package:mybooks/model/definition.dart';

class BookDefinitionItem extends StatelessWidget {
  final String bookTitle;
  final String bookDefinition;
  final int encounters;

  BookDefinitionItem(this.bookTitle, this.bookDefinition, this.encounters);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).primaryColor),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Test",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('Encounters: ${this.encounters.toString()}'),
            ],
          ),
          Text("Test")
        ],
      ),
    );
  }
}
