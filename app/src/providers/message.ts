import { Injectable } from '@angular/core';
import { AlertController, ToastController, LoadingController } from 'ionic-angular';

/**
   message.ts -> responsavel por todas as mensagens e avisos do aplicativo
**/

@Injectable()
export class Message {
   
   constructor(
      public alertCtrl: AlertController,
      public toastCtrl: ToastController,
      public loadingCtrl: LoadingController,
   ){}

   // exibe um popup contente a mensagem recebida (exibe um aviso)
   public showMessage(txt){
            
      let title, msg;
            
         switch (txt) {

            case 'error-login':
               title = 'Ops!';
               msg = 'Login não cadastrado';
            break;

            default:
               title = 'Ops!';
               msg = 'Ocorreu um erro ao se conectar com o servidor';
            break;
         }
        
      let alert = this.alertCtrl.create({
         title: title,
         subTitle: msg,
         buttons: ['OK']
      });

      alert.present();
   };
   
   // exibe um alerta, podendo ter opçao de confirmaçao
   public alert(title, text, leftButton, rightButton){

      return new Promise((resolve) => {
      
         let buttons = [];

         if(leftButton){
            buttons.push({ text: leftButton, role: 'cancel', handler: () => { resolve(false); } });      
         }

         if(rightButton){
            buttons.push({ text: rightButton, handler: () => { resolve(true); } });      
         }

         const alert = this.alertCtrl.create({
            title: "<b>" + title + "</b>",
            subTitle: text,
            buttons: buttons
         });

         alert.present();
      });
   }
   
   // exibe um popup contente uma caixa de texto e confirmaçao
   public prompt(title, text, leftButton, rightButton) {
      
      return new Promise((resolve) => {
      
         const alert = this.alertCtrl.create({
            
             title: "<b>" + title + "</b>",
             subTitle: "<br>" + text,
             inputs: [
               {
                 id: 'myInput',
                 placeholder: 'Descreva',
               }
             ],
             buttons: [
               {
                 text: leftButton,
                 role: 'cancel',
                 handler: () => {
                   resolve();
                 }
               },
               {
                 text: rightButton,
                 handler: data => {
                   resolve(data);
                 }
               }
             ]
         });
         
         alert.present();
      });
   }
   
   // retorna uma variavel de popup de loading, podendo ser cancelado (necessita chamar funcao present())
   public load(msg) {
      let loading = this.loadingCtrl.create({
         content:  msg,
         showBackdrop: true,
         enableBackdropDismiss: true,
         dismissOnPageChange: true
      });
      return loading;
   }
   
   // retorna uma variavel de popup de loading, nao podendo ser cancelado (necessita chamar funcao present())
   public loadPersist(msg) {
      let loading = this.loadingCtrl.create({
         content:  msg,
         showBackdrop: true,
         enableBackdropDismiss: false,
         dismissOnPageChange: false
      });
      return loading;
   }
   
   // retorna uma variavel de popup de notificaçao na parte inferior da tela (necessita chamar funcao present())
   public toast(msg){
      let toasting = this.toastCtrl.create({
         message: msg,
         duration: 3000
      });
      return toasting;
   }
   
}
