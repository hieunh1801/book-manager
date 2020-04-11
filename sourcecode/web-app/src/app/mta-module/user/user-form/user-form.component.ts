import { Component, OnInit } from '@angular/core';
import { Validators, FormGroup, FormBuilder } from '@angular/forms';
import { ValidationService } from '../../../shared/service/validation.service';
import { UserService } from '../../../core/services/user.service';
import { ActivatedRoute } from '@angular/router';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';
import { AppComponent } from '../../../app.component';
import { BaseComponent } from '../../../shared/components/base-component/base-component.component';
import { RESOURCE, ACTION_FORM } from '../../../core/app-config';
import { CommonUtils } from '../../../shared/service/common-utils.service';
import { UserToken } from '../../../core/models/user-token.model';
import { Storage } from '../../../shared/service/storage.service';
import { environment } from 'src/environments/environment';
import { FileControl } from 'src/app/core/models/file.control';

@Component({
  selector: 'app-user-form',
  templateUrl: './user-form.component.html',
  styleUrls: ['./user-form.component.css']
})
export class UserFormComponent extends BaseComponent implements OnInit {


  formSave: FormGroup;
  userInfo: UserToken;
  positionList: any;
  fileServer =  environment.serverUrl['file'];
  formConfig = {
    id: [''],
    account: ['', [Validators.required, Validators.maxLength(100)]],
    password: ['', [Validators.required, Validators.maxLength(100)]],
    fullName: ['', [Validators.required, Validators.maxLength(200)]],
    dateOfBirth: ['', [Validators.required]],
    gender: ['', [Validators.required]],
    email: ['', [Validators.maxLength(50)]],
    phoneNumber: ['', [Validators.maxLength(50)]],
    code: ['', [Validators.required]],
    roleId: [0],
    lstRoleId: [''],
    dateOfBirthStr:[''],
    avatarUrl :['https://nld.mediacdn.vn/zoom/700_438/2015/anonymous-1447907195159.jpg']
  };
  constructor(public actr: ActivatedRoute,
    public activeModal: NgbActiveModal,
    private formBuilder: FormBuilder,
    public userService: UserService,
    private app: AppComponent) {
      super(actr, RESOURCE.USER, ACTION_FORM.SEARCH);
      this.userInfo = Storage.getUserToken();
      // this.userService.getRoles().subscribe(res => {
      //   this.initListRole(res);
      // });
      this.formSave = this.buildForm({}, this.formConfig);
      this.formSave.addControl("file", new FileControl(null));
     }
  ngOnInit() {
  }

  /****************** CAC HAM COMMON DUNG CHUNG ****/
  get f () {
    return this.formSave.controls;
  }

  /**
   * setFormValue
   * param data
   */
  public setFormValue(propertyConfigs: any, data?: any) {
    this.propertyConfigs = propertyConfigs;
    if (data && data.id > 0) {
      if(data.avatarUrl ){
        data.avatarUrl = this.fileServer + data.avatarUrl;
      } else {
        data.avatarUrl = 'https://nld.mediacdn.vn/zoom/700_438/2015/anonymous-1447907195159.jpg'
      }
      this.formSave = this.buildForm(data, this.formConfig);
      this.formSave.addControl("file", new FileControl(null));
    }
  }

  /**
   * processSaveOrUpdate
   */
  processSaveOrUpdate() {
    if (!CommonUtils.isValidForm(this.formSave)) {
      return;
    }
    this.formSave.controls.dateOfBirthStr.setValue(this.formSave.controls.dateOfBirth.value);
    this.formSave.controls.dateOfBirth.setValue(null);
    this.userService.saveOrUpdateFormFile(this.formSave.value)
      .subscribe(res => {
        if (this.userService.requestIsSuccess(res)) {
          this.activeModal.close(res);
        }
      });
  //   this.app.confirmMessage(null, () => {// on accepted
  //     this.userService.saveOrUpdate(this.formSave.value)
  //     .subscribe(res => {
  //       console.log('save done')
  //       if (this.userService.requestIsSuccess(res)) {
  //         this.activeModal.close(res);
  //       }
  //     });
  //    }, () => {// on rejected
  //  });
  }

  initListRole(data) {
    this.positionList = [];
    if (data) {
        for (const item of data) {
          this.positionList.push({label: item.roleName, value: item.roleId});
        }
      } 
    }

    selectFile(event) {
      // this.selectedFiles = event.target.files;
      if (event.target.files.length === 0)
        return;
  
      var reader = new FileReader();
      reader.readAsDataURL(event.target.files[0]); 
      reader.onload = (_event) => { 
        this.formSave.controls['avatarUrl'].setValue(reader.result); 
      }
      this.formSave.controls['file'].setValue(event.target.files[0]);
      }
}
