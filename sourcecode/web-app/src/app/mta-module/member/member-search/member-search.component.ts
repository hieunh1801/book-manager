import { Component, OnInit } from '@angular/core';
import { BaseComponent } from 'src/app/shared/components/base-component/base-component.component';
import { ActivatedRoute, Router } from '@angular/router';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { BookService } from 'src/app/core/services/book.service';
import { AppComponent } from 'src/app/app.component';
import { RESOURCE, ACTION_FORM } from 'src/app/core/app-config';
import { Validators } from '@angular/forms';
import { CommonUtils } from 'src/app/shared/service/common-utils.service';
import { DataTableModule } from 'primeng/primeng';
import { MemberService } from 'src/app/core/services/member.service';

@Component({
  selector: 'app-member-search',
  templateUrl: './member-search.component.html',
  styleUrls: ['./member-search.component.sass']
})
export class MemberSearchComponent extends BaseComponent implements OnInit {

  formConfig = {
    code: [""],
    fullName: [""],
    gender: [""],
    email: [""],
    phoneNumber: [""],
    address: [""]
  };
  listGender = [
    {
      value: "", label: ""
    },
    {
      value: 1, label: "Nam"
    },
    {
      value: 0, label: "Nữ"
    },
  ]
  constructor(
    public actr: ActivatedRoute,
    public router: Router,
    private memberService: MemberService,
  ) {
    super(null);
    this.setMainService(memberService);
    this.formSearch = this.buildForm({}, this.formConfig);

  }

  ngOnInit() {
    console.log("This is CategorySearchComponent");
    this.processSearch();
  }

  public get f() {
    return this.formSearch.controls;
  }
  public prepareSaveOrUpdate(item?: any) {
    if (item == null) {
      this.router.navigateByUrl("members/add");
    } else {
      this.router.navigate(["members/edit", item]);
    }
  }


}
