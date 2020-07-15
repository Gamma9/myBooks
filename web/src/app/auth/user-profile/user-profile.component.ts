import { User } from "./../../model/user.model";
import { Component, OnInit } from "@angular/core";
import { DUMMY_USER } from "../../model/data/dummyData.data";
import { AuthService } from "../../services/auth.service";

@Component({
  selector: "app-user-profile",
  templateUrl: "./user-profile.component.html",
  styleUrls: ["./user-profile.component.scss"],
})
export class UserProfileComponent implements OnInit {
  // user: User;
  user: User = this.authService.user;

  constructor(private authService: AuthService) {}

  ngOnInit(): void {}
}
