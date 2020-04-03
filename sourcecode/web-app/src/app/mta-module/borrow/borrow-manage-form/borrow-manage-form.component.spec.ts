import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { BorrowManageFormComponent } from './borrow-manage-form.component';

describe('BorrowManageFormComponent', () => {
  let component: BorrowManageFormComponent;
  let fixture: ComponentFixture<BorrowManageFormComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ BorrowManageFormComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(BorrowManageFormComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
