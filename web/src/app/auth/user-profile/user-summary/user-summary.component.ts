import { Component, OnInit, Input } from "@angular/core";
import { AuthService } from "src/app/services/auth.service";
import { User } from "src/app/model/user.model";

@Component({
  selector: "app-user-summary",
  templateUrl: "./user-summary.component.html",
  styleUrls: ["./user-summary.component.scss"],
})
export class UserSummaryComponent implements OnInit {
  @Input() currentUser: User;
  constructor(private authService: AuthService) {}

  ngOnInit(): void {}
}
