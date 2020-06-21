import 'package:flutter/material.dart';
import 'package:mybooks/model/definition.dart';
import 'package:provider/provider.dart';

class DefinitionsProvider with ChangeNotifier {
  List<Definition> _definitions = [
    Definition(
      title: 'Test',
      description: 'Testing Description for title test',
      encounters: 1,
    ),
    Definition(
      title: 'Test',
      description: 'Testing Description for title test',
      encounters: 1,
    ),
    Definition(
      title: 'Test',
      description: 'Testing Description for title test',
      encounters: 1,
    ),
  ];

  List<Definition> get getAllDefinitions {
    return [...this._definitions];
  }
}
