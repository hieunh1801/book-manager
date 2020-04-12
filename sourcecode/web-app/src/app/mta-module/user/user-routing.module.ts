import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { UserIndexComponent } from './user-index/user-index.component';
import { UserLoginComponent } from './user-login/user-login.component';

const routes: Routes = [
  {
    path: '',
    component: UserIndexComponent,
    pathMatch: 'prefix',
  }
  // , {
  //   path: 'login',
  //   component: UserLoginComponent,
  // }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class UserRoutingModule { }
