package br.com.petAmigo.util;

/**
 * Classe para armazenamento de constantes úteis
 * 
 */
public class Constants {

	public static String APPLICATION_NAME = "PetAmigo";

	public static String PERSISTENCE_UNIT_NAME = "br.com.petAmigo";
	public static String LOGIN_PATH_NAME = "/login";

	// Entity Status
	public static final boolean ACTIVE_ENTITY = true;
	public static final boolean INACTIVE_ENTITY = false;

	// Media Type
	public static final String MEDIA_JPG = ".jpg";

	// File's URL
	public static final String CATALINA_BASE = "catalina.base";
	public static final String UPLOAD_PATH = "/webapps/data/petAmigo/";
	
	public static final Long ADOCAO = 1L;
	public static final Long DOACAO_DE_SANGUE = 2L;	
	public static final Long PERDIDO = 3L;
	public static final Long PARA_CRUZAR = 4L;
	
	

}
