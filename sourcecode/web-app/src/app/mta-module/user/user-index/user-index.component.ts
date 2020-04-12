import { Component, OnInit } from '@angular/core';
import { UserToken } from '../../../core/models/user-token.model';
import { Storage } from '../../../shared/service/storage.service';
import { BaseComponent } from 'src/app/shared/components/base-component/base-component.component';

@Component({
  selector: 'app-user-index',
  templateUrl: './user-index.component.html',
  styleUrls: ['./user-index.component.css']
})
export class UserIndexComponent extends BaseComponent implements OnInit {

  userInfo: UserToken;
  constructor() {
    super(null)
    this.userInfo = Storage.getUserToken();
   }

  ngOnInit() {
  }

}
