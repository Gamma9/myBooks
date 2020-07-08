import 'dart:async';
import 'dart:convert';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mybooks/model/book.dart';
import 'package:mybooks/model/definition.dart';
import 'package:mybooks/model/idea.dart';
import 'package:mybooks/model/note.dart';
import 'package:mybooks/model/session.dart';
import 'package:http/http.dart' as http;

class SessionsProvider with ChangeNotifier {
  Session currentSession;
  // List<Session> _weeklySessionsList = [];
  Timer currentTimer;
  Stopwatch stopwatch;
  var mondayValues;
  var tuesdayValues;
  var wednesdayValues;
  var thursdayValues;
  var fridayValues;
  var saturdayValues;
  var sundayValues;
  var avgPagesValue;
  var avgPagesPerMinValue;
  var sessionNum;

  List<Session> _sessions = [
    Session(
      isCompleted: true,
      totalPagesRead: 0,
      definitions: [],
      book: Book(
        id: DateTime.now().toString(),
        title: 'The Better Angels Of Our Nature',
        imageUrl:
            "https://catalystmagazine.net/wp-content/uploads/2013/11/Screen-Shot-2019-01-15-at-2.19.50-PM.png",
        author: 'Steven Pinker',
        category: 'nonfiction',
        datePublished: "Testing",
        pages: 864,
      ),
      duration: 67,
    ),
    Session(
      isCompleted: true,
      totalPagesRead: 32,
      definitions: [],
      book: Book(
        id: DateTime.now().toString(),
        title: 'The Better Angels Of Our Nature',
        imageUrl:
            "https://catalystmagazine.net/wp-content/uploads/2013/11/Screen-Shot-2019-01-15-at-2.19.50-PM.png",
        author: 'Steven Pinker',
        category: 'nonfiction',
        datePublished: "Testing",
        pages: 764,
      ),
      duration: 42,
    ),
    Session(
      isCompleted: true,
      totalPagesRead: 23,
      definitions: [],
      book: Book(
        id: DateTime.now().toString(),
        title: 'How To Win Friends & Influence People',
        imageUrl:
            "https://catalystmagazine.net/wp-content/uploads/2013/11/Screen-Shot-2019-01-15-at-2.19.50-PM.png",
        author: 'Dale Carnegie',
        category: 'nonfiction',
        datePublished: "Testing",
        pages: 248,
      ),
      duration: 47,
    ),
  ];

  // Array of all sessions
  List<Session> get allSessions {
    // this.fetchAndSetAllSessions();
    return [...this._sessions];
  }

  // Total minutes of all Sessions (Overall Sessions)
  int get totalSessionsMinutes {
    var totalSecs = 0;
    this._sessions.forEach((element) {
      totalSecs += element.duration;
    });

    return totalSecs;
  }

  // Returns a single session based on its ID
  Session getSingleSession(String id) {
    Session session = this._sessions.firstWhere((element) => element.id == id);
    print('Session ID: ${session.id}');
    return session;
  }

  // Returns the Session that has a Status.Active enum value
  Session getActiveSession() {
    Session session =
        this._sessions.firstWhere((element) => element.status == Status.Active);
    print(
        'Active Session:\nTitle: ${session.title}\nBook: ${session.book.title} ');
    return session;
  }

  String getSessionStatus() {
    Session session = this._sessions.firstWhere((element) {
      print(
          'Active Session:\nTitle: ${element.title}\nStatus: ${element.status} ');
    });
  }

  // Returns the current Session
  Session getCurrentSession() {
    // return this.currentSession;
    return this._sessions[0];
  }

  // Returns array of the last 7 Sessions
  List<Session> get recentReadingSessions {
    List<Session> recentSessions = this._sessions.sublist(0, 6);
    return recentSessions;
  }

  // Avg duration of start and stop values of timeer
  double get avgMins {
    double avgMins = 0.0;
    this._sessions.forEach((element) {
      avgMins = avgMins += element.duration;
    });
    return avgMins / this._sessions.length;
  }

  // Avg number of pages read
  double get avgPages {
    double avgPages = totalPagesRead / this._sessions.length;
    return avgPages;
  }

