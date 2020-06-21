import 'package:flutter/material.dart';
import 'package:mybooks/model/book.dart';
import 'package:mybooks/providers/auth.provider.dart';

// Screens
import 'package:mybooks/screens/definitionsScreen.dart';
import 'package:provider/provider.dart';

class BooksSummary extends StatefulWidget {
  @override
  _BooksSummaryState createState() => _BooksSummaryState();
}

class _BooksSummaryState extends State<BooksSummary> {
  int totalBooksRead;
  int totalPagesRead;
  Category favoriteCategory;
  String longestBookRead;

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
    final authProvider = Provider.of<AuthProvider>(context);
    final user = authProvider.user;
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
                    Text(user.totalBooksRead.toString()),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Total Pages Read'),
                    Text(user.totalPages.toString()),
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
                      user.favCategory == null
                          ? 'Start reading!'
                          : user.favCategory.toString(),
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
                    Text(user.longestBookRead == null
                        ? 'No books read'
                        : user.longestBookRead.title),
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
                        Text(user.definitions == null
                            ? '0 Definitions'
                            : '${user.definitions.length} Defintions'),
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
