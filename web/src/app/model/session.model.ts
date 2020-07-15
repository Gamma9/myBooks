import { Note } from "./note.model";
import { Idea } from "./idea.model";
import { Book } from "./book.model";
import { Definition } from "./definition.model";
export class Session {
  constructor(
    public id: string,
    public book: Book,
    public title: string,
    public running: boolean,
    public timer: string,
    public stopwatch: string,
    public timestamp: Date,
    public start: string,
    public end: string,
    public duration: number,
    public durationStr: string,
    public totalPagesRead: number = 0,
    public isCompleted: boolean = false,
    public status: string,
    public category: string,
    public ideas: Idea[],
    public notes: Note[],
    public definitions: Definition[]
  ) {
    this.title = this.book.title;
  }

  get sessionTimestamp() {
    return this.timestamp.toString();
  }

  set newCategory(newCategory) {
    this.category = newCategory;
  }
}
