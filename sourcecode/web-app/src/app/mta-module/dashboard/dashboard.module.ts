import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { DashboardRoutingModule } from './dashboard-routing.module';
import { DashboardShellComponent } from './dashboard-shell/dashboard-shell.component';
import { DialogModule } from "primeng/dialog";
import { SharedModule } from "../../shared/shared.module";
import { CardModule } from 'primeng/card';
import { CalendarModule } from 'primeng/calendar';
import { ReactiveFormsModule } from '@angular/forms';
import { ButtonModule } from 'primeng/button';
import { DropdownModule } from 'primeng/dropdown';
@NgModule({
  declarations: [DashboardShellComponent],
  imports: [
    CommonModule,
    SharedModule,
    DialogModule,
    CardModule,
    CalendarModule,
    ReactiveFormsModule,
    ButtonModule,
    DropdownModule,
    DashboardRoutingModule,

  ]
})
export class DashboardModule { }
