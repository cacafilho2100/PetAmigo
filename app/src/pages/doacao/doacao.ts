import { Component } from '@angular/core';
import { NavController } from 'ionic-angular';

import { Global } from '../../providers/global';
import { UserData } from '../../providers/user-data';

@Component({
  selector: 'page-doacao',
  templateUrl: 'doacao.html'
})
export class DoacaoPage {

  constructor(
    public navCtrl: NavController,
    public global: Global,
    public userData: UserData,
  ){}

}
