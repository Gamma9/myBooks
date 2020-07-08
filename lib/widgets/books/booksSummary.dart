import 'package:flutter/material.dart';

// Providers
import 'package:mybooks/providers/library.provider.dart';
import 'package:mybooks/providers/definitions.provider.dart';

// Screens
import 'package:mybooks/screens/definitionsScreen.dart';
import 'package:provider/provider.dart';

class BooksSummary extends StatefulWidget {
  @override
  _BooksSummaryState createState() => _BooksSummaryState();
}

class _BooksSummaryState extends State<BooksSummary> {
  void navToDefinitions(ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (_) {
          return DefinitionsScreen();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final libraryProvider = Provider.of<LibraryProvider>(context);
    final definitionsProvider = Provider.of<DefinitionsProvider>(context);
    int totalBooksRead = libraryProvider.getAllBooks.length;
    int totalPagesRead = libraryProvider.totalPagesRead;
    int totalDefinitions = definitionsProvider.allDefinitions.length;
    String longestBookRead = libraryProvider.longestBookRead;
    String favCategory = libraryProvider.favCategory;
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).primaryColor,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Total Books Read'),
                    Text(totalBooksRead.toString()),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Total Pages Read'),
                    Text(
                      totalPagesRead <= 0 ? '0' : totalPagesRead.toString(),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Favorite Category'),
                    Text(
                      favCategory == null ? 'Start reading!' : favCategory,
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Longest Book Read'),
                    Text(longestBookRead),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Definitions',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Text(totalDefinitions == null
                            ? '0 Definitions'
                            : '${totalDefinitions.toString()} Defintions'),
                        SizedBox(
                          width: 8,
                        ),
                        InkWell(
                          splashColor: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(16),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                  color: Theme.of(context).primaryColor),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 32),
                            child: Text(
                              'View',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          onTap: () => navToDefinitions(context),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
