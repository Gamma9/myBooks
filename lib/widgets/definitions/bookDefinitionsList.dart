import 'package:flutter/material.dart';
import 'package:mybooks/model/definition.dart';
import 'package:mybooks/widgets/definitions/bookDefinitionItem.dart';

class BookDefinitionsList extends StatelessWidget {
  final List<Definition> bookDefinitionsList;

  BookDefinitionsList(this.bookDefinitionsList);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, index) => BookDefinitionItem(
        this.bookDefinitionsList[index].title,
        this.bookDefinitionsList[index].definition,
      ),
      itemCount: this.bookDefinitionsList.length,
    );
  }
}
