import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { UserBooksListComponent } from './user-books-list.component';

describe('UserBooksListComponent', () => {
  let component: UserBooksListComponent;
  let fixture: ComponentFixture<UserBooksListComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ UserBooksListComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(UserBooksListComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
