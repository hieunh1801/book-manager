import { Injectable } from '@angular/core';
import { BasicService } from './basic.service';
import { HttpClient, HttpParams } from '@angular/common/http';
import { HelperService } from '../../shared/service/helper.service';
import { Observable } from 'rxjs';
import { tap, catchError } from 'rxjs/operators';
import { CommonUtils } from '../../shared/service/common-utils.service';

@Injectable({
  providedIn: 'root'
})
export class MemberService extends BasicService {
  constructor(
    public httpClient: HttpClient,
    public helperService: HelperService) {
    super('bms', 'members', httpClient, helperService);
  }
}
