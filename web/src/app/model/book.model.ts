import { Note } from "./note.model";
import { Idea } from "./idea.model";
import { Definition } from "./definition.model";
export class Book {
  constructor(
    public id: string,
    public title: string,
    public author: string,
    public imageUrl: string,
    public datePublished: string,
    public isCompleted: boolean,
    public category: string,
    public pages: number,
    public definitions: Definition[],
    public summary: string,
    public notes: Note[], // Change to actual Notes object type
    public ideas: Idea[] // Change to actual Ideas object type
  ) {}
}
