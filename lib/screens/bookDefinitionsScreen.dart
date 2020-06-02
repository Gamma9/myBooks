import 'package:flutter/material.dart';

// Model
import 'package:mybooks/model/definition.dart';

// Widgets
import 'package:mybooks/widgets/definitions/bookDefinitionsList.dart';
import 'package:mybooks/widgets/misc/noDefinitions.dart';

class BookDefinitionsScreen extends StatelessWidget {
  final List<Definition> booksDefinitionsList = [
    Definition(
      id: "1",
      title: "Sporadic",
      definition: "Testing",
      encounters: 0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Definitions'),
        centerTitle: true,
      ),
      body: this.booksDefinitionsList.length <= 0
          ? NoDefinitions()
          : BookDefinitionsList(this.booksDefinitionsList),
    );
  }
}
