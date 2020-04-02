import { Component, OnInit } from '@angular/core';
import { BaseComponent } from 'src/app/shared/components/base-component/base-component.component';
import { ActivatedRoute, Router } from "@angular/router";
import { DialogModule } from "primeng/dialog";
import { BookService } from 'src/app/core/services/book.service';
import { FormGroup, Validators } from "@angular/forms";
import { AppComponent } from 'src/app/app.component';
import { CategoryService } from 'src/app/core/services/category.service';

@Component({
  selector: 'app-book-add',
  templateUrl: './book-add.component.html',
})
export class BookAddComponent extends BaseComponent implements OnInit {
  private formConfig = {
    id: [""],
    code: [""],
    name: ["", [Validators.required]],
    description: ["", [Validators.required]],
    author: ["", [Validators.required]],
    publisher: ["", [Validators.required]],
    amount: ["", [Validators.required]],
    categoryId: ["", [Validators.required]],
  };
  public listCategory: any = [];
  public idBook: any;
  public formSave: FormGroup;
  constructor(
    public activateRoute: ActivatedRoute,
    public router: Router,
    private app: AppComponent,
    private bookService: BookService,
    private categoryService: CategoryService
  ) {
    super(null);
    this.setMainService(bookService);
    this.formSave = this.buildForm({}, this.formConfig);

  }

  ngOnInit() {
    this.categoryService.getAllCategoriesWithoutPaginate().subscribe(data => {
      data.forEach(element => {
        this.listCategory.push({ value: element.id, label: element.name })
      });;
      this.activateRoute.params.subscribe(params => {
        if (params && params.id != null) {
          this.idBook = params.id;
          this.setFormValue(this.idBook);
        }
      });
    })

  }

  private setFormValue(id: number) {
    this.bookService.findOne(id).subscribe(response => {
      console.log("setFormValue", response)
      this.formSave = this.buildForm(response.data, this.formConfig);
      console.log(this.formSave.value);
    });
  }
  public processSaveOrUpdate() {
    console.log("input", this.formSave.value);
    this.app.confirmMessage(
      null,
      () => {
        const formInput = this.formSave.value;
        this.bookService.saveOrUpdate(formInput).subscribe(res => {
          console.log("Save success");
          if (this.bookService.requestIsSuccess(res)) {
            this.router.navigate(["/book-manager/books"]);
          }
        });
      },
      () => {
        // on rejected
      }
    );
  }

  public back() {
    this.router.navigate(["book-manager/books"]);
  }
  get f() {
    return this.formSave.controls;
  }

}

