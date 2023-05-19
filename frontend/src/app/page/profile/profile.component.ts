import { Component } from '@angular/core';

@Component({
  selector: 'app-profile',
  templateUrl: './profile.component.html',
  styleUrls: ['./profile.component.scss'],
})
export class ProfileComponent {
  loggedInUser = "Hugo Areco";
  loggedInUserEmail = "enrique@example.com";
  loggedInUserPhone = "555-1234";
  loggedInUserAddress = "Calle 123, Ciudad";
}


