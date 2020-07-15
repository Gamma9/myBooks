import { BrowserModule } from "@angular/platform-browser";
import { NgModule } from "@angular/core";

import { AppRoutingModule } from "./app-routing.module";
import { MDBBootstrapModule } from "angular-bootstrap-md";
import { HttpClientModule } from "@angular/common/http";
import { FormsModule } from "@angular/forms";
import { AppComponent } from "./app.component";
import { HomeComponent } from './core/home/home.component';
import { HeaderComponent } from './shared/header/header.component';
import { FooterComponent } from './shared/footer/footer.component';
import { LibraryComponent } from './library/library.component';
import { UserProfileComponent } from './auth/user-profile/user-profile.component';
import { MainBooksComponent } from './core/main-books/main-books.component';
import { PageNotFoundComponent } from './shared/page-not-found/page-not-found.component';
import { MainBooksListComponent } from './core/main-books/main-books-list/main-books-list.component';
import { MainBooksItemComponent } from './core/main-books/main-books-item/main-books-item.component';
import { BooksListComponent } from './library/books-list/books-list.component';
import { BookItemComponent } from './library/book-item/book-item.component';
import { LibrarySummaryComponent } from './library/library-summary/library-summary.component';
import { UserBooksListComponent } from './auth/user-profile/user-books-list/user-books-list.component';
import { UserSummaryComponent } from './auth/user-profile/user-summary/user-summary.component';

@NgModule({
  declarations: [AppComponent, HomeComponent, HeaderComponent, FooterComponent, LibraryComponent, UserProfileComponent, MainBooksComponent, PageNotFoundComponent, MainBooksListComponent, MainBooksItemComponent, BooksListComponent, BookItemComponent, LibrarySummaryComponent, UserBooksListComponent, UserSummaryComponent],
  imports: [
    BrowserModule,
    AppRoutingModule,
    MDBBootstrapModule.forRoot(),
    HttpClientModule,
    FormsModule,
  ],
  providers: [],
  bootstrap: [AppComponent],
})
export class AppModule {}
