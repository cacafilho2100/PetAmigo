import { Component } from '@angular/core'; //menu de listagem de opcoes
import { ViewController, NavController } from 'ionic-angular';

import { ContatoPage } from '../contato/contato';
import { LoginPage } from '../login/login';

import { UserData } from '../../providers/user-data';
import { Message } from '../../providers/message';

@Component({
  template: `
    <ion-list>
      <ion-list-header>Olá, {{this.userData.usuario[1]}}!</ion-list-header>
      <button ion-item (click)="openContato()">Contato</button>
      <button ion-item (click)="logout()">Sair</button>
    </ion-list>
  `
})
export class MenuPopover {

  constructor(
    public viewCtrl: ViewController,
    public navCtrl: NavController,
    public userData: UserData,
    public msg: Message,
  ){}
  
  openContato(){
      this.navCtrl.push(ContatoPage).then(() => { 
        this.viewCtrl.dismiss() 
      });
  }
  
  logout(){
    
      let loading = this.msg.loadPersist('Saindo...');
      loading.present();
      
      this.userData.logout();
      this.viewCtrl.dismiss();
      loading.dismiss();
    
      this.navCtrl.push(LoginPage).then(() => { 
        this.navCtrl.setRoot(LoginPage);
      });
        
  }

}
