import { Book } from "./book.model";
import { Definition } from "./definition.model";
import { Idea } from "./idea.model";
import { Note } from "./note.model";

enum Status {
  Active,
  Nonactive,
  Completed,
}

export class Session {
  constructor(
    public id: string,
    public book: Book, // or string id of book
    public title: string,
    public duration: string, // In Seconds for conversion
    public timer: string,
    public stopwatch: string,
    public timestamp: string,
    public totalPagesRead: number = 0,
    public isCompleted: boolean = false,
    public category: string, // Book Category
    public status: string, // Is session active, completed, or non-active
    public start: string,
    public end: string,
    public running: boolean,
    public ideas: Idea[],
    public notes: Note[],
    public definitions: Definition[]
  ) {
    title = book.title;
    category = book.category.toString();
  }

  //  get sessionTimestamp {
  //   return this.timestamp.toString();
  // }

  set newCategory(newCategory) {
    this.category = newCategory;
  }

  // get startWatch {
  //   this.stopwatch.start();
  //   this.start = DateTime.now().toString();
  //   this.running = true;
  //   this.duration = this.stopwatch.elapsed.inMinutes;
  //   final stopwatchStr = this.stopwatch.elapsed.inMinutes.toString();
  //   console.log('Start Time: ' +
  //       this.start +
  //       '\nTime Elapsed: ' +
  //       stopwatchStr +
  //       ' Minutes');
  //   return stopwatchStr;
  // }

  // get endWatch {
  //   this.stopwatch.stop();
  //   this.end = DateTime.now().toString();
  //   this.duration = this.stopwatch.elapsed.inMinutes;
  //   final stopwatchStr = this.stopwatch.elapsed.inMinutes.toString();
  //   console.log('End Time: ' +
  //       this.end +
  //       '\nTime Elapsed: ' +
  //       stopwatchStr +
  //       ' Minutes');
  //   return stopwatchStr;
  // }
}
