import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { UserRoutingModule } from './user-routing.module';
import { UserIndexComponent } from './user-index/user-index.component';
import { SharedModule } from 'src/app/shared/shared.module';
import { UserSearchComponent } from './user-search/user-search.component';
import { UserFormComponent } from './user-form/user-form.component';
@NgModule({
  declarations: [UserIndexComponent, UserSearchComponent,UserFormComponent],
  imports: [
    CommonModule,
    UserRoutingModule,
    SharedModule
  ],
  entryComponents:[UserFormComponent]
})
export class UserModule { }
