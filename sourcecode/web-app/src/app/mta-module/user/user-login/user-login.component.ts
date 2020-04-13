import { Component, OnInit } from '@angular/core';
import { BaseComponent } from 'src/app/shared/components/base-component/base-component.component';
import { UserToken } from 'src/app/core/models/user-token.model';
import { Validators, FormGroup, FormBuilder } from '@angular/forms';
import { Storage } from '../../../shared/service/storage.service';
import { Router } from '@angular/router';
import { AuthService } from 'src/app/core/services/auth.service';

@Component({
  selector: 'app-user-login',
  templateUrl: './user-login.component.html'
})
export class UserLoginComponent implements OnInit {
  userInfo: UserToken;
  error: string;
  isLoading: boolean;
  loginForm: FormGroup;
  formConfig = {
    account: ['', [Validators.required, Validators.maxLength(50)]],
    password: ['', [Validators.required, Validators.maxLength(200)]]
  };
  constructor(
    private formBuilder: FormBuilder,
    private router: Router,
    private authService: AuthService,) {
    this.buildForm();
   
   }

   ngOnInit() {
    if(Storage.getUserToken() != null) {
      this.router.navigate([""]);
      return;
    }
    window.sessionStorage.removeItem("token");
    this.buildForm();
  }

  get f() {
    return this.loginForm.controls;
  }

  login() {
    if (this.loginForm.invalid) {
      return;
    }

    this.authService.actionRequestToken(this.loginForm.value).subscribe(
      data => {
        if (data) {
          window.sessionStorage.setItem("token", data);
          this.authService.getCurrentUserInfo().subscribe(res => {
            const user = this.authService.extractTokenData(res);
            Storage.clear();
            Storage.setUserToken(user);
            this.router.navigate([""]);
          });
        } else {
          this.error = "Tên tài khoản hoặc Mật khẩu không đúng";
        }
      },
      error => {
        this.error = "Tên tài khoản hoặc Mật khẩu không đúng";
      }
    );
  }

  private buildForm(): void {
    this.loginForm = this.formBuilder.group(this.formConfig);
  }

  memberVisit(){
    this.router.navigate(["/book-manager/books"]);
  }
}
