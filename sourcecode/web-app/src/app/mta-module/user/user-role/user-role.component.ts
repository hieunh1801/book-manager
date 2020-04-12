import { Component, OnInit } from '@angular/core';
import { FormArray, Validators, FormGroup } from '@angular/forms';
import { BaseComponent } from 'src/app/shared/components/base-component/base-component.component';
import { ActivatedRoute, Router } from '@angular/router';
import { AppComponent } from 'src/app/app.component';
import { ValidationService } from 'src/app/shared/service/validation.service';
import { UserRoleService } from 'src/app/core/services/user-role.service';
import { CommonUtils } from 'src/app/shared/service/common-utils.service';

@Component({
  selector: 'app-user-role',
  templateUrl: './user-role.component.html'
})
export class UserRoleComponent extends BaseComponent implements OnInit {
  formSaveConfig = {
    id: [''],
    code: ['',[Validators.required]],
    name: ['',[Validators.required]]
  }
  private formSave: FormArray;
  constructor(public actr: ActivatedRoute,
    public router: Router,
    private app: AppComponent,
    private userRoleService: UserRoleService) {
    super(null);
    this.setMainService(userRoleService);
    this.userRoleService.findAll().subscribe(res => {
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

        controls.setValidators(ValidationService.duplicateArray(['code'],'code','Không được trùng mã vai trò'))
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
      formInput['lstRole'] = this.formSave.value;

      this.app.confirmMessage(null, () => {// on accepted
        this.userRoleService.saveOrUpdate(formInput)
          .subscribe(res => {
            if (this.userRoleService.requestIsSuccess(res)) {
              this.userRoleService.findAll().subscribe(res => {
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
