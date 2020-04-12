import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { UserIndexComponent } from './user-index/user-index.component';
import { UserLoginComponent } from './user-login/user-login.component';
import { UserRoleComponent } from './user-role/user-role.component';

const routes: Routes = [
  {
    path: 'index',
    component: UserIndexComponent,
    pathMatch: 'prefix',
  }
  , {
    path: 'role',
    component: UserRoleComponent,
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class UserRoutingModule { }
