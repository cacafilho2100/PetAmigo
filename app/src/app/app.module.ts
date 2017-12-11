import { NgModule, ErrorHandler } from '@angular/core';  // importacao de tela e biblioteca
import { BrowserModule } from '@angular/platform-browser';
import { IonicApp, IonicModule, IonicErrorHandler } from 'ionic-angular';
import { HttpModule } from '@angular/http';
import { PetAmigoApp } from './app.component';

import { AdocaoPage } from '../pages/adocao/adocao';
import { CruzarPage } from '../pages/cruzar/cruzar';
import { DoacaoPage } from '../pages/doacao/doacao';
import { PerdidoPage } from '../pages/perdido/perdido';
import { ContatoPage } from '../pages/contato/contato';
import { LoginPage } from '../pages/login/login';
import { TabsPage } from '../pages/tabs/tabs';

import { MenuPopover } from '../pages/popover/menu-popover';

import { Facebook } from '@ionic-native/facebook';
import { GooglePlus } from '@ionic-native/google-plus';
import { StatusBar } from '@ionic-native/status-bar';
import { SplashScreen } from '@ionic-native/splash-screen';
import { IonicStorageModule } from '@ionic/storage';

import { Global } from '../providers/global';
import { UserData } from '../providers/user-data';
import { WebService } from '../providers/webservice';
import { Message } from '../providers/message';

@NgModule({
  declarations: [
    PetAmigoApp,
    AdocaoPage,
    CruzarPage,
    DoacaoPage,
    PerdidoPage,
    ContatoPage,
    LoginPage,
    TabsPage,
    MenuPopover,
  ],
  imports: [
    BrowserModule,
    HttpModule,
    IonicModule.forRoot(PetAmigoApp),
    IonicStorageModule.forRoot(),
  ],
  bootstrap: [IonicApp],
  entryComponents: [
    PetAmigoApp,
    AdocaoPage,
    CruzarPage,
    DoacaoPage,
    PerdidoPage,
    ContatoPage,
    LoginPage,
    TabsPage,
    MenuPopover,
  ],
  providers: [
    { provide: ErrorHandler, useClass: IonicErrorHandler },
    StatusBar,
    SplashScreen,
    Global,
    UserData,
    WebService,
    Message,
    Facebook,
    GooglePlus,
  ]
})

export class AppModule {}
