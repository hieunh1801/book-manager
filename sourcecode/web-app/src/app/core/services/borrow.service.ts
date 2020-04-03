import { Injectable } from '@angular/core';
import { BasicService } from './basic.service';
import { HttpClient } from '@angular/common/http';
import { HelperService } from 'src/app/shared/service/helper.service';
import { Observable } from 'rxjs';
import { CommonUtils } from 'src/app/shared/service/common-utils.service';

@Injectable({
  providedIn: 'root'
})
export class BorrowService extends BasicService {

  constructor(public httpClient: HttpClient, public helperService: HelperService) {
    super('bms', 'borrow', httpClient, helperService);
  }

  public searchHistory(data?: any, event?: any): Observable<any> {
    if (!event) {
      this.credentials = Object.assign({}, data);
    }

    const searchData = CommonUtils.convertData(this.credentials);
    if (event) {
      searchData._search = event;
    }
    const buildParams = CommonUtils.buildParams(searchData);
    const url = `${this.serviceUrl}/search-history?`;
    return this.getRequest(url, { params: buildParams });
  }

  public searchMemberAutoComplete(data): Observable<any> {
    const url = `${this.serviceUrl}/auto-complete-member/${data}`;
    return this.httpClient.get(url);
  }

  public searchBorrow(data?: any, event?: any): Observable<any> {
    if (!event) {
      this.credentials = Object.assign({}, data);
    }

    const searchData = CommonUtils.convertData(this.credentials);
    if (event) {
      searchData._search = event;
    }
    const buildParams = CommonUtils.buildParams(searchData);
    const url = `${this.serviceUrl}/search-borrow?`;
    return this.getRequest(url, { params: buildParams });
  }
  
}
