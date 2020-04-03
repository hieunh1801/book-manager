import { Component, OnInit } from '@angular/core';
import { BaseComponent } from 'src/app/shared/components/base-component/base-component.component';
import { Router, ActivatedRoute } from '@angular/router';
import { RESOURCE, ACTION_FORM } from 'src/app/core/app-config';
import { BorrowService } from 'src/app/core/services/borrow.service';
import { FormArray, FormGroup } from '@angular/forms';
import { BookService } from 'src/app/core/services/book.service';
import { CommonUtils } from 'src/app/shared/service/common-utils.service';
import { AppComponent } from 'src/app/app.component';
import { MenuItem } from 'primeng/api';

@Component({
  selector: 'app-borrow-member-index',
  templateUrl: './borrow-member-index.component.html'
})
export class BorrowMemberIndexComponent extends BaseComponent implements OnInit {
  formConfig = {
    id: [''],
    memberCode: [''],
    memberName: [''],
    // fromDate: [''],
    // toDate: [''],
    dateOfBirth: [''],
    categoryId: [''],
    bookName: [''],
    status: [''],
    gender: [''],
    phoneNumber: [''],
    email: [''],
    address: ['']
  };
  items: MenuItem[];
  results: any;
  listMember: any;
  formSaveConfig = {
    id: [''],
    bookId: [''],
    memberId: [''],
    fromDate: [new Date().getTime()],
    toDate: [''],
    status: [1],
    bookName : ['']
  }
  listHistory: {};
  private formSave: FormArray;
  constructor(public actr: ActivatedRoute,
    public router: Router,
    private app: AppComponent,
    private bookService: BookService,
    private borrowService: BorrowService) {
    super(actr, RESOURCE.USER, ACTION_FORM.SEARCH);
    this.setMainService(borrowService);
    this.formSearch = this.buildForm({}, this.formConfig);
    this.processSearchBorrow();
    this.processSearchHistory(null);
  }

  ngOnInit() {
    this.items = [
      {
        label: 'Update', icon: 'pi pi-refresh', command: () => {

        }
      },
      {
        label: 'Delete', icon: 'pi pi-times', command: () => {

        }
      },
      { label: 'Angular.io', icon: 'pi pi-info', url: 'http://angular.io' },
      { separator: true },
      { label: 'Setup', icon: 'pi pi-cog', routerLink: ['/setup'] }
    ];
  }

  private buildFormSave(listEmp?: any) {
    let controls = new FormArray([]);

    if (listEmp && listEmp.length > 0) {
      for (const emp of listEmp) {
        const group = this.makeDefaultForm();
        group.patchValue(emp);
        controls.push(group);
      }
    } else {
      const group = this.makeDefaultForm();
      controls.push(group);
    }
    this.formSave = controls;
    console.log('save', this.formSave.value)
  }

  private makeDefaultForm(): FormGroup {
    const formGroup = this.buildForm({}, this.formSaveConfig);
    return formGroup;
  }

  public addRow(index: number, item: FormGroup) {
    const controls = this.formSave as FormArray;
    controls.insert(index + 1, this.makeDefaultForm());
  }

  public removeRow(index: number, item: FormGroup) {
    const controls = this.formSave as FormArray;
    if (controls.length === 1) {
      this.buildFormSave(null);
    }
    controls.removeAt(index);
  }

  private searchAutoComplete(event) {
    var data = {};
    data['name'] = event.query;
    this.bookService.seacrhAutoComplete(event.query).subscribe(res => {
      this.results = res.data;
    });
  }
  selectBook(item, event) {
    console.log('item', item)
    console.log('event', event)
    item.controls.bookId.setValue(event.id)
  }

  public processSearchHistory(event?): void {
    if (this.formSearch.controls.id && this.formSearch.controls.id.value) {
      const params = this.formSearch ? this.formSearch.value : null;
      var data = {};
      data['memberId'] = this.formSearch.controls.id.value;
      this.borrowService.searchHistory(data, event).subscribe(res => {
        this.listHistory = res;

      });

      if (!event) {
        if (this.dataTable) {
          this.dataTable.first = 0;
        }
      }
    }

  }

  public processSearchBorrow(event?): void {
    if (this.formSearch.controls.id && this.formSearch.controls.id.value) {
      const params = this.formSearch ? this.formSearch.value : null;
      var data = {};
      data['memberId'] = this.formSearch.controls.id.value;
      this.borrowService.searchBorrow(data, event).subscribe(res => {
        this.buildFormSave(res.data);
      });
    } else {
      this.buildFormSave();
    }

  }

  get f() {
    return this.formSearch.controls;
  }

  saveOrUpdate() {
    let isSave = true;
    if (!CommonUtils.isValidForm(this.formSave) && !CommonUtils.isValidForm(this.formSearch)) {
      isSave = false;
    }

    if (isSave) {
      const formInput = {};
      formInput['memberId'] = this.formSearch.controls.id.value;
      formInput['lstBorrow'] = this.formSave.value;
      this.app.confirmMessage(null, () => {// on accepted
        this.borrowService.saveOrUpdate(formInput)
          .subscribe(res => {
            if (this.borrowService.requestIsSuccess(res)) {
              this.processSearchHistory(null);
            }
          });
      }, () => {
        // on rejected
      });
    }
  }

  private searchMemberAutoComplete(event) {
    this.borrowService.searchMemberAutoComplete(event.query).subscribe(res => {
      this.listMember = res.data;
    });
  }

  selectMember(event) {
    this.formSearch = this.buildForm(event, this.formConfig);
    this.processSearchHistory();
    this.processSearchBorrow();
  }
}
