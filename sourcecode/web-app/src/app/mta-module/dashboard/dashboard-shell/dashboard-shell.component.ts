import { Component, OnInit } from '@angular/core';
import { DashboardService } from 'src/app/core/services/dashboard.service';
import { Validators, FormGroup, FormControl, FormBuilder } from '@angular/forms';
@Component({
  selector: 'app-dashboard-shell',
  templateUrl: './dashboard-shell.component.html',
  styleUrls: ['./dashboard-shell.component.css'],
})

export class DashboardShellComponent implements OnInit {

  totalBorrowBookCurrentMonth: number = 0;
  totalGiveBackBookCurrentMonth: number = 0;
  totalBorrowBook: number = 0;
  totalAvailableBook: number = 0;
  totalMember: number = 0;

  charData: any;
  statisicalData: any;
  frequenciesData: any;
  // char search form
  formSearch: FormGroup;
  constructor(
    private dashboardService: DashboardService,
    private formBuilder: FormBuilder
  ) { }
  public initStatisticalData() {
    this.statisicalData = {
      labels: ['Số sách đã mượn', 'Số sách còn lại'],
      datasets: [
        {
          data: [0, 0],
          backgroundColor: [
            "#FF6384",
            "#FFCE56",
          ],
          hoverBackgroundColor: [
            "#FF6384",
            "#FFCE56",
          ]
        }
      ]
    };
  }
  public initCharData() {
    this.charData = {
      labels: ["Tên chỉ số"],
      datasets: [
        {
          label: 'Số sách đã mượn',
          data: [0],
          fill: false,
          borderColor: '#FF6384'
        },
        {
          label: 'Số sách đã trả',
          data: [0],
          fill: false,
          borderColor: '#007bff'
        }
      ]
    }
  }
  public initFormSearch() {
    let currentDay = new Date().toJSON().slice(0, 10);
    let firstDayOfMonth = currentDay.slice(0, 8) + "01";
    this.formSearch = this.formBuilder.group({
      fromDate: [firstDayOfMonth],
      toDate: [currentDay],
      frequency: ["day"]
    })
  }
  public init() {
    this.initFormSearch();
    this.initStatisticalData();
    this.initCharData();
  }

  ngOnInit() {
    this.init();
    this.loadStatistical();
    this.loadCharData();
    this.loadFrequencyData();
  }

  public getStatistical() {
    return this.dashboardService.getStatistical();
  }

  public getCharData(formSearch: any) {
    return this.dashboardService.getCharData(formSearch);

  }

  public getFrequencyData() {
    return this.dashboardService.getFrequencyData();
  }
  public loadStatistical() {
    this.getStatistical().subscribe(data => {
      const payload = data.data;
      console.log("payload", payload);
      this.totalBorrowBookCurrentMonth = payload.totalBorrowBookCurrentMonth;
      this.totalGiveBackBookCurrentMonth = payload.totalGiveBackBookCurrentMonth;

      this.statisicalData = {
        labels: ['Số sách đã mượn', 'Số sách còn lại'],
        datasets: [
          {
            data: [payload.totalBorrowBook, payload.totalAvailableBook],
            backgroundColor: [
              "#FF6384",
              "#FFCE56",
            ],
            hoverBackgroundColor: [
              "#FF6384",
              "#FFCE56",
            ]
          }
        ]
      };
      this.totalMember = payload.totalMember;
    });

  }
  public dateToString(date: any) {
    const d = new Date(date);
    const result = d.toJSON().slice(0, 10);;
    return result; // 2020-11-29
  }
  public loadCharData() {
    const formSearchValue = this.formSearch.value;
    const searchForm = {
      fromDate: this.dateToString(formSearchValue.fromDate),
      toDate: this.dateToString(formSearchValue.toDate),
      frequency: formSearchValue.frequency.value ? formSearchValue.frequency.value : "day"
    }
    console.log("vẽ biểu đồ", this.formSearch.value);
    this.getCharData(searchForm).subscribe(data => {
      const values = data.data;
      let labels = [];
      let borrows = [];
      let givebacks = [];
      values.forEach(element => {
        labels.push(element.label);
        borrows.push(element.borrow);
        givebacks.push(element.giveback);
      });
      this.charData = {
        labels: labels,
        datasets: [
          {
            label: 'Số sách đã mượn',
            data: borrows,
            fill: false,
            borderColor: '#FF6384'
          },
          {
            label: 'Số sách đã trả',
            data: givebacks,
            fill: false,
            borderColor: '#007bff'
          }
        ]
      }
    })
  }
  public loadFrequencyData() {
    this.getFrequencyData().subscribe(data => {
      let dropDownData = [];
      data.data.forEach(element => {
        dropDownData.push({ name: element, value: element })
      });
      console.log("loadFrequencyData", dropDownData);
      this.frequenciesData = dropDownData;
    })
  }
  getCurrentMonthString(): String {
    var d = new Date();
    var month = new Array();
    month[0] = "Tháng 1";
    month[1] = "Tháng 2";
    month[2] = "Tháng 3";
    month[3] = "Tháng 4";
    month[4] = "Tháng 5";
    month[5] = "Tháng 6";
    month[6] = "Tháng 7";
    month[7] = "Tháng 8";
    month[8] = "Tháng 9";
    month[9] = "Tháng 10";
    month[10] = "Tháng 11";
    month[11] = "Tháng 12";
    const n = month[d.getMonth()];
    return n
  }
}
