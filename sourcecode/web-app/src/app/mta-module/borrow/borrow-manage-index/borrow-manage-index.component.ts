import { Component, OnInit } from '@angular/core';
import { BaseComponent } from 'src/app/shared/components/base-component/base-component.component';
import { ActivatedRoute, Router } from '@angular/router';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { UserService } from 'src/app/core/services/user.service';
import { ACTION_FORM, RESOURCE } from 'src/app/core/app-config';
import { AppComponent } from 'src/app/app.component';
import { Validators } from '@angular/forms';

@Component({
  selector: 'app-borrow-manage-index',
  templateUrl: './borrow-manage-index.component.html',
  styleUrls: ['./borrow-manage-index.component.sass']
})
export class BorrowManageIndexComponent  extends BaseComponent implements OnInit {
  formConfig ={
    memberCode: ['', [Validators.maxLength(50)]],
    memberName: ['', [Validators.maxLength(200)]],
    fromDate :[''],
    toDate :[''],
    categoryId :[''],
    bookName :[''],
    status :[''],
  };
  lstCategory : [];
  lstStatus = [
    {id:1,name:'Chưa trả'}
    ,{id:2,name:'Gia hạn'}
    ,{id:3,name:'Đã trả'}
  ]
  constructor(
    public actr: ActivatedRoute,
    public router: Router,
    private modalService: NgbModal,
    private userService: UserService,
    private app: AppComponent
  ) {
    super(actr, RESOURCE.USER, ACTION_FORM.SEARCH);
    this.setMainService(userService);
    this.formSearch = this.buildForm({}, this.formConfig);
   }

  ngOnInit() {
  }

  
  get f () { 
    return this.formSearch.controls;
  }

}