  // Avg Pages read per min
  double get avgPagesPerMin {
    double avgPages = 0.0;
    int pages;
    int duration; // in seconds
    this._sessions.forEach((element) {
      pages = element.totalPagesRead;
      duration = element.duration;
      avgPages = avgPages += (pages / (duration / 60));
    });
    return avgPages;
  }

  // Total Pages Read (Overall Sessions or Completed Books Pages)
  int get totalPagesRead {
    int totalPages = 0;
    this._sessions.forEach((element) {
      totalPages = totalPages += element.totalPagesRead;
    });
    return totalPages;
  }

  // Most Pages Read in a single session (Overall Sessions)
  int get mostPages {
    int pagesRead = 0;
    this._sessions.forEach((element) {
      if (element.totalPagesRead >= pagesRead) {
        pagesRead = element.totalPagesRead;
      } else {
        return;
      }
    });
    return pagesRead;
  }

  // Total Number Of Ideas (Session)
  int get totalIdeas {
    int ideas = 0;
    this._sessions.forEach((element) {
      ideas = ideas += element.ideas.length;
    });
    return ideas;
  }

  // Total Number of Notes (Session)
  int get totalNotes {
    int notes = 0;
    this._sessions.forEach((element) {
      notes = notes += element.notes.length;
    });
    return notes;
  }

  // Longest Book Read
  String get longestBookRead {
    Book longestBook;
    this._sessions.forEach((element) {
      if (element.book.pages <= longestBook.pages) {
        longestBook = longestBook;
      } else if (element.book.pages > longestBook.pages) {
        longestBook = element.book;
      }
    });
    return longestBook.title;
  }

  // Weekly Session Length Chart
  List<BarChartGroupData> weeklySessionLengthsData(
    BuildContext context,
  ) {
    List<BarChartGroupData> barChartGroupData = [];

    for (int i = 0; i < 6; i++) {
      var sessionData = BarChartGroupData(x: i, barRods: [
        BarChartRodData(y: 8, color: Theme.of(context).primaryColorLight)
      ], showingTooltipIndicators: [
        0
      ]);
      barChartGroupData.add(sessionData);
    }
    return barChartGroupData;
  }

  List<BarChartGroupData> weeklySessionLengthChart(BuildContext context) {
    final data = weeklySessionLengthsData(context);
    return data;
  }
  // Weekly Session Length Chart

  // Weekly Pages Read Chart
  List<BarChartGroupData> weeklyPagesReadChart(BuildContext context) {
    return weeklyPagesReadData(
      context,
    );
  }

  List<BarChartGroupData> weeklyPagesReadData(BuildContext context) {
    List<BarChartGroupData> barChartGroupData = [];

    for (int i = 0; i < 6; i++) {
      var sessionData = BarChartGroupData(x: i, barRods: [
        BarChartRodData(y: 11, color: Theme.of(context).primaryColorLight)
      ], showingTooltipIndicators: [
        0
      ]);
      barChartGroupData.add(sessionData);
    }
    return barChartGroupData;
  }
  // Weekly Pages Read Chart

  // Weekly Session Trends Charts
  List<BarChartGroupData> weeklySessionTrendsChart(BuildContext context) {
    return weeklySessionTrendsData(context);
  }

  List<BarChartGroupData> weeklySessionTrendsData(BuildContext context) {
    List<BarChartGroupData> barChartGroupData = [];

    for (int i = 0; i < 6; i++) {
      var sessionData = BarChartGroupData(x: i, barRods: [
        BarChartRodData(y: 7, color: Theme.of(context).primaryColorLight)
      ], showingTooltipIndicators: [
        0
      ]);
      barChartGroupData.add(sessionData);
    }
    return barChartGroupData;
  }
  // Weekly Session Trends Charts

  // Add New Note
  void addNewNote(Note note) {
    const url = 'https://mybooks-2e36f.firebaseio.com/notes.json';

    http
        .post(
      url,
      body: json.encode({
        'title': note.title,
        'body': note.body,
      }),
    )
        .then((response) {
      final newNote = Note(
        id: json.decode(response.body)['name'],
        title: note.title,
        body: note.body,
      );
      print(newNote);
      this.currentSession.notes.add(newNote);
      print(this.currentSession.notes);
    });
  }

