import { Injectable } from "@angular/core";
import { User } from "../model/user.model";

@Injectable({
  providedIn: "root",
})
export class AuthService {
  user: User;

  constructor() {}
}
