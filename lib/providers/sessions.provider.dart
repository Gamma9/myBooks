import 'package:flutter/material.dart';
import 'package:mybooks/model/book.dart';
import 'package:mybooks/model/definition.dart';
import 'package:mybooks/model/idea.dart';
import 'package:mybooks/model/note.dart';
import 'package:mybooks/model/session.dart';
import 'package:mybooks/providers/auth.provider.dart';
import 'package:provider/provider.dart';

class SessionsProvider with ChangeNotifier {
  Session currentSession;
  List<Session> _sessions = [
    Session(
      isCompleted: true,
      start: 'Testing',
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
      start: 'Testing',
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
      start: 'Testing',
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
    return [...this._sessions];
  }

  Session getSingleSession(String id) {
    Session session = this._sessions.firstWhere((element) => element.id == id);
    print('Session ID: ${session.id}');
    return session;
  }

  List<Session> get recentReadingSessions {
    List<Session> recentSessions = this._sessions.sublist(0, 9);
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

  void addNewNote(Note note) {
    this.currentSession.notes.add(
          Note(
            title: note.title,
            body: note.body,
          ),
        );
    print(this.currentSession.notes);
  }

  void addNewIdea(Idea idea) {
    this.currentSession.ideas.add(
          Idea(
            title: idea.title,
            body: idea.body,
          ),
        );
  }

  void addNewDefinition(Definition def) {
    def.encounters++;
    this.currentSession.definitions.add(
          Definition(
            title: def.title,
            description: def.description,
            encounters: def.encounters,
          ),
        );
  }
}
