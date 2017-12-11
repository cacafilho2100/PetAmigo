import { Component, ViewChild } from '@angular/core';
import { Platform, Nav } from 'ionic-angular';
import { StatusBar } from '@ionic-native/status-bar';
import { SplashScreen } from '@ionic-native/splash-screen';

import { LoginPage } from '../pages/login/login';
import { TabsPage } from '../pages/tabs/tabs';

import { UserData } from '../providers/user-data';
import { Message } from '../providers/message';
import { WebService } from '../providers/webservice';

@Component({
  templateUrl: 'app.html'
})
export class PetAmigoApp {
  
  @ViewChild(Nav) nav: Nav;
  rootPage: any;

  constructor(
    public platform: Platform, 
    public statusBar: StatusBar,
    public splashScreen: SplashScreen,
    public userData: UserData,
    public msg: Message,
    public ws: WebService,
  ){
    
      this.userData.hasLoginPetAmigo().then((hasLoginPetAmigo) => { //verifica se o usuario ta logado ou nao
        
          if (hasLoginPetAmigo) {
              this.rootPage = TabsPage; //se tiver logado passa pra tela principal
          } else {
              this.rootPage = LoginPage; // se nao, volta pra tela de login
          }

          setTimeout(() => {
              this.platform.ready().then(() => { //splash, quando some a tela de inicializacao
                  this.statusBar.show();
                  this.splashScreen.hide();
              });
          }, 750);
      });

  }
  
}
