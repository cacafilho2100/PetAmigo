package br.com.petAmigo.controller;

import br.com.petAmigo.model.dao.impl.LoginDAO;
import br.com.petAmigo.model.entity.Usuario;
import br.com.petAmigo.model.jpa.impl.JPAUtil;
import br.com.petAmigo.util.Constants;
import br.com.petAmigo.util.StringUtil;

public class LoginController {

	private LoginDAO loginDAO;
	private JPAUtil simpleEntityManager;

	public Usuario login(String email, String senha) {

		this.simpleEntityManager = JPAUtil.getInstance(Constants.PERSISTENCE_UNIT_NAME);
		this.loginDAO = new LoginDAO(this.simpleEntityManager.getEntityManager());
		Usuario usuario = null;
		boolean validar = false;

		try {

			simpleEntityManager.beginTransaction();

			usuario = loginDAO.verificandoUsuario(email);

			if (usuario != null) {
				
				if (usuario.getSenha().equals(StringUtil.SHA1(senha))) {

					validar = true;

				} else {

					System.out.println("senha errada");

				}

			} else {

				System.out.println("usuario nao encontrado");
			}

		} catch (Exception e) {

			this.simpleEntityManager.rollBack();

			e.printStackTrace();

		} finally {

			this.simpleEntityManager.close();
		}

		if (validar) {

			return usuario;
		} else {
			return null;
		}
	}
}
