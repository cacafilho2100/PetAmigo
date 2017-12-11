import { Component } from '@angular/core';
import { NavController, Platform } from 'ionic-angular';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';

import { Facebook } from '@ionic-native/facebook';
import { GooglePlus } from '@ionic-native/google-plus';

import { TabsPage } from '../tabs/tabs';

import { UserData } from '../../providers/user-data';
import { Message } from '../../providers/message';
import { WebService } from '../../providers/webservice';

@Component({
  selector: 'page-login',
  templateUrl: 'login.html',
})
export class LoginPage {

  FB_APP_ID: number = 168553463729431;
  FB_VERSION_API: any = 'v2.9';
  
  public loginForm: FormGroup;
  
  constructor(
    public navCtrl: NavController,
    public formBuilder: FormBuilder,
    public userData: UserData,
    public msg: Message,
    public ws: WebService,
    public platform: Platform,
    public facebook: Facebook,
    public googleplus: GooglePlus,
  ){
    
    this.loginForm = formBuilder.group({
        email: ['', Validators.compose([Validators.required])],
        password: ['', Validators.compose([Validators.required])]
    });   
  }

    login(body){
        let loading = this.msg.loadPersist('Conectando...');
        loading.present();

        this.ws.loginPost(body).then((data) => {

           this.userData.setUser(data).then(() => {
              loading.dismiss();
              this.navCtrl.setRoot(TabsPage, {}, { animate: true });
           });

        }, (err) => {
           loading.dismiss();
           this.msg.showMessage('error-login');
           return;
        });  
    }
  
    loginEmail(){
        let body = {
          tipoLogin: 'email',
          emailLogin: this.loginForm.value.email,
          senhaLogin: this.loginForm.value.password,
        }

        this.login(body);
    }
    
    loginFacebook(){
        if(this.platform.is('cordova')){
          
           this.facebook.login(['public_profile']).then(
              (resp) => {

                 this.facebook.api('/me?fields=id,name,email,gender', ['email']).then((user) => {

                    let body = { 
                       tipoLogin: 'facebook',
                       emailLogin: user.email, 
                       senhaLogin: user.id,
                    }

                    this.login(body);
                 });
              }
           );
        }
    }
  
    loginGooglePlus(){
        if(this.platform.is('cordova')){

           this.googleplus.login({}).then(
              (resp) => {

                 let body = { 
                    tipoLogin: 'facebook',
                    emailLogin: resp.email, 
                    senhaLogin: resp.userId,
                 }

                 this.login(body);
              }
           );
        }
    }
  
}
