import { Component } from '@angular/core';
import { NavController } from 'ionic-angular';

import { Global } from '../../providers/global';
import { UserData } from '../../providers/user-data';

@Component({
  selector: 'page-perdido',
  templateUrl: 'perdido.html',
})
export class PerdidoPage {

  constructor(
    public navCtrl: NavController,
    public global: Global,
    public userData: UserData,
  ){}

}
