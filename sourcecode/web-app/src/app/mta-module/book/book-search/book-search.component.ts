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
import { environment } from 'src/environments/environment';
@Component({
  selector: 'app-book-search',
  templateUrl: './book-search.component.html',
})
export class BookSearchComponent extends BaseComponent implements OnInit {
  fileServer = environment.serverUrl['file'];
  formConfig = {
    code: ["", [Validators.maxLength(10)]],
    name: ["", [Validators.maxLength(200)]],
    description: ["", [Validators.maxLength(500)]],
    author: ["", [Validators.maxLength(200)]],
    publisher: ["", [Validators.maxLength(200)]],
    amount: ["", [Validators.maxLength(10)]],
  };
  constructor(
    public actr: ActivatedRoute,
    public router: Router,
    private bookService: BookService,
  ) {
    super(null);
    this.setMainService(bookService);
    this.formSearch = this.buildForm({}, this.formConfig);
  }

  ngOnInit() {
    console.log("This is book search component");
    this.bookService.getBooks().subscribe(data => {
      console.log(data);
    })
    this.processSearch();
  }
  public get f() {
    return this.formSearch.controls;
  }
  public prepareSaveOrUpdate(item?: any) {
    if (item == null) {
      this.router.navigateByUrl("book-manager/books/add");
    } else {
      this.router.navigate(["book-manager/books/edit", item]);
    }
  }
}
