package br.com.petAmigo.model.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import br.com.petAmigo.model.dao.GenericDAO;
import br.com.petAmigo.model.entity.Animal;
import br.com.petAmigo.util.Constants;

public class AnimalDAO extends GenericDAO<Long, Animal> {

	public AnimalDAO(EntityManager entityManager) {
		super(entityManager);
		// TODO Auto-generated constructor stub
	}

	public List<Animal> findByUser(Long id) {

		EntityManager entityManager = super.getEntityManager();

		TypedQuery<Animal> query = entityManager
				.createQuery("SELECT u FROM Animal u WHERE u.usuario.id = :id AND u.status = :status", Animal.class);
		query.setParameter("id", id);
		query.setParameter("status", Constants.ACTIVE_ENTITY);

		return query.getResultList();

	}

	public List<Animal> findByDoacao() {

		EntityManager entityManager = super.getEntityManager();

		TypedQuery<Animal> query = entityManager.createQuery(
				"SELECT u FROM Animal u WHERE u.statusAnimal.statusAnimal = :statusAnimal AND u.status = :status", Animal.class);
		query.setParameter("statusAnimal", Constants.DOACAO_DE_SANGUE);
		query.setParameter("status", Constants.ACTIVE_ENTITY);

		return query.getResultList();

	}

	public List<Animal> findByAdocao() {

		EntityManager entityManager = super.getEntityManager();

		TypedQuery<Animal> query = entityManager.createQuery(
				"SELECT u FROM Animal u WHERE u.statusAnimal.statusAnimal = :statusAnimal AND u.status = :status", Animal.class);
		query.setParameter("statusAnimal", Constants.ADOCAO);
		query.setParameter("status", Constants.ACTIVE_ENTITY);
                
		return query.getResultList();

	}

	public List<Animal> findByPerdido() {

		EntityManager entityManager = super.getEntityManager();

		TypedQuery<Animal> query = entityManager.createQuery(
				"SELECT u FROM Animal u WHERE u.statusAnimal.statusAnimal = :statusAnimal AND u.status = :status", Animal.class);
		query.setParameter("statusAnimal", Constants.PERDIDO);
		query.setParameter("status", Constants.ACTIVE_ENTITY);

		return query.getResultList();

	}

	public List<Animal> findByCruzar() {

		EntityManager entityManager = super.getEntityManager();

		TypedQuery<Animal> query = entityManager.createQuery(
				"SELECT u FROM Animal u WHERE u.statusAnimal.statusAnimal = :statusAnimal AND u.status = :status", Animal.class);
		query.setParameter("statusAnimal", Constants.PARA_CRUZAR);
		query.setParameter("status", Constants.ACTIVE_ENTITY);

		return query.getResultList();

	}
}
