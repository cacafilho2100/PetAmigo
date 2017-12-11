package br.com.petAmigo.controller;

import java.util.ArrayList;
import java.util.List;

import br.com.petAmigo.model.dao.impl.StatusAnimalDAO;
import br.com.petAmigo.model.entity.StatusAnimal;
import br.com.petAmigo.model.jpa.impl.JPAUtil;
import br.com.petAmigo.util.Constants;
import br.com.petAmigo.util.JSONUtil;

public class StatusAnimalController {

	private StatusAnimalDAO statusAnimalDAO;
	private JPAUtil simpleEntityManager;

	public List<StatusAnimal> getListaStatus() {

		this.simpleEntityManager = JPAUtil.getInstance(Constants.PERSISTENCE_UNIT_NAME);
		this.statusAnimalDAO = new StatusAnimalDAO(simpleEntityManager.getEntityManager());

		List<StatusAnimal> statusAnimalTrue = new ArrayList<>();

		try {

			simpleEntityManager.beginTransaction();

			List<StatusAnimal> statusAnimal = this.statusAnimalDAO.findAll();
			for (StatusAnimal statusAnimal2 : statusAnimal) {
				if (statusAnimal2.getStatus() == true) {

					statusAnimalTrue.add(statusAnimal2);

				}
			}

		} catch (Exception e) {

			this.simpleEntityManager.rollBack();

			e.printStackTrace();

		} finally {

			this.simpleEntityManager.close();

		}

		return statusAnimalTrue;
	}

	public String getListaStatusJson() {

		this.simpleEntityManager = JPAUtil.getInstance(Constants.PERSISTENCE_UNIT_NAME);
		this.statusAnimalDAO = new StatusAnimalDAO(simpleEntityManager.getEntityManager());

		List<StatusAnimal> statusAnimalTrue = new ArrayList<>();

		try {

			simpleEntityManager.beginTransaction();

			List<StatusAnimal> statusAnimal = this.statusAnimalDAO.findAll();
			for (StatusAnimal statusAnimal2 : statusAnimal) {
				if (statusAnimal2.getStatus() == true) {

					statusAnimalTrue.add(statusAnimal2);

				}
			}

		} catch (Exception e) {

			this.simpleEntityManager.rollBack();

			e.printStackTrace();

		} finally {

			this.simpleEntityManager.close();

		}

		return JSONUtil.objectToJSON(statusAnimalTrue).toString();
	}

}
