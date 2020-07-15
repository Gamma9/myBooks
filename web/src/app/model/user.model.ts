import { Definition } from "./definition.model";
import { Book } from "./book.model";
import { Session } from "./session.model";

export class User {
  constructor(
    public id: string,
    public imageUrl: string,
    public firstname: string,
    public lastname: string,
    public username: string,
    public books: Book[],
    public booksRead: Book[],
    public definitions: Definition[],
    public readingSessions: Session[],
    public favBook: string,
    public favCategory: string,
    public dob: string
  ) {}
}
