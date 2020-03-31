import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { BorrowRoutingModule } from './borrow-routing.module';
import { BorrowManageIndexComponent } from './borrow-manage-index/borrow-manage-index.component';
import { BorrowManageFormComponent } from './borrow-manage-form/borrow-manage-form.component';
import { SharedModule } from 'src/app/shared/shared.module';

@NgModule({
  declarations: [BorrowManageIndexComponent, BorrowManageFormComponent],
  imports: [
    SharedModule,
    CommonModule,
    BorrowRoutingModule
  ]
})
export class BorrowModule { }
