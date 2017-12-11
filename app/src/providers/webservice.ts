import { Injectable } from '@angular/core';
import { Http, Headers } from '@angular/http';
import 'rxjs/add/operator/retry';
import 'rxjs/add/operator/timeout';
import 'rxjs/add/operator/delay';
import 'rxjs/add/operator/map';

/**
   webservice.ts -> responsavel por toda conecçao com webservice de servidor
**/

@Injectable()
export class WebService {

mode: any = 'DEV';
   //mode: any = 'PROD';
   timeout: any = 13000;
   url: any;
   
   constructor(public http: Http) {
      // urls de webservice, localhost ou remoto
      if(this.mode=='DEV'){
         this.url = {
            'login'   : 'http://localhost:8080/PetAmigo/LoginJson',
            'adocao'  : 'http://localhost:8080/PetAmigo/AnimaisAdocaoJson',
            'cruzar'  : 'http://localhost:8080/PetAmigo/AnimaisCruzarJson',
            'doacao'  : 'http://localhost:8080/PetAmigo/AnimaisDoacaoJson',
            'perdido' : 'http://localhost:8080/PetAmigo/AnimaisPerdidosJson',
         }
      } else if(this.mode=='PROD'){
         this.url = {
            'login'   : 'http://192.168.1.105:8080/PetAmigo/LoginJson',
            'adocao'  : 'http://192.168.1.105:8080/PetAmigo/AnimaisAdocaoJson',
            'cruzar'  : 'http://192.168.1.105:8080/PetAmigo/AnimaisCruzarJson',
            'doacao'  : 'http://192.168.1.105:8080/PetAmigo/AnimaisDoacaoJson',
            'perdido' : 'http://192.168.1.105:8080/PetAmigo/AnimaisPerdidosJson',
         }
      }
      
   }
  
   public serial(body) {  //pra pegar o json e serializar
      var query = '', name, value, fullSubName, subName, subValue, innerObj, i;

      for(name in body) {
         value = body[name];

         if(value instanceof Array) {
            for(i=0; i<value.length; ++i) {
              subValue = value[i];
              fullSubName = name + '[' + i + ']';
              innerObj = {};
              innerObj[fullSubName] = subValue;
              query += this.serial(innerObj) + '&';
            }
          }
          else if(value instanceof Object) {
            for(subName in value) {
              subValue = value[subName];
              fullSubName = name + '[' + subName + ']';
              innerObj = {};
              innerObj[fullSubName] = subValue;
              query += this.serial(innerObj) + '&';
            }
          }
          else if(value !== undefined && value !== null)
            query += encodeURIComponent(name) + '=' + encodeURIComponent(value) + '&';
        }

        return query.length ? query.substr(0, query.length - 1) : query;
   };

   public getHeader(){  //cabecalo de requisicao
     return { headers: new Headers({ 'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8' }) };
   }
  
   public loginPost(body): Promise<any>{  //recebe o json de requisicoes - login
      return new Promise((resolve, reject) => {
         this.http.post(this.url['login'], this.serial(body), this.getHeader()).timeout(this.timeout) //(angula)pega url do login, depois o json das informacoes e seraliza, e dps retorna o cabecalho
            .map(resp => resp.json()).subscribe( //map(angula)
            (resp) => {
               if (resp[0] == "true") resolve(resp);
               else reject(resp);
            },(err) => {
               console.log(err);
               reject(err);
            }
         );
      });
   }
   
   public adocaoGet(): Promise<any>{ //puxa as informacoes do servidor
      return new Promise((resolve, reject) => {
         this.http.get(this.url['adocao'], this.getHeader()).map(
           (resp) => resp.json()).subscribe(
              (resp) => { resolve(resp) },
              (err) => { resolve() }
           );
      });
   }
  
   public cruzarGet(): Promise<any>{
      return new Promise((resolve, reject) => {
         this.http.get(this.url['cruzar'], this.getHeader()).map(
           (resp) => resp.json()).subscribe(
              (resp) => { resolve(resp) },
              (err) => { resolve() }
           );
      });
   }
  
   public doacaoGet(): Promise<any>{
      return new Promise((resolve, reject) => {
         this.http.get(this.url['doacao'], this.getHeader()).map(
           (resp) => resp.json()).subscribe(
              (resp) => { resolve(resp) },
              (err) => { resolve() }
           );
      });
   }
  
   public perdidoGet(): Promise<any>{
      return new Promise((resolve, reject) => {
         this.http.get(this.url['perdido'], this.getHeader()).map(
           (resp) => resp.json()).subscribe(
              (resp) => { resolve(resp) },
              (err) => { resolve() }
           );
      });
   }
  
}
