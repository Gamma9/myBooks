import { Component, OnInit } from "@angular/core";

// Model
import { Book } from "./../../../model/book.model";

// Services
import { LibraryService } from "./../../../services/library.service";

@Component({
  selector: "app-main-books-list",
  templateUrl: "./main-books-list.component.html",
  styleUrls: ["./main-books-list.component.scss"],
})
export class MainBooksListComponent implements OnInit {
  booksList: Book[];
  constructor(private libraryService: LibraryService) {}

  ngOnInit(): void {
    this.booksList = this.libraryService.allBooks;
  }
}
