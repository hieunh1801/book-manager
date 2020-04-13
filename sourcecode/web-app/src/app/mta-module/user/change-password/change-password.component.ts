import { Component, OnInit } from '@angular/core';
import { BaseComponent } from 'src/app/shared/components/base-component/base-component.component';
import { FormGroup, Validators, FormBuilder } from '@angular/forms';
import { ActivatedRoute } from '@angular/router';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';
import { UserService } from 'src/app/core/services/user.service';
import { AppComponent } from 'src/app/app.component';
import { CommonUtils } from 'src/app/shared/service/common-utils.service';

@Component({
  selector: 'app-change-password',
  templateUrl: './change-password.component.html'
})
export class ChangePasswordComponent extends BaseComponent implements OnInit {
  formSave : FormGroup;
  isValid : boolean = false;
  formConfig : {
    id : [''],
    account : [''],
    oldPassword : [''],
    newPassword : [''],
    confirmPassword : [''],
  };
  constructor(public actr: ActivatedRoute,
    public activeModal: NgbActiveModal,
    private formBuilder: FormBuilder,
    public userService: UserService,
    private app: AppComponent) { 
    super(null);
    this.formSave = this.buildForm({}, this.formConfig);
  }

  ngOnInit() {
  }

  get f () {
    return this.formSave.controls;
  }

  public setFormValue(propertyConfigs: any, data?: any) {
    this.propertyConfigs = propertyConfigs;
    console.log('setFormValue',data)
    console.log('formConfig',this.formConfig)
    this.formSave = this.buildForm(data, {
      id : ['',[Validators.required]],
      account : ['',[Validators.required]],
      oldPassword : ['',[Validators.required]],
      newPassword : ['',[Validators.required]],
      confirmPassword : ['',[Validators.required]],
    });
  }

  processSaveOrUpdate() {
    if (!CommonUtils.isValidForm(this.formSave)) {
      return;
    }
    
    this.userService.changePassword(this.formSave.value)
      .subscribe(res => {
        if (this.userService.requestIsSuccess(res)) {
          this.activeModal.close(res);
        }
      });
  }

  changePass(){
    if(this.formSave.controls.newPassword.value == this.formSave.controls.confirmPassword.value){
      this.isValid = true;
    } else {
      this.isValid = false;
    }
  }
}
