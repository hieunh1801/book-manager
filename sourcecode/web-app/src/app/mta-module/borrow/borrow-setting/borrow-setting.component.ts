import { Component, OnInit } from '@angular/core';
import { BaseComponent } from 'src/app/shared/components/base-component/base-component.component';
import { ActivatedRoute, Router } from '@angular/router';
import { AppComponent } from 'src/app/app.component';
import { BorrowService } from 'src/app/core/services/borrow.service';
import { RESOURCE, ACTION_FORM } from 'src/app/core/app-config';
import { FormArray, FormGroup, Validators } from '@angular/forms';
import { SystemParamService } from 'src/app/core/services/system-param.service';
import { CommonUtils } from 'src/app/shared/service/common-utils.service';
import { ValidationService } from 'src/app/shared/service/validation.service';

@Component({
  selector: 'app-borrow-setting',
  templateUrl: './borrow-setting.component.html'
})
export class BorrowSettingComponent extends BaseComponent implements OnInit {
  formSaveConfig = {
    id: [''],
    code: ['',[Validators.required]],
    name: ['',[Validators.required]],
    svalue: ['',[Validators.required]]
  }
  private formSave: FormArray;
  constructor(public actr: ActivatedRoute,
    public router: Router,
    private app: AppComponent,
    private systemParamService: SystemParamService) {
    super(actr, RESOURCE.USER, ACTION_FORM.SEARCH);
    this.setMainService(systemParamService);
    this.systemParamService.findAll().subscribe(res => {
      this.buildFormSave(res.data);
    });
    
  }

  ngOnInit() {
  }

  private buildFormSave(listEmp?: any) {
    let controls = new FormArray([]);

    if (listEmp && listEmp.length > 0) {
      for (const emp of listEmp) {
        const group = this.makeDefaultForm();
        group.patchValue(emp);
        controls.push(group);

        controls.setValidators(ValidationService.duplicateArray(['code'],'code','Không được trùng mã cấu hình'))
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

  saveOrUpdate() {
    let isSave = true;
    if (!CommonUtils.isValidForm(this.formSave)) {
      isSave = false;
    }

    if (isSave) {
      const formInput = {};
      formInput['lstParam'] = this.formSave.value;

      this.app.confirmMessage(null, () => {// on accepted
        this.systemParamService.saveOrUpdate(formInput)
          .subscribe(res => {
            if (this.systemParamService.requestIsSuccess(res)) {
              this.systemParamService.findAll().subscribe(res => {
                this.buildFormSave(res.data);
              });
            }
          });
      }, () => {
        // on rejected
      });
    }
  }
}
