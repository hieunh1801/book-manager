import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { MtaModuleRoutingModule } from './mta-module-routing.module';
import { SharedModule } from '../shared/shared.module';

@NgModule({
  declarations: [],
  imports: [
    CommonModule,
    MtaModuleRoutingModule,
    SharedModule
  ]
})
export class MtaModuleModule { }
