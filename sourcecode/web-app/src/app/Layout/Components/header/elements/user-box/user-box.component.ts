import {Component, OnInit} from '@angular/core';
import {ThemeOptions} from '../../../../../theme-options';
import { Router } from '@angular/router';
import { Storage } from "../../../../../shared/service/storage.service";
import { UserToken } from 'src/app/core/models/user-token.model';
import { environment } from 'src/environments/environment';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { UserService } from 'src/app/core/services/user.service';
import { UserFormComponent } from 'src/app/mta-module/user/user-form/user-form.component';
import { BaseComponent } from 'src/app/shared/components/base-component/base-component.component';
import { DEFAULT_MODAL_OPTIONS } from 'src/app/core/app-config';
import { AuthService } from 'src/app/core/services/auth.service';
@Component({
  selector: 'app-user-box',
  templateUrl: './user-box.component.html',
})
export class UserBoxComponent extends BaseComponent implements OnInit {

  userInfo : UserToken
  fileServer =  environment.serverUrl['file'];
  constructor(public globals: ThemeOptions,
    private modalService: NgbModal,
    private userService: UserService,
    private authService: AuthService,
    public router: Router) {
      super(null);
      this.userInfo = Storage.getUserToken();
      if(this.userInfo == null){
        this.userInfo = new UserToken();
        this.userInfo.avatarUrl = 'https://nld.mediacdn.vn/zoom/700_438/2015/anonymous-1447907195159.jpg';
      } else if(this.userInfo.avatarUrl){
        this.userInfo.avatarUrl = this.fileServer + this.userInfo.avatarUrl;
      } else {
        this.userInfo.avatarUrl = 'https://nld.mediacdn.vn/zoom/700_438/2015/anonymous-1447907195159.jpg';
      }
      
  }

  ngOnInit() {
  }

  public logOut() {
    this.router.navigate(["/users/login"]);
    Storage.clear();
  }

  public login(){
    this.router.navigate(["/users/login"]);
  }
  
  prepareChangeInfo(): void {
    if (this.userInfo  && this.userInfo.userId > 0) {
      this.userService.findOne(this.userInfo.userId)
        .subscribe(res => {
          // this.activeFormModal(this.modalService, UserFormComponent, res.data);
          // public activeFormModal(service, component, data) {
            const modalRef = this.modalService.open(UserFormComponent, DEFAULT_MODAL_OPTIONS);
            modalRef.componentInstance.setFormValue(this.propertyConfigs, res.data);
            modalRef.result.then(result => {
              this.authService.getCurrentUserInfo().subscribe(res => {
                const user = this.authService.extractTokenData(res);
                Storage.clear();
                Storage.setUserToken(user);
                window.location.reload();
              });
            });
          // }
        });
    } 
  }
}