  // Add New Idea to Current Session and Firebase DB
  void addNewIdea(Idea idea) {
    const url = 'https://mybooks-2e36f.firebaseio.com/ideas.json';

    http
        .post(
      url,
      body: json.encode({
        'title': idea.title,
        'body': idea.body,
      }),
    )
        .then((response) {
      final newIdea = Idea(
        id: json.decode(response.body)['name'],
        title: idea.title,
        body: idea.body,
      );
      print(newIdea);
      this.currentSession.ideas.add(newIdea);
      print(this.currentSession.notes);
    });
  }

  // Add New Definition to Current Session and Firebase DB
  void addNewDefinition(Definition def) {
    const url = 'https://mybooks-2e36f.firebaseio.com/definitions.json';
    def.encounters++;
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
      print(newDefinition);
      this.currentSession.definitions.add(newDefinition);
      print(this.currentSession.definitions);
    });
  }

  // Add New Session to Current Session
  void addNewSession(Session session) {
    const url = 'https://mybooks-2e36f.firebaseio.com/sessions.json';

    http
        .post(
      url,
      body: json.encode({
        'book': json.encode({
          'title': session.book.title,
          'author': session.book.author,
          'imageUrl': session.book.imageUrl,
          'pages': session.book.pages,
          'datePublished': session.book.datePublished,
          'category': session.book.category,
          'isCompleted': session.book.isCompleted,
          'summary': session.book.summary,
          'ideas': session.book.ideas,
          'notes': session.book.notes,
          'definitions': session.book.definitions,
        }),
        'isCompleted': session.isCompleted,
        'start': session.start,
        'end': session.end,
        'running': session.running,
        'duration': session.duration,
        'status': session.status,
        'timestamp': session.timestamp.toString(),
        'totalPagesRead': session.totalPagesRead,
        'notes': session.notes,
        'definitions': session.definitions,
        'ideas': session.ideas,
      }),
    )
        .then((response) {
      final newSession = Session(
        id: json.decode(response.body)['name'],
        book: session.book,
        isCompleted: session.isCompleted,
        start: session.start,
        end: session.end,
        running: session.running,
        duration: session.duration,
        status: session.status,
        timestamp: session.timestamp,
        category: session.category,
        title: session.title,
        totalPagesRead: session.totalPagesRead,
        notes: session.notes,
        definitions: session.definitions,
        ideas: session.ideas,
      );
      this._sessions.add(newSession);
      this.currentSession = newSession;
      notifyListeners();
    });
  }

  void startNewSession(Session session) {
    print(session.startWatch);
    this.addNewSession(session);
  }

  set toggleSessionStatus(String statusString) {
    if (statusString == 'active' ||
        statusString == 'nonactive' ||
        statusString == 'completed' ||
        statusString != null) {
      currentSession.status = statusString;
    }
  }

  Future<void> fetchAndSetAllSessions() async {
    const url = 'https://mybooks-2e36f.firebaseio.com/sessions.json';
    try {
      final List<Session> loadedSessions = [];
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      } else {
        extractedData.forEach((sessionId, sessionData) {
          final bookTitle = sessionData['book']['title'];
          print(bookTitle);

          final loadedSession = Session(
            id: sessionId,
            book: sessionData['book'],
            title: sessionData['title'],
            category: sessionData['category'],
            isCompleted: sessionData['isCompleted'],
            start: sessionData['start'],
            running: sessionData['running'],
            duration: sessionData['duration'],
            status: sessionData['status'],
            timestamp: DateTime.parse(sessionData['timestamp']),
            totalPagesRead: sessionData['totalPagesRead'],
            notes: sessionData['notes'],
            definitions: sessionData['definitions'],
            ideas: sessionData['ideas'],
          );

          loadedSessions.add(loadedSession);
        });
      }
      this._sessions = loadedSessions;
      notifyListeners();
    } catch (error) {
      print(error);
      throw (error);
    }
  }
}
