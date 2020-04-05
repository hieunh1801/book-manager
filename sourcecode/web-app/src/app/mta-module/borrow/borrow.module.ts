import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { BorrowRoutingModule } from './borrow-routing.module';
import { BorrowManageIndexComponent } from './borrow-manage-index/borrow-manage-index.component';
import { BorrowManageFormComponent } from './borrow-manage-form/borrow-manage-form.component';
import { SharedModule } from 'src/app/shared/shared.module';
import { BorrowMemberIndexComponent } from './borrow-member-index/borrow-member-index.component';
import { AutoCompleteModule, SplitButtonModule, CheckboxModule } from 'primeng/primeng';
import { BorrowSettingComponent } from './borrow-setting/borrow-setting.component';

@NgModule({
  declarations: [BorrowManageIndexComponent, BorrowManageFormComponent, BorrowMemberIndexComponent, BorrowSettingComponent],
  imports: [
    SharedModule,
    CommonModule,
    BorrowRoutingModule,
    AutoCompleteModule,
    SplitButtonModule,
    CheckboxModule
  ]
})
export class BorrowModule { }
