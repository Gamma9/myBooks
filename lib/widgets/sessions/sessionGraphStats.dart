import 'package:flutter/material.dart';
import 'package:mybooks/model/session.dart';
import 'package:mybooks/widgets/sessions/pagesReadGraph.dart';
import 'package:mybooks/widgets/sessions/sessionLengthChart.dart';
import 'package:mybooks/widgets/sessions/sessionsTrendingGraph.dart';

class SessionGraphStats extends StatefulWidget {
  // bool isLoading = false;

  @override
  _SessionGraphStatsState createState() => _SessionGraphStatsState();
}

class _SessionGraphStatsState extends State<SessionGraphStats> {
  String sessionGraph;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 16, horizontal: 0),
      color: Theme.of(context).primaryColor,
      elevation: 6,
      child: Container(
        padding: EdgeInsets.all(16),
        child: Row(
          children: <Widget>[
            Container(
              child: this.sessionGraph == 'sessionLength'
                  ? SessionLengthChart()
                  : this.sessionGraph == 'pagesRead'
                      ? PagesReadGraph()
                      : this.sessionGraph == 'sessionTrends'
                          ? SessionsTrendingGraph()
                          : SessionLengthChart(),
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    InkWell(
                      borderRadius: BorderRadius.circular(30),
                      splashColor: Theme.of(context).primaryColorDark,
                      child: CircleAvatar(
                        radius: this.sessionGraph == 'sessionLength' ? 14 : 18,
                        child: Icon(
                          Icons.timer,
                          size: this.sessionGraph == 'sessionLength' ? 16 : 24,
                          color: this.sessionGraph == 'sessionLength'
                              ? Colors.white
                              : Theme.of(context).primaryColor,
                        ),
                        backgroundColor: this.sessionGraph == 'sessionLength'
                            ? Theme.of(context).primaryColorDark
                            : Colors.white,
                      ),
                      onTap: () {
                        setState(() {
                          this.sessionGraph = 'sessionLength';
                        });
                        print(this.sessionGraph);
                      },
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(30),
                      splashColor: Theme.of(context).primaryColorDark,
                      child: CircleAvatar(
                        radius: this.sessionGraph == 'pagesRead' ? 14 : 18,
                        child: Icon(
                          Icons.bookmark_border,
                          size: this.sessionGraph == 'pagesRead' ? 16 : 24,
                          color: this.sessionGraph == 'pagesRead'
                              ? Colors.white
                              : Theme.of(context).primaryColorDark,
                        ),
                        backgroundColor: this.sessionGraph == 'pagesRead'
                            ? Theme.of(context).primaryColorDark
                            : Colors.white,
                      ),
                      onTap: () {
                        setState(() {
                          this.sessionGraph = 'pagesRead';
                        });
                        print(this.sessionGraph);
                      },
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(30),
                      splashColor: Theme.of(context).primaryColorDark,
                      child: CircleAvatar(
                        radius: this.sessionGraph == 'sessionTrends' ? 14 : 18,
                        child: Icon(
                          Icons.trending_up,
                          size: this.sessionGraph == 'sessionTrends' ? 16 : 24,
                          color: this.sessionGraph == 'sessionTrends'
                              ? Colors.white
                              : Theme.of(context).primaryColorDark,
                        ),
                        backgroundColor: this.sessionGraph == 'sessionTrends'
                            ? Theme.of(context).primaryColorDark
                            : Colors.white,
                      ),
                      onTap: () {
                        setState(() {
                          this.sessionGraph = 'sessionTrends';
                        });
                        print(this.sessionGraph);
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
