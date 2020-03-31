import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { BorrowManageIndexComponent } from './borrow-manage-index/borrow-manage-index.component';


const routes: Routes = [{
  path: 'manage',
  component: BorrowManageIndexComponent
}];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class BorrowRoutingModule { }
