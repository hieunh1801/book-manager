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
  },
  {
    path: "borrow",
    loadChildren: "./borrow/borrow.module#BorrowModule"
  },
  {
    path: "members",
    loadChildren: "./member/member.module#MemberModule"
  },
  {
    path: "report",
    loadChildren: "./report/report.module#ReportModule"
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class MtaModuleRoutingModule { }
