import 'package:flutter/material.dart';
import 'package:mybooks/model/definition.dart';

class DefinitionsProvider with ChangeNotifier {
  List<Definition> _definitions = [];

  List<Definition> get getAllDefinitions {
    return [...this._definitions];
  }
}
