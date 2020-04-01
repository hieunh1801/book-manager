import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { BookSearchComponent } from './book-search/book-search.component';
import { BookAddComponent } from './book-add/book-add.component';
import { CategorySearchComponent } from './category-search/category-search.component';
import { CategoryAddComponent } from './category-add/category-add.component';

const routes: Routes = [
  // Book
  {
    path: "books",
    component: BookSearchComponent
  },
  {
    path: "books/add",
    component: BookAddComponent
  },
  {
    path: "books/:id/edit",
    component: BookAddComponent
  },

  // Category
  {
    path: "categories",
    component: CategorySearchComponent
  },
  {
    path: "categories/add",
    component: CategoryAddComponent
  },
  {
    path: "categories/:id/edit",
    component: CategoryAddComponent
  },

];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class BookRoutingModule { }
