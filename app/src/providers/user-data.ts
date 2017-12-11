import { Injectable } from '@angular/core';  //armazena e obtem informacoes do usuario
import { Storage } from '@ionic/storage';

/**
   user-data.ts -> responsavel por criar, armazenar e gerenciar toda informacao do usuario
**/

@Injectable()
export class UserData {

   public singleton : any = false; //armazenamento - ussuario e informacoes de listagem
   public usuario   : any = [];
   public adocao    : any = [];
   public cruzar    : any = [];
   public doacao    : any = [];
   public perdido   : any = [];
   
   constructor(  //armazenamento (cash e variavel)
      public storage: Storage,
   ){}
   
   // limpa todos os dados do usuario (para logout)
   logout() {
      this.singleton = false;
      this.storage.clear();
   }
   
   // verifica se o usuario ja esta logado
   hasLoginPetAmigo(): Promise<boolean> {
      return new Promise((resolve) => {
         this.storage.get('hasLoginPetAmigo').then((hasLoginPetAmigo) => {            
            let has = hasLoginPetAmigo ? hasLoginPetAmigo:false;
            resolve(has);
         });
      });
   };
   
   // armazena informacoes do usuario
   setUser(usuario){
      return new Promise((resolve) => {      
         this.storage.set('usuario', usuario).then(() => {
            this.storage.set('hasLoginPetAmigo', true);
            resolve(true);
         });
      });
   };

   // inicializa informacoes do usuario
   getUser(){
      return new Promise((resolve) => {
         this.storage.get('usuario').then((usuario) => {
            this.usuario = usuario;
            resolve(true);
         });
      });
   };
   
   // armazena todas as informacoes necessarias para usuario
   setMain(data){
      return new Promise((resolve) => {
         this.storage.set('adocao', data.adocao).then(() => {
            this.storage.set('cruzar', data.cruzar).then(() => {
               this.storage.set('doacao', data.doacao).then(() => {
                  this.storage.set('perdido', data.perdido).then(() => {
                     resolve(true);
                  });
               });
            });
          });
      });
   }
   
   // inicializa todas as informacoes necessarias para o usuario
   getMain(){
      return new Promise((resolve) => {
         this.storage.get('adocao').then((adocao) => {
            this.adocao = adocao || [];

            this.storage.get('cruzar').then((cruzar) => {
               this.cruzar = cruzar || [];
                  
                this.storage.get('doacao').then((doacao) => {
                   this.doacao = doacao || [];

                   this.storage.get('perdido').then((perdido) => {
                      this.perdido = perdido || [];
                      resolve(true);
                   });
                });
            });
         });
      });
   }

}
