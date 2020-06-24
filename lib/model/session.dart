import 'package:flutter/material.dart';
import 'package:mybooks/model/book.dart';
import 'package:mybooks/model/definition.dart';
import 'package:mybooks/model/idea.dart';
import 'package:mybooks/model/note.dart';

enum Status { Active, Nonactive, Completed }

class Session {
  String id;
  Book book; // String id of corresponding book
  bool running;
  DateTime timestamp;
  DateTime start;
  DateTime end;
  int duration; // In Seconds for conversion
  int totalPagesRead = 0;
  bool isCompleted = false;
  Status status; // Is session active, completed, or not started
  Category category; // Book Category
  List<Idea> ideas;
  List<Note> notes;
  List<Definition> definitions;

  Session({
    @required this.id,
    @required this.book,
    @required this.duration,
    @required this.timestamp,
    @required this.totalPagesRead,
    @required this.isCompleted,
    @required this.status,
    @required this.start,
    @required this.end,
    @required this.running,
    this.ideas,
    this.notes,
    this.definitions,
  });

  String get bookTitle {
    return this.book.title;
  }

  String get sessionTimestamp {
    return this.timestamp.toString();
  }

  String get bookCategory {
    switch (this.category) {
      case Category.Nonfiction:
        {
          return 'Nonfiction';
        }
        break;
      case Category.Business:
        {
          return 'Business';
        }
        break;
      case Category.SelfHelp:
        {
          return 'Self-Help';
        }
        break;
      case Category.Thriller:
        {
          return 'Thriller';
        }
        break;
      case Category.Fiction:
        {
          return 'Fiction';
        }
        break;
      default:
        return 'N/A';
    }
  }

  String get bookStatus {
    switch (this.status) {
      case Status.Active:
        {
          return 'Active';
        }
        break;
      case Status.Completed:
        {
          return 'Completed';
        }
        break;
      case Status.Nonactive:
        {
          return 'Nonactive';
        }
        break;
      default:
        return 'N/A';
    }
  }

  void set newCategory(Category newCategory) {
    this.category = newCategory;
  }

  void set newStatus(Status newStatus) {
    this.status = newStatus;
  }

  void set endSession(DateTime halt) {
    this.end = halt;
  }
}
