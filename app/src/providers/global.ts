import { Injectable } from '@angular/core';
import { Storage } from '@ionic/storage';
import { PopoverController } from 'ionic-angular';

import { MenuPopover } from '../pages/popover/menu-popover';

import { UserData } from './user-data';
import { Message } from './message';
import { WebService } from './webservice';

/**
   global.js -> responsavel por oferecer funçoes comuns por toda a aplicaçao
**/

@Injectable()
export class Global {
   
  constructor(
    public storage: Storage,
    public popoverCtrl: PopoverController,
    public userData: UserData,
    public msg: Message,
    public ws: WebService,
  ){}
   
  presentMenuPopover(event) { //funcoes do submenu - cria e apresenta
      let popover = this.popoverCtrl.create(MenuPopover);
      popover.present({
          ev: event
      });
  }
  
  updateData(){
      let loading = this.msg.loadPersist('Listando...');
      loading.present();
      
      this.ws.adocaoGet().then((adocao) => {
          this.ws.cruzarGet().then((cruzar) => {
              this.ws.doacaoGet().then((doacao) => {
                  this.ws.perdidoGet().then((perdido) => {
                    
                    let data = {
                        adocao: adocao || this.storage.get('adocao'),
                        cruzar: cruzar || this.storage.get('cruzar'),
                        doacao: doacao || this.storage.get('doacao'),
                        perdido: perdido || this.storage.get('perdido'),
                    }
                    
                    this.userData.setMain(data).then(() => {
                        this.userData.getMain().then(() => {
                            loading.dismiss();
                        });
                    });
                  });
              });
          });
      });
  }
  
  doRefresh(refresher){  //atualizar tela
      this.updateData();
      refresher.complete();
  }
   
}
