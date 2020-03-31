import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

const routes: Routes = [
  {
    path: "user",
    loadChildren: "./user/user.module#UserModule"
  },
  {
    path: "borrow",
    loadChildren: "./borrow/borrow.module#BorrowModule"
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class MtaModuleRoutingModule { }
