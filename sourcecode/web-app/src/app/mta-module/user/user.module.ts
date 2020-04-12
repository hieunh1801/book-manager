import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { UserRoutingModule } from './user-routing.module';
import { UserIndexComponent } from './user-index/user-index.component';
import { UserSearchComponent } from './user-search/user-search.component';
import { SharedModule } from 'src/app/shared/shared.module';
import { UserRoleComponent } from './user-role/user-role.component';
@NgModule({
  declarations: [UserIndexComponent, UserSearchComponent, UserRoleComponent],
  imports: [
    CommonModule,
    UserRoutingModule,
    SharedModule
  ],
  entryComponents:[]
})
export class UserModule { }
