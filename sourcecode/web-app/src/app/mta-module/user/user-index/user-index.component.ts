import { Component, OnInit } from '@angular/core';
import { BaseComponent } from 'src/app/shared/components/base-component/base-component.component';
import { ActivatedRoute, Router } from '@angular/router';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { UserService } from 'src/app/core/services/user.service';
import { AppComponent } from 'src/app/app.component';
import { RESOURCE, ACTION_FORM } from 'src/app/core/app-config';
import { Validators } from '@angular/forms';
import { CommonUtils } from 'src/app/shared/service/common-utils.service';
import { DataTableModule } from 'primeng/primeng';

@Component({
  selector: 'app-user-index',
  templateUrl: './user-index.component.html'
})
export class UserIndexComponent extends BaseComponent implements OnInit {

  constructor(
    public actr: ActivatedRoute,
    public router: Router,
    private modalService: NgbModal,
    private userService: UserService,
    private app: AppComponent
  ) {
    super(actr, RESOURCE.USER, ACTION_FORM.SEARCH);
    this.setMainService(userService);
    this.formSearch = this.buildForm({}, {
      userCode: ['', [Validators.maxLength(50)]],
      fullName: ['', [Validators.maxLength(200)]],
    });
   }

  ngOnInit() {
    this.processSearch();
  }

  processSearch(event?): void {
    if (!CommonUtils.isValidForm(this.formSearch)) {
      return;
    }
    const params = this.formSearch ? this.formSearch.value : null;
    this.userService.getUserList(params, event).subscribe(res => {
      console.log('data', res);
      this.resultList = res;
    });
    if (!event) {
      if (this.dataTable) {
        this.dataTable.first = 0;
      }
    }
  }
}
