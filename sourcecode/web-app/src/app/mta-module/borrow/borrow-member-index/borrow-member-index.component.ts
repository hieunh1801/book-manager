import { Component, OnInit } from '@angular/core';
import { BaseComponent } from 'src/app/shared/components/base-component/base-component.component';
import { Router, ActivatedRoute } from '@angular/router';
import { RESOURCE, ACTION_FORM } from 'src/app/core/app-config';
import { BorrowService } from 'src/app/core/services/borrow.service';
import { FormArray, FormGroup } from '@angular/forms';

@Component({
  selector: 'app-borrow-member-index',
  templateUrl: './borrow-member-index.component.html',
  styleUrls: ['./borrow-member-index.component.sass']
})
export class BorrowMemberIndexComponent extends BaseComponent implements OnInit {
  formConfig ={
    memberId : [''],
    memberCode: [''],
    memberName: [''],
    fromDate :[''],
    toDate :[''],
    categoryId :[''],
    bookName :[''],
    status :[''],
  };
  
  results: any; 
  formSaveConfig = {
    id:      [''],
    bookId : [''],
    memberId :[''],
    formDate : [''],
    toDate : ['']
  }
  private formSave: FormArray;
  constructor( public actr: ActivatedRoute,
    public router: Router,
    private borrowService: BorrowService) {
      super(actr, RESOURCE.USER, ACTION_FORM.SEARCH);
      this.setMainService(borrowService);
      this.formSearch = this.buildForm({}, this.formConfig);
      this.buildFormSave();
  }

  ngOnInit() {
  }

  private buildFormSave(listEmp?: any) {
    let controls = new FormArray([]);
    
    if(listEmp && listEmp.length > 0) {
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
    // this.personService.findByCodeOrName(event.query).subscribe(res => {
    //     this.results = res.data;
    // });
}
}
