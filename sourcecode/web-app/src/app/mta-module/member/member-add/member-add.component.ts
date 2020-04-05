import { Component, OnInit } from '@angular/core';
import { BaseComponent } from 'src/app/shared/components/base-component/base-component.component';
import { ActivatedRoute, Router } from "@angular/router";
import { DialogModule } from "primeng/dialog";
import { BookService } from 'src/app/core/services/book.service';
import { FormGroup, Validators } from "@angular/forms";
import { AppComponent } from 'src/app/app.component';
import { CategoryService } from 'src/app/core/services/category.service';
import { MemberService } from 'src/app/core/services/member.service';
@Component({
  selector: 'app-member-add',
  templateUrl: './member-add.component.html',
  styleUrls: ['./member-add.component.sass']
})
export class MemberAddComponent extends BaseComponent implements OnInit {
  formConfig = {
    id: [""],
    code: [""],
    fullName: [""],
    gender: [""],
    email: [""],
    phoneNumber: [""],
    address: [""],
    avatarUrl: [""],
    dateOfBirth: [""]
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
  public idMember: any;
  public formSave: FormGroup;
  constructor(
    public activateRoute: ActivatedRoute,
    public router: Router,
    private app: AppComponent,
    private memberService: MemberService,
  ) {
    super(null);
    this.setMainService(memberService);
    this.formSave = this.buildForm({}, this.formConfig);

  }

  ngOnInit() {
    this.activateRoute.params.subscribe(params => {
      if (params && params.id != null) {
        this.idMember = params.id;
        this.setFormValue(this.idMember);
      }
    });
  }
  private setFormValue(id: number) {
    this.memberService.findOne(id).subscribe(response => {
      this.formSave = this.buildForm(response.data, this.formConfig);
      console.log("member ", response.data);
      console.log("member ", this.formSave.controls);
    });
  }
  public processSaveOrUpdate() {
    this.app.confirmMessage(
      null,
      () => {
        const formInput = this.formSave.value;
        this.memberService.saveOrUpdate(formInput).subscribe(res => {
          console.log("Save success");
          if (this.memberService.requestIsSuccess(res)) {
            this.router.navigate(["/members"]);
          }
        });
      },
      () => {
        // on rejected
      }
    );
  }

  public back() {
    this.router.navigate(["members"]);
  }
  get f() {
    return this.formSave.controls;
  }
}
