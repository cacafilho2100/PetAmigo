package br.com.petAmigo.util;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 * Classe responsavel por gerar as tabelas
 * 
 */
public class GenerateTables {

	public static void main(String[] args) {

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(Constants.PERSISTENCE_UNIT_NAME);
		factory.close();

		System.out.println("OK");

	}

}
