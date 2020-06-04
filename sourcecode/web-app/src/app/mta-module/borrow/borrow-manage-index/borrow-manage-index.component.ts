import { Component, OnInit } from '@angular/core';
import { BaseComponent } from 'src/app/shared/components/base-component/base-component.component';
import { ActivatedRoute, Router } from '@angular/router';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { ACTION_FORM, RESOURCE } from 'src/app/core/app-config';
import { AppComponent } from 'src/app/app.component';
import { Validators } from '@angular/forms';
import { BorrowService } from 'src/app/core/services/borrow.service';
import { CategoryService } from 'src/app/core/services/category.service';

@Component({
  selector: 'app-borrow-manage-index',
  templateUrl: './borrow-manage-index.component.html'
})
export class BorrowManageIndexComponent extends BaseComponent implements OnInit {
  formConfig = {
    memberCode: ['', [Validators.maxLength(50)]],
    memberName: ['', [Validators.maxLength(200)]],
    // fromDate :[''],
    // toDate :[''],
    categoryId: [''],
    bookName: [''],
    status: [''],
  };
  lstCategory: [];
  lstStatus = [
    { id: 1, name: 'Chưa trả' }
    , { id: 2, name: 'Gia hạn' }
    , { id: 3, name: 'Đã trả' }
    , { id: 4, name: 'Quá hạn' }
  ]
  constructor(
    public actr: ActivatedRoute,
    public router: Router,
    private modalService: NgbModal,
    private categoryService: CategoryService,
    private borrowService: BorrowService,
    private app: AppComponent
  ) {
    super(actr, RESOURCE.USER, ACTION_FORM.SEARCH);
    this.setMainService(borrowService);
    this.formSearch = this.buildForm({}, this.formConfig);
    this.categoryService.findAll().subscribe(res => {
      this.lstCategory = res;
    });
  }

  ngOnInit() {
    this.processSearch(null);
  }


  get f() {
    return this.formSearch.controls;
  }
  prepareBorrow(item) {
    console.log('item', item)
    this.router.navigate(['/borrow/member'], { state: { data: item.memberId } });
  }

}
