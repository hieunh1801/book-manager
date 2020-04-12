import {Component, OnInit} from '@angular/core';
import {ThemeOptions} from '../../../../../theme-options';
import { Router } from '@angular/router';
import { Storage } from "../../../../../shared/service/storage.service";
import { UserToken } from 'src/app/core/models/user-token.model';
import { environment } from 'src/environments/environment';
@Component({
  selector: 'app-user-box',
  templateUrl: './user-box.component.html',
})
export class UserBoxComponent implements OnInit {

  userInfo : UserToken
  fileServer =  environment.serverUrl['file'];
  constructor(public globals: ThemeOptions,
    public router: Router) {
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
}
