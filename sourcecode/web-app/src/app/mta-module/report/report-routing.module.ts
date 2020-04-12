import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { ReportBookComponent } from './report-book/report-book.component';
import { ReportMemberComponent } from './report-member/report-member.component';

const routes: Routes = [
  {
    path: "book",
    component: ReportBookComponent
  }
  ,{
    path: "member",
    component: ReportMemberComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class ReportRoutingModule { }
