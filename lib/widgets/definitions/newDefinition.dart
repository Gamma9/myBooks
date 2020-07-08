import 'package:flutter/material.dart';
import 'package:mybooks/model/definition.dart';
import 'package:mybooks/providers/definitions.provider.dart';
import 'package:mybooks/providers/sessions.provider.dart';
import 'package:provider/provider.dart';

class NewDefinition extends StatefulWidget {
  final List<Definition> _definitions;

  NewDefinition(this._definitions);

  @override
  _NewDefinitionState createState() => _NewDefinitionState();
}

class _NewDefinitionState extends State<NewDefinition> {
  String title;
  String definition;
  final definitionFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    // final sessionsProvider = Provider.of<SessionsProvider>(context);
    final definitionsProvider = Provider.of<DefinitionsProvider>(context);

    void addNewDefinition(String title, String definition) {
      int encounters = 0;
      encounters++;
      final newDef = Definition(
        title: title,
        description: definition,
        encounters: encounters,
      );
      // sessionsProvider.currentSession.definitions.add(newDef);
      definitionsProvider.addNewDefinition(newDef);
    }

    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'New Definition',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Title',
            ),
            onSaved: (newTitle) => {this.title = newTitle},
            onFieldSubmitted: (_) =>
                FocusScope.of(context).requestFocus(this.definitionFocusNode),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Definition'),
            maxLines: 3,
            onSaved: (newDefinition) => {this.definition = newDefinition},
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              RaisedButton(
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                child: Text('Submit'),
                onPressed: () {
                  addNewDefinition(this.title, this.definition);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
