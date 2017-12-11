import { Component } from '@angular/core';
import { NavController } from 'ionic-angular';

import { Global } from '../../providers/global';
import { UserData } from '../../providers/user-data';

@Component({
  selector: 'page-cruzar',
  templateUrl: 'cruzar.html'
})
export class CruzarPage {

  constructor(
    public navCtrl: NavController,
    public global: Global,
    public userData: UserData,
  ){}

}
