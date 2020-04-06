import { Component, OnInit } from '@angular/core';
import { BaseComponent } from 'src/app/shared/components/base-component/base-component.component';
import { ActivatedRoute, Router } from "@angular/router";
import { DialogModule } from "primeng/dialog";
import { BookService } from 'src/app/core/services/book.service';
import { FormGroup, Validators } from "@angular/forms";
import { AppComponent } from 'src/app/app.component';
import { CategoryService } from 'src/app/core/services/category.service';
import { MemberService } from 'src/app/core/services/member.service';
import { FileControl } from 'src/app/core/models/file.control';
import { environment } from "../../../../environments/environment";
import { CommonUtils } from 'src/app/shared/service/common-utils.service';
import { DatePipe } from '@angular/common';

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
    avatarUrl: ['https://nld.mediacdn.vn/zoom/700_438/2015/anonymous-1447907195159.jpg'],
    dateOfBirth: [""],
    dateOfBirthStr: [""]
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
  fileServer =  environment.serverUrl['file'];
  public idMember: any;
  public formSave: FormGroup;
  constructor(
    public activateRoute: ActivatedRoute,
    public router: Router,
    private app: AppComponent,
    public datepipe: DatePipe,
    private memberService: MemberService,
  ) {
    super(null);
    this.setMainService(memberService);
    this.formSave = this.buildForm({}, this.formConfig);
    this.formSave.addControl("file", new FileControl(null));
    
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
      if(response.data.avatarUrl ){
        response.data.avatarUrl = this.fileServer + response.data.avatarUrl;
      } else {
        response.data.avatarUrl = 'https://nld.mediacdn.vn/zoom/700_438/2015/anonymous-1447907195159.jpg'
      }

      this.formSave = this.buildForm(response.data, this.formConfig);
      console.log("member ", response.data);
      console.log("member ", this.formSave.controls);
      this.formSave.addControl("file", new FileControl(null));
     
    });
  }
  public processSaveOrUpdate() {
    this.app.confirmMessage(
      null,
      () => {
        const temp = this.formSave.controls.avatarUrl.value;
        this.formSave.controls.avatarUrl.setValue(null);
        this.formSave.controls.dateOfBirthStr.setValue(this.formSave.controls.dateOfBirth.value);
        this.formSave.controls.dateOfBirth.setValue(null);
        const formInput = this.formSave.value;
        this.memberService.saveOrUpdateFormFile(formInput).subscribe(res => {
          console.log("Save success");
          if (this.memberService.requestIsSuccess(res)) {
            this.router.navigate(["/members"]);
          } else {
            this.formSave.controls.avatarUrl.setValue(temp);
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
