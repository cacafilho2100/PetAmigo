package br.com.petAmigo.model.dao.impl;

import javax.persistence.EntityManager;

import br.com.petAmigo.model.dao.GenericDAO;
import br.com.petAmigo.model.entity.MyFile;

public class MyFileDAO extends GenericDAO<Long, MyFile> {

	public MyFileDAO(EntityManager entityManager) {
		super(entityManager);
		// TODO Auto-generated constructor stub
	}

}
