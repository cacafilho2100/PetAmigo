package br.com.petAmigo.model.dao.impl;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import br.com.petAmigo.model.dao.GenericDAO;
import br.com.petAmigo.model.entity.Usuario;

public class UsuarioDAO extends GenericDAO<Long, Usuario> {

	public UsuarioDAO(EntityManager entityManager) {
		super(entityManager);
		// TODO Auto-generated constructor stub
	}

	public boolean emailExiste(String email) {

		EntityManager entityManager = super.getEntityManager();

		Query query = entityManager.createQuery("SELECT u FROM Usuario u WHERE u.email = :email");
		query.setParameter("email", email);

		return (query.getResultList().size() > 0);

	}

}
