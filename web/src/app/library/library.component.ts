import { Component, OnInit } from "@angular/core";
import { LibraryService } from "../services/library.service";

@Component({
  selector: "app-library",
  templateUrl: "./library.component.html",
  styleUrls: ["./library.component.scss"],
})
export class LibraryComponent implements OnInit {
  constructor(private libraryService: LibraryService) {}

  ngOnInit(): void {}
}
