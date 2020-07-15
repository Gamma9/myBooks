import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { MainBooksListComponent } from './main-books-list.component';

describe('MainBooksListComponent', () => {
  let component: MainBooksListComponent;
  let fixture: ComponentFixture<MainBooksListComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ MainBooksListComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(MainBooksListComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
