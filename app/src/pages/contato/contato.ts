import { Component } from '@angular/core';
import { NavController, NavParams } from 'ionic-angular';

@Component({
  selector: 'page-contato',
  templateUrl: 'contato.html',
})
export class ContatoPage {
   
   public telefone: any = '081 9 9999 9999';
   public email: any = 'petamigo@outlook.com';
   public site: any = 'PetAmigo';
  
   public facebook: any = 'https://www.facebook.com/Pet-Amigo-1670462063261532/';
   public twitter: any = 'https://twitter.com/Pet_Amigo_VC';
   public instagram: any = 'https://www.instagram.com/pet_amigo_viecost/';
   
   constructor(
      public navCtrl: NavController, 
      public navParams: NavParams,
   ){}

   openTES(tipo, contato){
      window.open(tipo + contato, '_system');
   }
   
}
