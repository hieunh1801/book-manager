import { Component, OnInit } from '@angular/core';
import { BaseComponent } from 'src/app/shared/components/base-component/base-component.component';
import { Router, ActivatedRoute } from '@angular/router';
import { RESOURCE, ACTION_FORM, APP_CONSTANTS } from 'src/app/core/app-config';
import { BorrowService } from 'src/app/core/services/borrow.service';
import { FormArray, FormGroup } from '@angular/forms';
import { BookService } from 'src/app/core/services/book.service';
import { CommonUtils } from 'src/app/shared/service/common-utils.service';
import { AppComponent } from 'src/app/app.component';
import { MenuItem } from 'primeng/api';
import { SystemParamService } from 'src/app/core/services/system-param.service';
import { MemberService } from 'src/app/core/services/member.service';
import { environment } from "../../../../environments/environment";

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
    address: [''],
    avatarUrl : [''],
  };
  selectedPay : [];
  items: MenuItem[];
  results: any;
  listMember: any;
  adjournTime : any =3;
  adjournDay : any =7;
  member : any;
  formSaveConfig = {
    id: [''],
    bookId: [''],
    memberId: [''],
    fromDate: [new Date().getTime()],
    toDate: [new Date().getTime()+ (1000 * 60 * 60 * 24 * 14)],
    status: [1],
    pay :[''],
    nameCode : [''],
    adjourn : [0]
  }
  listHistory: {};
  param : any;
  fileServer =  environment.serverUrl['file'];
  private formSave: FormArray;
  constructor(public actr: ActivatedRoute,
    public router: Router,
    private app: AppComponent,
    private memberService : MemberService,
    private bookService: BookService,
    private borrowService: BorrowService,
    private systemParamService: SystemParamService) {
    super(actr, RESOURCE.USER, ACTION_FORM.SEARCH);
    this.setMainService(borrowService);
    this.formSearch = this.buildForm({}, this.formConfig);
    
    this.processSearchBorrow();
    this.processSearchHistory(null);

    const state = this.router.getCurrentNavigation().extras.state;
    if(state && state.data){
      const memberId = state.data;
      this.memberService.findOne(memberId).subscribe(res => {
        this.member = res.data;
        if(res.data.avatarUrl ){
          res.data.avatarUrl = res.data.avatarUrl;
        } else {
          res.data.avatarUrl = 'https://nld.mediacdn.vn/zoom/700_438/2015/anonymous-1447907195159.jpg'
        }
       
        this.member['nameCode']=res.data.code+'-'+res.data.fullName;
        this.formSearch = this.buildForm(res.data, this.formConfig);
        this.processSearchBorrow();
        this.processSearchHistory(null);
      });
    } else {
      this.initFormSaveConfig();
    }
    console.log(new Date().getTime())
  }
  public initFormSaveConfig(){
    this.systemParamService.getParam().subscribe(res => {
      this.param = res.data;
      this.formSaveConfig = {
        id: [''],
        bookId: [''],
        memberId: [''],
        fromDate: [new Date().getTime()],
        toDate: [new Date().getTime()+ (1000 * 60 * 60 * 24 * parseInt(this.param[APP_CONSTANTS.SYSTEM_PARAM.SO_NGAY_MUON]))],
        status: [1],
        pay :[''],
        nameCode : [''],
        adjourn : [0]
      }
      this.buildFormSave();
    });
    
  }
  public initFormSaveConfigWithoutBuild(){
    this.systemParamService.getParam().subscribe(res => {
      this.param = res.data;
      this.formSaveConfig = {
        id: [''],
        bookId: [''],
        memberId: [''],
        fromDate: [new Date().getTime()],
        toDate: [new Date().getTime()+ (1000 * 60 * 60 * 24 * parseInt(this.param[APP_CONSTANTS.SYSTEM_PARAM.SO_NGAY_MUON]))],
        status: [1],
        pay :[''],
        nameCode : [''],
        adjourn : [0]
      }
    });
    
  }
  ngOnInit() {
    this.initFormSaveConfigWithoutBuild();
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
  }

  private makeDefaultForm(): FormGroup {
    const formGroup = this.buildForm({}, this.formSaveConfig);
    return formGroup;
  }

  public addRow(index: number, item: FormGroup) {
    const max = parseInt(this.param[APP_CONSTANTS.SYSTEM_PARAM.SO_SACH_MUON]);
    if(this.formSave.value  && (this.formSave.value.length  >= max)){
      this.app.warningMessage('Số sách được mượn tối đa: '+ max);
      return;
    }
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
    // console.log('this.data', this.selectedPay)
    // if(this.selectedPay && this.selectedPay.length > 0){
    //   this.selectedPay.forEach(x =>{

    //   })
    // }
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
              this.processSearchBorrow();
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
    if(event.avatarUrl){
      event.avatarUrl = this.fileServer + event.avatarUrl;
    } else {
      event.avatarUrl = 'https://nld.mediacdn.vn/zoom/700_438/2015/anonymous-1447907195159.jpg'
    }
    
    this.formSearch = this.buildForm(event, this.formConfig);
    this.processSearchHistory();
    this.processSearchBorrow();
  }

  handleData(event, item){
    console.log(event)
    if(event){
      item.controls['pay'].setValue(1);
    } else {
      item.controls['pay'].setValue(0);
    }
  }

  processAdjourn(item){
    if(item.controls['adjourn'].value >= parseInt(this.param[APP_CONSTANTS.SYSTEM_PARAM.SO_LAN_GIA_HAN])){
      this.app.warningMessage('Quá số lần gia hạn')
    } else {
      console.log('todate',new Date(item.controls['toDate'].value).getTime())
      item.controls['adjourn'].setValue(item.controls['adjourn'].value +1);
      item.controls['status'].setValue(2);
      item.controls['toDate'].setValue(new Date(item.controls['toDate'].value).getTime() + 1000 * 60 * 60 * 24 * parseInt(this.param[APP_CONSTANTS.SYSTEM_PARAM.SO_NGAY_GIA_HAN]))
      this.buildFormSave(this.formSave.value);
    }
  }
  changeFromDate(event,item){
    item.controls['toDate'].setValue(new Date(item.controls['fromDate'].value).getTime() + 1000 * 60 * 60 * 24 * parseInt(this.param[APP_CONSTANTS.SYSTEM_PARAM.SO_NGAY_MUON]))
    this.buildFormSave(this.formSave.value);
  }
}
