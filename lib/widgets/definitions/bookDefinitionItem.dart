import 'package:flutter/material.dart';
import 'package:mybooks/model/definition.dart';

class BookDefinitionItem extends StatelessWidget {
  final Definition definition;

  BookDefinitionItem(this.definition);

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
                this.definition.title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('Encounters: ${this.definition.encounters.toString()}'),
            ],
          ),
          Text(this.definition.description)
        ],
      ),
    );
  }
}
