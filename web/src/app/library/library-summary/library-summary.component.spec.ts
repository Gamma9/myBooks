import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { LibrarySummaryComponent } from './library-summary.component';

describe('LibrarySummaryComponent', () => {
  let component: LibrarySummaryComponent;
  let fixture: ComponentFixture<LibrarySummaryComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ LibrarySummaryComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(LibrarySummaryComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
