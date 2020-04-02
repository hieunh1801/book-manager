import { Component, OnInit } from '@angular/core';
import { BaseComponent } from 'src/app/shared/components/base-component/base-component.component';
import { ActivatedRoute, Router } from "@angular/router";
import { DialogModule } from "primeng/dialog";
import { BookService } from 'src/app/core/services/book.service';
import { FormGroup, Validators } from "@angular/forms";
import { AppComponent } from 'src/app/app.component';
import { CategoryService } from 'src/app/core/services/category.service';

@Component({
  selector: 'app-category-add',
  templateUrl: './category-add.component.html',
  styleUrls: ['./category-add.component.sass']
})
export class CategoryAddComponent extends BaseComponent implements OnInit {
  private formConfig = {
    id: [""],
    code: [""],
    name: ["", [Validators.required]],
    note: ["", [Validators.required]],
  };
  public idCategory: any;
  public formSave: FormGroup;
  constructor(
    public activateRoute: ActivatedRoute,
    public router: Router,
    private app: AppComponent,
    private categoryService: CategoryService
  ) {
    super(null);
    this.setMainService(categoryService);
    this.formSave = this.buildForm({}, this.formConfig);
  }

  ngOnInit() {
    this.activateRoute.params.subscribe(params => {
      if (params && params.id != null) {
        this.idCategory = params.id;
        this.setFormValue(this.idCategory);
      }
    });
  }

  private setFormValue(id: number) {
    this.categoryService.findOne(id).subscribe(response => {
      this.formSave = this.buildForm(response.data, this.formConfig);
    });
  }
  public processSaveOrUpdate() {
    this.app.confirmMessage(
      null,
      () => {
        const formInput = this.formSave.value;
        this.categoryService.saveOrUpdate(formInput).subscribe(res => {
          console.log("Save success");
          if (this.categoryService.requestIsSuccess(res)) {
            this.router.navigate(["/book-manager/categories"]);
          }
        });
      },
      () => {
        // on rejected
      }
    );
  }

  public back() {
    this.router.navigate(["book-manager/categories"]);
  }
  get f() {
    return this.formSave.controls;
  }
}
