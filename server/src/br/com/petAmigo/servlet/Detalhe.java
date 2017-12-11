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
 * Servlet implementation class Detalhe
 */
@WebServlet("/detalhe")
public class Detalhe extends HttpServlet {
	private static final long serialVersionUID = 1L;
	AnimalController animalController;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Detalhe() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Long id = Long.parseLong(request.getParameter("id"));

		animalController = new AnimalController();

		Animal animal = animalController.getAnimalById(id);
		RequestDispatcher dispatcher = request.getRequestDispatcher("detalhe1.jsp");
		request.setAttribute("animal", animal);
		dispatcher.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
