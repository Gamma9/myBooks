import 'package:flutter/material.dart';
import 'package:mybooks/model/definition.dart';
import 'package:mybooks/providers/definitions.provider.dart';
import 'package:mybooks/widgets/definitions/bookDefinitionItem.dart';
import 'package:mybooks/widgets/misc/noDefinitions.dart';
import 'package:provider/provider.dart';

class BookDefinitionsList extends StatelessWidget {
  // final List<Definition> bookDefinitionsList;

  // BookDefinitionsList(this.bookDefinitionsList);

  @override
  Widget build(BuildContext context) {
    final definitionsProvider = Provider.of<DefinitionsProvider>(context);
    final definitions = definitionsProvider.allDefinitions;
    return definitions.length <= 0
        ? NoDefinitions()
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return BookDefinitionItem(definitions[index]);
            },
            itemCount: definitions.length,
          );
  }
}
