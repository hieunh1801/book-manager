import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { MemberSearchComponent } from './member-search/member-search.component';
import { MemberAddComponent } from './member-add/member-add.component';

const routes: Routes = [
  {
    path: "",
    component: MemberSearchComponent
  },
  {
    path: "add",
    component: MemberAddComponent
  },
  {
    path: "edit/:id",
    component: MemberAddComponent
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class MemberRoutingModule { }
