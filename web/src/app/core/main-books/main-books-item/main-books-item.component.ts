import { Component, OnInit, Input } from "@angular/core";
import { Book } from "src/app/model/book.model";

@Component({
  selector: "app-main-books-item",
  templateUrl: "./main-books-item.component.html",
  styleUrls: ["./main-books-item.component.scss"],
})
export class MainBooksItemComponent implements OnInit {
  @Input() book: Book;
  constructor() {}

  ngOnInit(): void {}
}
