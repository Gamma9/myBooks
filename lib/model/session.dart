import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mybooks/model/book.dart';
import 'package:mybooks/model/definition.dart';
import 'package:mybooks/model/idea.dart';
import 'package:mybooks/model/note.dart';

enum Status { Active, Nonactive, Completed }

class Session {
  String id;
  Book book; // String id of corresponding book
  String title;
  bool running;
  Timer timer;
  Stopwatch stopwatch;
  DateTime timestamp;
  String start;
  String end;
  int duration;
  String durationStr; // In Seconds for conversion
  int totalPagesRead = 0;
  bool isCompleted = false;
  String status; // Is session active, completed, or not started
  Category category; // Book Category
  List<Idea> ideas;
  List<Note> notes;
  List<Definition> definitions;

  Session({
    @required this.id,
    @required this.book,
    @required this.title,
    @required this.duration,
    @required this.timer,
    @required this.stopwatch,
    @required this.timestamp,
    @required this.totalPagesRead,
    @required this.isCompleted,
    @required this.category,
    @required this.status,
    @required this.start,
    @required this.end,
    @required this.running,
    this.ideas,
    this.notes,
    this.definitions,
  }) {
    this.title = this.book.title;
  }

  String get sessionTimestamp {
    return this.timestamp.toString();
  }

  set newCategory(Category newCategory) {
    this.category = newCategory;
  }

  String get startWatch {
    this.stopwatch.start();
    this.start = DateTime.now().toString();
    this.running = true;
    this.duration = this.stopwatch.elapsed.inMinutes;
    final stopwatchStr = this.stopwatch.elapsed.inMinutes.toString();
    print('Start Time: ' +
        this.start +
        '\nTime Elapsed: ' +
        stopwatchStr +
        ' Minutes');
    return stopwatchStr;
  }

  String get endWatch {
    this.stopwatch.stop();
    this.end = DateTime.now().toString();
    this.duration = this.stopwatch.elapsed.inMinutes;
    final stopwatchStr = this.stopwatch.elapsed.inMinutes.toString();
    print('End Time: ' +
        this.end +
        '\nTime Elapsed: ' +
        stopwatchStr +
        ' Minutes');
    return stopwatchStr;
  }
}
