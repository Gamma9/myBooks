import { Component, OnInit, Input } from "@angular/core";
import { User } from "src/app/model/user.model";

@Component({
  selector: "app-user-books-list",
  templateUrl: "./user-books-list.component.html",
  styleUrls: ["./user-books-list.component.scss"],
})
export class UserBooksListComponent implements OnInit {
  @Input() currentUser: User;
  constructor() {}

  ngOnInit(): void {}
}
