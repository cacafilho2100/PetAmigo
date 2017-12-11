package br.com.petAmigo.model.dao.impl;

import javax.persistence.EntityManager;

import br.com.petAmigo.model.dao.GenericDAO;
import br.com.petAmigo.model.entity.StatusAnimal;

public class StatusAnimalDAO extends GenericDAO<Long, StatusAnimal> {

	public StatusAnimalDAO(EntityManager entityManager) {
		super(entityManager);
		// TODO Auto-generated constructor stub
	}

}
