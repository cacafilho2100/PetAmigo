package br.com.petAmigo.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import br.com.petAmigo.controller.UsuarioController;
import br.com.petAmigo.model.entity.Usuario;

/**
 * Servlet implementation class CadastrarUsuarioJson
 */
@WebServlet("/CadastrarUsuarioJson")
public class CadastrarUsuarioJson extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UsuarioController usuarioController;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CadastrarUsuarioJson() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Usuario usuario;

		usuarioController = new UsuarioController();

		usuario = new Gson().fromJson(request.getReader(), Usuario.class);

		usuarioController.create(usuario);

	}

}
