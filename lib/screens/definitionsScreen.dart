import 'package:flutter/material.dart';

// Model
import 'package:mybooks/model/definition.dart';

// Widgets
import 'package:mybooks/widgets/definitions/bookDefinitionsList.dart';
import 'package:mybooks/widgets/misc/noDefinitions.dart';

class DefinitionsScreen extends StatelessWidget {
  final List<Definition> bookDefinitionsList = [
    Definition(
      id: "1",
      title: "Sporadic",
      description: "Testing",
      encounters: 0,
    ),
    Definition(
      id: "1",
      title: "Testing",
      description: "This is a test",
      encounters: 0,
    ),
    Definition(
      id: "1",
      title: "Sporadic",
      description: "Testing",
      encounters: 0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Definitions'),
        centerTitle: true,
      ),
      body: this.bookDefinitionsList.length <= 0
          ? NoDefinitions()
          : BookDefinitionsList(this.bookDefinitionsList),
    );
  }
}
