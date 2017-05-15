package br.com.petAmigo.model.dao.impl;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import br.com.petAmigo.model.dao.GenericDAO;
import br.com.petAmigo.model.entity.Usuario;

public class LoginDAO extends GenericDAO<Long, Usuario> {

	public LoginDAO(EntityManager entityManager) {
		super(entityManager);
		// TODO Auto-generated constructor stub
	}

	public Usuario verificandoUsuario(String email) {

		Usuario usuario = new Usuario();

		EntityManager entityManager = super.getEntityManager();

		Query query = entityManager.createQuery("SELECT obj FROM Usuario obj WHERE obj.email = :email");
		query.setParameter("email", email);

		usuario = (Usuario) query.getSingleResult();

		return usuario;

	}

}
