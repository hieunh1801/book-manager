import { Injectable } from '@angular/core';
import { BasicService } from './basic.service';
import { HttpClient } from '@angular/common/http';
import { HelperService } from 'src/app/shared/service/helper.service';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class SystemParamService  extends BasicService {

  constructor(public httpClient: HttpClient, public helperService: HelperService) {
    super('bms', 'sysParam', httpClient, helperService);
  }

  public findAll(): Observable<any> {
    const url = `${this.serviceUrl}/find-all`;
    return this.httpClient.get(url);
  }

  public getParam(): Observable<any> {
    const url = `${this.serviceUrl}/get-param`;
    return this.httpClient.get(url);
  }
}
