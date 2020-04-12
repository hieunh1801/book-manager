import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ReportRoutingModule } from './report-routing.module';
import { ReportBookComponent } from './report-book/report-book.component';
import { ReportMemberComponent } from './report-member/report-member.component';
import { SharedModule } from 'src/app/shared/shared.module';

@NgModule({
  declarations: [ReportBookComponent, ReportMemberComponent],
  imports: [
    CommonModule,
    ReportRoutingModule,
    SharedModule
  ]
})
export class ReportModule { }
