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
  List<Session> _weeklySessionsList = [];

  List<Session> _sessions = [
    Session(
      isCompleted: true,
      totalPagesRead: 0,
      definitions: [],
      book: Book(
        id: DateTime.now().toString(),
        title: 'The Better Angels Of Our Nature',
        imageUrl: null,
        author: 'Steven Pinker',
        category: Category.Nonfiction,
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
        imageUrl: null,
        author: 'Steven Pinker',
        category: Category.Nonfiction,
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
        imageUrl: null,
        author: 'Dale Carnegie',
        category: Category.Nonfiction,
        datePublished: "Testing",
        pages: 248,
      ),
      duration: 47,
    ),
  ];

  List<Session> get allSessions {
    // return [...this._sessions];
    // return fetchAndSetAllSessions().then((value) {

    // });
  }

  int get totalSessionsMinutes {
    var totalSecs = 0;
    this._sessions.forEach((element) {
      totalSecs += element.duration;
    });

    return totalSecs;
  }

  Session getSingleSession(String id) {
    Session session = this._sessions.firstWhere((element) => element.id == id);
    print('Session ID: ${session.id}');
    return session;
  }

  Session getCurrentSession() {
    return this._sessions[0];
  }

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

  int get totalPagesRead {
    int totalPages = 0;
    this._sessions.forEach((element) {
      totalPages = totalPages += element.totalPagesRead;
    });
    return totalPages;
  }

  // Most Pages Read in a single session
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

  int get totalIdeas {
    int ideas = 0;
    this._sessions.forEach((element) {
      ideas = ideas += element.ideas.length;
    });
    return ideas;
  }

  int get totalNotes {
    int notes = 0;
    this._sessions.forEach((element) {
      notes = notes += element.notes.length;
    });
    return notes;
  }

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
      // this.notes.add(newNote);
    });

    // this.currentSession.notes.add(
    //       Note(
    //         title: note.title,
    //         body: note.body,
    //       ),
    //     );
    // print(this.currentSession.notes);
  }

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
      // this.ideas.add(newIdea);
    });
  }

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
      // this.definitions.add(newDefinition);
    });
  }

  void addNewSession(Session session) {
    const url = 'https://mybooks-2e36f.firebaseio.com/sessions.json';

    http
        .post(
      url,
      body: json.encode({
        'book': json.encode({
          'title': session.book.title,
          'author': session.book.author,
          'imageUrl': 'N/A',
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
        'start': session.start.toString(),
        'end': session.end.toString(),
        'running': session.running,
        'duration': session.duration,
        'status': session.status.toString(),
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
        totalPagesRead: session.totalPagesRead,
        notes: session.notes,
        definitions: session.definitions,
        ideas: session.ideas,
      );
      this._sessions.add(newSession);
      notifyListeners();
    });
  }

  void startNewSession(Session session) {
    session.newStatus = Status.Active;
    session.running = true;
    this.addNewSession(session);
  }

  Future<void> fetchAndSetAllSessions() async {
    const url = 'https://mybooks-2e36f.firebaseio.com/sessions.json';
    try {
      final List<Session> loadedSessions = [];
      final response = await http.get(url);
      print(json.decode(response.body));
      final extractedData = json.decode(response.body) as Map<String, dynamic>;

      extractedData.forEach((sessionId, sessionData) {
        loadedSessions.add(
          Session(
            id: sessionId,
            book: sessionData['book'],
            isCompleted: sessionData['isCompleted'],
            start: sessionData['start'],
            end: sessionData['end'],
            running: sessionData['running'],
            duration: sessionData['duration'],
            status: sessionData['status'],
            timestamp: sessionData['timestamp'],
            totalPagesRead: sessionData['totalPagesRead'],
            notes: sessionData['notes'],
            definitions: sessionData['definitions'],
            ideas: sessionData['ideas'],
          ),
        );
      });
      this._sessions = loadedSessions;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  List<Session> get printTodaysSessions {
    var now = DateTime.now();
    var twentyFourHoursAgo = now.subtract(Duration(hours: 24));
    const url =
        'https://mybooks-2e36f.firebaseio.com/sessions/todaysSessions.json';
    var todaysSessions = [];
    this._sessions.forEach((element) {
      var timestamp = element.timestamp;
      if (timestamp.hour <= twentyFourHoursAgo.hour ||
          timestamp.minute <= twentyFourHoursAgo.minute ||
          timestamp.second <= twentyFourHoursAgo.second) {
        todaysSessions.add(element);
      }
    });

    http
        .post(
      url,
      body: json.encode({DateTime.now().toLocal().toString(): todaysSessions}),
    )
        .then((response) {
      return response;
    });

    return todaysSessions;
  }
}
