import {Component, HostListener, OnInit} from '@angular/core';
import {ThemeOptions} from '../../../theme-options';
import {select} from '@angular-redux/store';
import {Observable} from 'rxjs';
import {ActivatedRoute} from '@angular/router';
import { MenuItem } from 'primeng/api';
import { MediaMatcher } from "@angular/cdk/layout";
import { MenuItems } from "../../../shared/menu-items/menu-items";

@Component({
  selector: 'app-sidebar',
  templateUrl: './sidebar.component.html',
})
export class SidebarComponent implements OnInit {
  public extraParameter: any;
  items: MenuItem[];

  constructor(public globals: ThemeOptions, private activatedRoute: ActivatedRoute) {

  }

  @select('config') public config$: Observable<any>;

  private newInnerWidth: number;
  private innerWidth: number;
  activeId = 'dashboardsMenu';

  toggleSidebar() {
    this.globals.toggleSidebar = !this.globals.toggleSidebar;
  }

  sidebarHover() {
    this.globals.sidebarHover = !this.globals.sidebarHover;
  }

  ngOnInit() {
    setTimeout(() => {
      this.innerWidth = window.innerWidth;
      if (this.innerWidth < 1200) {
        this.globals.toggleSidebar = true;
      }
    });

    this.extraParameter = this.activatedRoute.snapshot.firstChild.data.extraParameter;

  }

  @HostListener('window:resize', ['$event'])
  onResize(event) {
    this.newInnerWidth = event.target.innerWidth;

    if (this.newInnerWidth < 1200) {
      this.globals.toggleSidebar = true;
    } else {
      this.globals.toggleSidebar = false;
    }

  }

  private innitMenu() {
    // TODO Khai báo các url trên side-sidebar
    this.items = [
      {
        label: "Trang chủ",
        icon: "pi pi-home",
        routerLink: ["/starter"]
      },
      {
        label: "Quản lý người dùng",
        icon: "pi pi-user",
        routerLink: ["/user"]
      },
      // For employee-manager
      {
        label: "Quản lý nhân viên",
        icon: "pi pi-users",
        items: [
          {
            label: "Quản lý phòng ban",
            icon: "pi pi-th-large",
            routerLink: ["/employee-manager/departments"]
          },
          {
            label: "Quản lý nhân viên",
            icon: "pi pi-th-large",
            routerLink: ["/employee-manager/employees"]
          },
          {
            label: "Quản lý chức vụ",
            icon: "pi pi-th-large",
            routerLink: ["/employee-manager/positions"]
          }
        ]
      }
    ];
  }
}
