import { Component, OnInit } from "@angular/core";
import { Book } from "src/app/model/book.model";
import { LibraryService } from "src/app/services/library.service";

@Component({
  selector: "app-books-list",
  templateUrl: "./books-list.component.html",
  styleUrls: ["./books-list.component.scss"],
})
export class BooksListComponent implements OnInit {
  booksList: Book[];
  constructor(private libraryService: LibraryService) {}

  ngOnInit(): void {
    this.booksList = this.libraryService.allLibraryBooks;
  }
}
