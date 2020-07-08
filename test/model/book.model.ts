import { Definition } from "./definition.model";

enum Category {
  Nonfiction,
  Fiction,
  SelfHelp,
  Thriller,
  Business,
}

export class Book {
  constructor(
    public id: string,
    public title: string,
    public author: string,
    public imageUrl: string,
    public datePublished: string,
    public isCompleted: boolean,
    public category: Category,
    public categoryStr: string,
    public pages: number,
    public definitions: Definition[],
    public summary: string,
    public notes: string,
    public ideas: string
  ) {}
}
