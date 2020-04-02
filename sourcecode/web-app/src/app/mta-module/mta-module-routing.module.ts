import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

const routes: Routes = [
  {
    path: "users",
    loadChildren: "./user/user.module#UserModule"
  },
  {
    path: "book-manager",
    loadChildren: "./book/book.module#BookModule"
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class MtaModuleRoutingModule { }
