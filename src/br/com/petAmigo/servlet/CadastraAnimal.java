package br.com.petAmigo.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.petAmigo.controller.AnimalController;
import br.com.petAmigo.model.entity.Animal;

/**
 * Servlet implementation class CadastraAnimal
 */
@WebServlet("/cadastra-animal")
public class CadastraAnimal extends HttpServlet {
	private static final long serialVersionUID = 1L;

	AnimalController animalController;
	Animal animal;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CadastraAnimal() {
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

		animalController = new AnimalController();

		boolean cadastrou = animalController.create(request);

		if (cadastrou) {

			response.sendRedirect("PerfilUsuario.jsp");

		} else {

			response.sendRedirect("CadastroAnimal.jsp");
			response.sendError(500, "Animal Não Cadastrado");

		}

	}
}
