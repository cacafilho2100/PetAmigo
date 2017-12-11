package br.com.petAmigo.controller;

import br.com.petAmigo.model.dao.impl.UsuarioDAO;
import br.com.petAmigo.model.entity.Usuario;
import br.com.petAmigo.model.jpa.impl.JPAUtil;
import br.com.petAmigo.util.Constants;
import br.com.petAmigo.util.JSONUtil;
import br.com.petAmigo.util.StringUtil;

public class UsuarioController {

	private UsuarioDAO usuarioDAO;
	private JPAUtil simpleEntityManager;

	public boolean create(Usuario usuario) {

		this.simpleEntityManager = JPAUtil.getInstance(Constants.PERSISTENCE_UNIT_NAME);
		this.usuarioDAO = new UsuarioDAO(this.simpleEntityManager.getEntityManager());

		try {

			this.simpleEntityManager.beginTransaction();

			if (!usuarioDAO.emailExiste(usuario.getEmail())) {
				if (usuario.getSenha().equals(usuario.getConfirmeSenha())) {
					if (usuario.getNome() != null) {

						usuario.setSenha(StringUtil.SHA1(usuario.getSenha()));
						usuario.setConfirmeSenha(StringUtil.SHA1(usuario.getConfirmeSenha()));
						usuario.setStatus(Constants.ACTIVE_ENTITY);
						usuarioDAO.save(usuario);
						simpleEntityManager.commit();

					} else {

						System.out.println("NOME DO USUARIO NULO");
						return false;

					}
				} else {

					System.out.println("SENHA NAO CONFERE");
					return false;
				}
			} else {

				System.out.println("EMAIL JA CADASTRADO");
				return false;
			}

		} catch (Exception e) {

			this.simpleEntityManager.rollBack();

			e.printStackTrace();

			return false;
		} finally {

			this.simpleEntityManager.close();
		}

		return true;
	}

	public boolean update(Long id, Usuario usuario) {

		this.simpleEntityManager = JPAUtil.getInstance(Constants.PERSISTENCE_UNIT_NAME);
		this.usuarioDAO = new UsuarioDAO(this.simpleEntityManager.getEntityManager());

		try {
			this.simpleEntityManager.beginTransaction();

			Usuario user = this.usuarioDAO.getById(id);

			if (user != null) {

				user.setNome(usuario.getNome());
				user.setCidade(usuario.getCidade());
				user.setTelefone(usuario.getTelefone());
				user.setSexo(usuario.getSexo());
				user.setStatus(Constants.ACTIVE_ENTITY);

				usuarioDAO.update(user);
				simpleEntityManager.commit();

			} else {

				System.out.println("USUARIO NAO EXISTE NA BASE DE DADOS");
				return false;
			}

		} catch (Exception e) {

			this.simpleEntityManager.rollBack();

			e.printStackTrace();

			return false;
		} finally {

			this.simpleEntityManager.close();
		}
		return true;
	}

	public boolean delete(Long id) {

		this.simpleEntityManager = JPAUtil.getInstance(Constants.PERSISTENCE_UNIT_NAME);
		this.usuarioDAO = new UsuarioDAO(this.simpleEntityManager.getEntityManager());

		try {

			this.simpleEntityManager.beginTransaction();

			Usuario usuario = this.usuarioDAO.getById(id);

			if (usuario != null) {

				usuario.setStatus(Constants.INACTIVE_ENTITY);
				this.simpleEntityManager.commit();

			} else {
				System.out.println("USUARIO CHEGOU NULO");
				return false;
			}

		} catch (

		Exception e) {

			this.simpleEntityManager.rollBack();

			e.printStackTrace();

			return false;
		} finally {

			this.simpleEntityManager.close();
		}
		return true;
	}

	public Usuario listaInfo(Long id) {

		this.simpleEntityManager = JPAUtil.getInstance(Constants.PERSISTENCE_UNIT_NAME);
		this.usuarioDAO = new UsuarioDAO(this.simpleEntityManager.getEntityManager());
		Usuario usuario = new Usuario();

		try {

			simpleEntityManager.beginTransaction();

			usuario = this.usuarioDAO.getById(id);

			if (usuario != null) {

				usuario.setSenha(null);
				usuario.setConfirmeSenha(null);

			} else {

				System.out.println("USUARIO NULO");
			}

		} catch (

		Exception e) {

			this.simpleEntityManager.rollBack();

			e.printStackTrace();

		} finally {

			this.simpleEntityManager.close();
		}

		return usuario;

	}
	
	public String listaInfoJson(Long id) {

		this.simpleEntityManager = JPAUtil.getInstance(Constants.PERSISTENCE_UNIT_NAME);
		this.usuarioDAO = new UsuarioDAO(this.simpleEntityManager.getEntityManager());
		Usuario usuario = new Usuario();

		try {

			simpleEntityManager.beginTransaction();

			usuario = this.usuarioDAO.getById(id);

			if (usuario != null) {

				usuario.setSenha(null);
				usuario.setConfirmeSenha(null);

			} else {

				System.out.println("USUARIO NULO");
			}

		} catch (

		Exception e) {

			this.simpleEntityManager.rollBack();

			e.printStackTrace();

		} finally {

			this.simpleEntityManager.close();
		}

			
		return JSONUtil.objectToJSON(usuario).toString();

	}

}
