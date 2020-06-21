import 'package:flutter/material.dart';
import 'package:mybooks/model/book.dart';
import 'package:mybooks/model/definition.dart';
import 'package:mybooks/model/idea.dart';
import 'package:mybooks/model/note.dart';

class Session {
  String id;
  Book book; // String id of corresponding book
  String start; //
  int duration; // In Seconds for conversion
  int totalPagesRead = 0;
  bool isCompleted = false;
  String end;
  List<Idea> ideas;
  List<Note> notes;
  List<Definition> definitions;

  Session({
    @required this.id,
    @required this.book,
    @required this.start,
    @required this.duration,
    @required this.totalPagesRead,
    @required this.isCompleted,
    this.end,
    this.ideas,
    this.notes,
    this.definitions,
  });

  String get bookTitle {
    return this.book.title;
  }
}
