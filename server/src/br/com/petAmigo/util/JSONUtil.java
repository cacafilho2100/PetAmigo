package br.com.petAmigo.util;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class JSONUtil {  //classe que transforma o objeto e=m json
	
	public static String objectToJSON(Object object){
            Gson gson = new GsonBuilder().setDateFormat("dd/MM/YYYY").create();            
            return gson.toJson(object);
	}


}
