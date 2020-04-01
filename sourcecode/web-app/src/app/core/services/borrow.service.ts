import { Injectable } from '@angular/core';
import { BasicService } from './basic.service';
import { HttpClient } from '@angular/common/http';
import { HelperService } from 'src/app/shared/service/helper.service';

@Injectable({
  providedIn: 'root'
})
export class BorrowService extends BasicService {

  constructor(public httpClient: HttpClient, public helperService: HelperService) {
    super('bms', 'borrow', httpClient, helperService);
  }
}
