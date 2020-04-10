import { Component, OnInit } from '@angular/core';
import { BaseComponent } from 'src/app/shared/components/base-component/base-component.component';
import { ActivatedRoute, Router } from "@angular/router";
import { DialogModule } from "primeng/dialog";
import { BookService } from 'src/app/core/services/book.service';
import { FormGroup, Validators } from "@angular/forms";
import { AppComponent } from 'src/app/app.component';
import { CategoryService } from 'src/app/core/services/category.service';
import { FileControl } from 'src/app/core/models/file.control';
import { environment } from 'src/environments/environment';

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
    imageUrl : ['https://xemnha247.com/images/noimage.png']
  };
  fileServer =  environment.serverUrl['file'];
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
    this.formSave.addControl("file", new FileControl(null));
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
      if(response.data.imageUrl ){
        response.data.imageUrl = this.fileServer + response.data.imageUrl;
      } else {
        response.data.imageUrl = 'https://xemnha247.com/images/noimage.png'
      }
      console.log("setFormValue", response)
      this.formSave = this.buildForm(response.data, this.formConfig);
      console.log(this.formSave.value);
      this.formSave.addControl("file", new FileControl(null));
    });
  }
  public processSaveOrUpdate() {
    console.log("input", this.formSave.value);
    this.app.confirmMessage(
      null,
      () => {
        const formInput = this.formSave.value;
        this.bookService.saveOrUpdateFormFile(formInput).subscribe(res => {
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
  selectFile(event) {
    // this.selectedFiles = event.target.files;
    if (event.target.files.length === 0)
      return;

    var reader = new FileReader();
    reader.readAsDataURL(event.target.files[0]); 
    reader.onload = (_event) => { 
      this.formSave.controls['imageUrl'].setValue(reader.result); 
    }
    this.formSave.controls['file'].setValue(event.target.files[0]);
    }
}

