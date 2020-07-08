import { Book } from "./book.model";
import { Definition } from "./definition.model";
import { Session } from "./session.model";

export class User {
  constructor(
    public id: string,
    public firstname: string,
    public lastname: string,
    public username: string,
    public books: Book[],
    public booksRead: Book[],
    public definitions: Definition[],
    public sessions: Session[],
    public favBook: string,
    public favCategory: string,
    public dob: string
  ) {}

  get totalBooksRead() {
    return this.booksRead.length;
  }

  get totalPages() {
    let pages = 0;
    for (let i = 0; i < this.booksRead.length; i++) {
      pages = pages += this.booksRead[i].pages;
      console.log(
        "Title: ${this.booksRead[i].title} - (${booksRead[i].pages})"
      );
    }
    console.log(pages);
    return pages;
  }

  get allSessions() {
    return [...this.sessions];
  }

  get allDefinitions() {
    return [...this.definitions];
  }

  // get longestBookRead {
  //   Book this.longestBookRead;
  //   this.booksRead.forEach((element) {
  //     if (element.pages > longestBook.pages) {
  //       return longestBook.pages = element.pages;
  //     } else if (element.pages <= longestBook.pages) {
  //       return longestBook.pages;
  //     }
  //     print(
  //         'Longest Book Read:\nTitle: ${longestBook.title}\nAuthor: ${longestBook.author}\nPages: ${longestBook.pages}');
  //     return longestBook.pages;
  //   });
  //   return longestBook;
  // }
}
