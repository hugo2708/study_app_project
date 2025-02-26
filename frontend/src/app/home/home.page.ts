import { Component, inject, OnInit } from '@angular/core';
import { RefresherCustomEvent, ToastController } from '@ionic/angular';
import axios from 'axios';
import { MessageComponent } from '../message/message.component';

import { DataService, Message } from '../services/data.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-home',
  templateUrl: 'home.page.html',
  styleUrls: ['home.page.scss'],
})
export class HomePage {
  private data = inject(DataService);

  usuarios : any = [];

  constructor( private toastController: ToastController,
    private router: Router) {
    
  }

  refresh(ev: any) {
    setTimeout(() => {
      (ev as RefresherCustomEvent).detail.complete();
    }, 8100);
  }

  getMessages(): Message[] {
    return this.data.getMessages();
  }
  
  ionViewWillEnter(): void {
    let token = localStorage.getItem('token');
    if (!token){
      this.router.navigate(["/login"]);
    }
    this.getUsers();
  }

  ngOnInit(): void {
    //this.getUsers();
  }

  getUsers () {
    let token =localStorage.getItem('token');
    let config = {
      headers : {
        "Authorization": token
      }
    }
    axios.get("http://localhost:8100/users/list", config)
    .then( result => {
      if (result.data.success == true) {
        this.usuarios = result.data.usuarios;
      } else {
        console.log(result.data.error);
        this.presentToats (result.data.error );
      }
      
    }).catch(error => {
      console.log(error.message);
      this.presentToats (error.message);
    })
  }


  async presentToats (message : string){
    const toast = await this.toastController.create({
      message:message,
      duration: 1500,
      position: 'top',
      });

    await toast.present();
  }

  public actionSheetButtons = [
    {
      text: 'Logout',
      role: 'destructive',
      data: {
        action:  this.logout()/* 'delete' */,
      },
    },
    {
      text: 'Cancel',
      role: 'cancel',
      data: {
        action: 'cancel',
      },
    },
  ];

  logout () {
    console.log("Logout apretado")
  }

}
