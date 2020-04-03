import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { BorrowManageIndexComponent } from './borrow-manage-index.component';

describe('BorrowManageIndexComponent', () => {
  let component: BorrowManageIndexComponent;
  let fixture: ComponentFixture<BorrowManageIndexComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ BorrowManageIndexComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(BorrowManageIndexComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
