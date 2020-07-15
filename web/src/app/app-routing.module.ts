import { NgModule } from "@angular/core";
import { Routes, RouterModule } from "@angular/router";

// Components
import { HomeComponent } from "./core/home/home.component";
import { MainBooksComponent } from "./core/main-books/main-books.component";
import { LibraryComponent } from "./library/library.component";
import { UserProfileComponent } from "./auth/user-profile/user-profile.component";
import { PageNotFoundComponent } from "./shared/page-not-found/page-not-found.component";

const routes: Routes = [
  { path: "", component: HomeComponent },
  { path: "mainBooks", component: MainBooksComponent },
  { path: "library", component: LibraryComponent },
  { path: "user", component: UserProfileComponent },
  // {path: 'login', component: LoginComponent}
  // {path: 'signup', component: SignupComponent}
  { path: "**", component: PageNotFoundComponent },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
})
export class AppRoutingModule {}
