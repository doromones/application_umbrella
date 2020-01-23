import { Component, HostListener, OnInit, ViewChild } from '@angular/core';
import { MatSidenav } from '@angular/material/sidenav';

@Component({
  selector: 'app-layout-sidenav',
  templateUrl: './sidenav.component.html',
  styleUrls: ['./sidenav.component.scss']
})
export class SidenavComponent implements OnInit {
  opened = false;

  @ViewChild('sidenav') sidenav: MatSidenav;

  constructor() {
    this.onResize();
  }

  ngOnInit() {
  }

  @HostListener('window:resize', ['$event'])
  onResize(_?) {
    this.opened = this.checkSideNavOpen(window.innerWidth);
  }

  checkSideNavOpen(width: number): boolean {
    return width >= 500;
  }
}
