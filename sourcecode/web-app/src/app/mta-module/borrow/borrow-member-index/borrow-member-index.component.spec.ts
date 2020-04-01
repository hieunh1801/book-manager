import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { BorrowMemberIndexComponent } from './borrow-member-index.component';

describe('BorrowMemberIndexComponent', () => {
  let component: BorrowMemberIndexComponent;
  let fixture: ComponentFixture<BorrowMemberIndexComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ BorrowMemberIndexComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(BorrowMemberIndexComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
