import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mybooks/model/definition.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class DefinitionsProvider with ChangeNotifier {
  List<Definition> _definitions = [];

  List<Definition> get allDefinitions {
    // this.fetchAndSetDefinitions();
    return [...this._definitions];
  }

  void addNewDefinition(Definition def) {
    const url = 'https://mybooks-2e36f.firebaseio.com/definitions.json';

    http
        .post(
      url,
      body: json.encode({
        'title': def.title,
        'description': def.description,
        'encounters': def.encounters,
      }),
    )
        .then((response) {
      final newDefinition = Definition(
        id: json.decode(response.body)['name'],
        title: def.title,
        description: def.description,
        encounters: def.encounters,
      );
      this._definitions.add(newDefinition);
      print(json.decode(response.body));
      notifyListeners();
    });
  }

  Future<void> fetchAndSetDefinitions() async {
    const url = 'https://mybooks-2e36f.firebaseio.com/definitions.json';
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Definition> loadedDefinitions = [];
      extractedData.forEach((definitionId, definitionData) {
        loadedDefinitions.add(
          Definition(
            id: definitionId,
            title: definitionData['title'],
            description: definitionData['description'],
            encounters: definitionData['encounters'],
          ),
        );
      });
      this._definitions = loadedDefinitions;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
}
