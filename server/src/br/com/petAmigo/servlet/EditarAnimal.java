package br.com.petAmigo.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.petAmigo.controller.AnimalController;
import br.com.petAmigo.model.entity.Animal;

/**
 * Servlet implementation class EditarAnimal
 */
@WebServlet("/editar-animal")
public class EditarAnimal extends HttpServlet {
	private static final long serialVersionUID = 1L;
	AnimalController animalController;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditarAnimal() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Long id = Long.parseLong(request.getParameter("id"));

		animalController = new AnimalController();

		Animal animal = animalController.getAnimalById(id);
		RequestDispatcher dispatcher = request.getRequestDispatcher("EditarAnimal.jsp");
		request.setAttribute("animal", animal);
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		animalController = new AnimalController();

		Long id = Long.parseLong(request.getParameter("id"));
		String nome = request.getParameter("nome");
		String raca = request.getParameter("raca");
		int idade = Integer.parseInt(request.getParameter("idade"));
		String sexo = request.getParameter("sexo");
		String pelagem = request.getParameter("pelagem");
		String porte = request.getParameter("porte");
		Long statusAnimal = Long.parseLong(request.getParameter("statusAnimal"));

		if (animalController.update(id, nome, raca, idade, sexo, pelagem, porte, statusAnimal)) {

			response.sendRedirect("PerfilUsuario.jsp");

		} else {

			response.getWriter().append("Ocorreu algum erro!");
			response.sendRedirect("index.jsp");
		}

	}

}
