import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { DashboardRoutingModule } from './dashboard-routing.module';
import { DashboardShellComponent } from './dashboard-shell/dashboard-shell.component';
import { DialogModule } from "primeng/dialog";
import { SharedModule } from "../../shared/shared.module";
import { CardModule } from 'primeng/card';
@NgModule({
  declarations: [DashboardShellComponent],
  imports: [
    CommonModule,
    SharedModule,
    DialogModule,
    CardModule,
    DashboardRoutingModule,

  ]
})
export class DashboardModule { }
