import { NgModule } from '@angular/core';
import { CommonModule, DatePipe } from '@angular/common';

import { MemberRoutingModule } from './member-routing.module';
import { MemberAddComponent } from './member-add/member-add.component';
import { MemberSearchComponent } from './member-search/member-search.component';
import { HttpClientModule } from "@angular/common/http";
import { DialogModule } from "primeng/dialog";
import { SharedModule } from "../../shared/shared.module";
@NgModule({
  declarations: [MemberAddComponent, MemberSearchComponent],
  imports: [
    CommonModule,
    MemberRoutingModule,
    DialogModule,
    SharedModule,
  ],
  providers: [DatePipe]
})
export class MemberModule { }
