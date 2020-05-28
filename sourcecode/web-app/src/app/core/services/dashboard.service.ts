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
export class DashboardService extends BasicService {

  constructor(
    public httpClient: HttpClient,
    public helperService: HelperService) {
    super('bms', 'dashboard', httpClient, helperService);
  }

  public test(): Observable<any> {
    const url = `${this.serviceUrl}`;
    return this.httpClient.get(url);
  }

  public getStatistical(): Observable<any> {
    const url = `${this.serviceUrl}/statistical`;
    return this.httpClient.get(url);
  }

  public getCharData(formData: any): Observable<any> {
    let currentDay = new Date().toJSON().slice(0, 10);
    let firstDayOfMonth = currentDay.slice(0, 8) + "01";

    const fromDate = formData.fromDate ? formData.fromDate : firstDayOfMonth;
    const toDate = formData.toDate ? formData.toDate : currentDay;
    const frequency = formData.frequency ? formData.frequency : "day";
    const url = `${this.serviceUrl}/char-data?fromDate=${fromDate}&toDate=${toDate}&frequency=${frequency}`;
    return this.httpClient.get(url)
  }
  public getFrequencyData(): Observable<any> {
    const url = `${this.serviceUrl}/char-frequency`;
    return this.httpClient.get(url);
  }
}