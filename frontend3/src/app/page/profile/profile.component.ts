import { Component } from '@angular/core';

@Component({
  selector: 'app-profile',
  templateUrl: './profile.component.html',
  styleUrls: ['./profile.component.scss'],
})
export class ProfileComponent {
  loggedInUser = "Juan Perez";
  loggedInUserEmail = "juan@example.com";
  loggedInUserPhone = "555-1234";
  loggedInUserAddress = "Calle 123, Ciudad";
}


