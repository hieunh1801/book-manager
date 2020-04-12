import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { BorrowManageIndexComponent } from './borrow-manage-index/borrow-manage-index.component';
import { BorrowMemberIndexComponent } from './borrow-member-index/borrow-member-index.component';
import { BorrowSettingComponent } from './borrow-setting/borrow-setting.component';


const routes: Routes = [
  {
    path: 'member',
    component: BorrowMemberIndexComponent
  },
  {
    path: 'manage',
    component: BorrowManageIndexComponent
  },
  {
    path: 'setting',
    component: BorrowSettingComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class BorrowRoutingModule { }
