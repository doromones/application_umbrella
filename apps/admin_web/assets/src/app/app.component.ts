import { Component, HostListener, ViewChild } from '@angular/core';
import { MatSidenav } from '@angular/material/sidenav';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
  title = 'assets';

  @ViewChild('sidenav') sidenav: MatSidenav;

  @HostListener('window:resize', ['$event'])
  onResize(event) {
    if (event.target.innerWidth < 500) {
      this.sidenav.close();
    } else {
      this.sidenav.open();
    }
  }
}
