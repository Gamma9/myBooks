import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { MainBooksItemComponent } from './main-books-item.component';

describe('MainBooksItemComponent', () => {
  let component: MainBooksItemComponent;
  let fixture: ComponentFixture<MainBooksItemComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ MainBooksItemComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(MainBooksItemComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
