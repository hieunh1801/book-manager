import { Component, OnInit } from '@angular/core';
import { BaseComponent } from 'src/app/shared/components/base-component/base-component.component';
import { ActivatedRoute, Router } from '@angular/router';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { BookService } from 'src/app/core/services/book.service';
import { AppComponent } from 'src/app/app.component';
import { RESOURCE, ACTION_FORM } from 'src/app/core/app-config';
import { Validators } from '@angular/forms';
import { CommonUtils } from 'src/app/shared/service/common-utils.service';
import { DataTableModule } from 'primeng/primeng';
import { CategoryService } from 'src/app/core/services/category.service';

@Component({
  selector: 'app-category-search',
  templateUrl: './category-search.component.html',
  styleUrls: ['./category-search.component.sass']
})
export class CategorySearchComponent extends BaseComponent implements OnInit {
  formConfig = {
    code: ["", [Validators.maxLength(50)]],
    name: ["", [Validators.maxLength(50)]],
    note: ["", [Validators.maxLength(50)]],
  };
  constructor(
    public actr: ActivatedRoute,
    public router: Router,
    private categoryService: CategoryService,
  ) {
    super(null);
    this.setMainService(categoryService);
    this.formSearch = this.buildForm({}, this.formConfig);
  }

  ngOnInit() {
    console.log("This is CategorySearchComponent");
    this.processSearch();
  }
  public get f() {
    return this.formSearch.controls;
  }
  public prepareSaveOrUpdate(item?: any) {
    if (item == null) {
      this.router.navigateByUrl("book-manager/categories/add");
    } else {
      this.router.navigate(["book-manager/categories/edit", item]);
    }
  }
}
