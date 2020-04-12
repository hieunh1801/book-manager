import { Component, OnInit, AfterViewInit } from '@angular/core';
import { BaseComponent } from 'src/app/shared/components/base-component/base-component.component';
import { Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { BookService } from 'src/app/core/services/book.service';
import { CommonUtils } from 'src/app/shared/service/common-utils.service';

@Component({
  selector: 'app-report-book',
  templateUrl: './report-book.component.html'
})
export class ReportBookComponent extends BaseComponent implements OnInit {
  formConfig = {
    code: ["", [Validators.maxLength(50)]],
    name: ["", [Validators.maxLength(50)]],
    description: ["", [Validators.maxLength(50)]],
    author: ["", [Validators.maxLength(50)]],
    publisher: ["", [Validators.maxLength(50)]],
    amount: ["", [Validators.maxLength(50)]],
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
    this.processSearchReport();
  }


  public processSearchReport(event?): void {
    if (!CommonUtils.isValidForm(this.formSearch)) {
      return;
    }
    const params = this.formSearch ? this.formSearch.value : null;
    this.bookService.searchReport(params, event).subscribe(res => {
      this.resultList = res;
    });

    if (!event) {
      if (this.dataTable) {
        this.dataTable.first = 0;
      }
    }
  }
}
