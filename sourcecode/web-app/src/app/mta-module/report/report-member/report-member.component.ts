import { Component, OnInit } from '@angular/core';
import { BaseComponent } from 'src/app/shared/components/base-component/base-component.component';
import { ActivatedRoute, Router } from '@angular/router';
import { BookService } from 'src/app/core/services/book.service';
import { Validators } from '@angular/forms';
import { MemberService } from 'src/app/core/services/member.service';
import { CommonUtils } from 'src/app/shared/service/common-utils.service';

@Component({
  selector: 'app-report-member',
  templateUrl: './report-member.component.html'
})
export class ReportMemberComponent extends BaseComponent implements OnInit {
  formConfig = {
    code: ["", [Validators.maxLength(50)]],
    fullName: ["", [Validators.maxLength(200)]]
  };
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
    this.processSearchReport();
  }


  public processSearchReport(event?): void {
    if (!CommonUtils.isValidForm(this.formSearch)) {
      return;
    }
    const params = this.formSearch ? this.formSearch.value : null;
    this.memberService.searchReport(params, event).subscribe(res => {
      this.resultList = res;
    });

    if (!event) {
      if (this.dataTable) {
        this.dataTable.first = 0;
      }
    }
  }
}
