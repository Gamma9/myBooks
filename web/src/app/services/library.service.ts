import { Injectable } from "@angular/core";
import { DUMMY_BOOKS_LIST } from "./../model/data/dummyData.data";
import { Book } from "../model/book.model";
import { HttpClient } from "@angular/common/http";

@Injectable({
  providedIn: "root",
})
export class LibraryService {
  // books: Book[] = [];
  books: Book[] = [...DUMMY_BOOKS_LIST];
  constructor(private http: HttpClient) {}

  get allLibraryBooks() {
    var libraryBooks = [];
    this.books.forEach((book) => {
      if (book.isCompleted === false) {
        libraryBooks.push(book);
      } else {
        return;
      }
    });
    return libraryBooks;
  }

  get allBooks() {
    return [...this.books];
  }

  get allBooksRead() {
    const booksReadList = [];
    this.books.forEach((book) => {
      if (book.isCompleted === true) {
        booksReadList.push(book);
      } else {
        return;
      }
    });
    return booksReadList;
  }

  addNewBook(newBook: Book) {
    const url = "https://mybooks-2e36f.firebaseio.com/books.json";
    this.http
      .post(url, {
        title: newBook.title,
        author: newBook.author,
        imageUrl: newBook.imageUrl,
        isCompleted: newBook.isCompleted,
        datePublished: newBook.datePublished,
        pages: newBook.pages,
        summary: newBook.summary,
        definitions: newBook.definitions,
        ideas: newBook.ideas,
        notes: newBook.notes,
        category: newBook.category,
      })
      .subscribe((res) => {
        // const newBook = new Book();
        this.books.push(newBook);
        console.log(res);
      });
  }
}
