import { Component } from '@angular/core';

import { AdocaoPage } from '../adocao/adocao';
import { CruzarPage } from '../cruzar/cruzar';
import { DoacaoPage } from '../doacao/doacao';
import { PerdidoPage } from '../perdido/perdido';

import { Global } from '../../providers/global';
import { UserData } from '../../providers/user-data';

@Component({
  templateUrl: 'tabs.html'
})
export class TabsPage {

  tab1Root = AdocaoPage;
  tab2Root = CruzarPage;
  tab3Root = DoacaoPage;
  tab4Root = PerdidoPage;

  constructor(
    public global: Global,
    public userData: UserData,
  ){}
  
  ionViewDidEnter(){
    
      if(!this.userData.singleton){
          this.userData.getUser().then(() => {
              this.global.updateData();
          });
      }
    
      this.userData.singleton = true;
  }
  
}
