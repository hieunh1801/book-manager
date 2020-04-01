import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { BookRoutingModule } from './book-routing.module';
import { BookSearchComponent } from './book-search/book-search.component';
import { BookAddComponent } from './book-add/book-add.component';
import { CategorySearchComponent } from './category-search/category-search.component';
import { CategoryAddComponent } from './category-add/category-add.component';
import { HttpClientModule } from "@angular/common/http";
import { DialogModule } from "primeng/dialog";
import { SharedModule } from "../../shared/shared.module";

@NgModule({
  declarations: [BookSearchComponent, BookAddComponent, CategorySearchComponent, CategoryAddComponent],
  imports: [
    CommonModule,
    BookRoutingModule,
    DialogModule,
    SharedModule,
    HttpClientModule

  ]
})
export class BookModule { }
