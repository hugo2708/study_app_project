import { Routes } from '@angular/router';

export const routes: Routes = [
  {
    path: 'home',
    loadChildren: () => import('./page/home/home.module').then((m) => m.HomeModule),
  },{
    path: 'profile',
    loadChildren: () => import('./page/profile/profile.module').then((m) => m.ProfileModule),
  },
  {
    path: '',
    redirectTo: 'home',
    pathMatch: 'full',
  },
];
