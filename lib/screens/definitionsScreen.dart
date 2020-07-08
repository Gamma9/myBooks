import 'package:flutter/material.dart';

// Model
import 'package:mybooks/model/definition.dart';
import 'package:mybooks/providers/definitions.provider.dart';

// Widgets
import 'package:mybooks/widgets/definitions/bookDefinitionsList.dart';
import 'package:mybooks/widgets/misc/noDefinitions.dart';
import 'package:provider/provider.dart';

class DefinitionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Definitions'),
        centerTitle: true,
      ),
      body: BookDefinitionsList(),
    );
  }
}
