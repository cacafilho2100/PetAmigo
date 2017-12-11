package br.com.petAmigo.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.petAmigo.controller.AnimalController;

/**
 * Servlet implementation class AnimaisJson
 */
@WebServlet("/AnimaisPerdidosJson")
public class AnimaisPerdidosJson extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AnimalController animalController;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnimaisPerdidosJson() {
        super();
        animalController = new AnimalController(); //http://localhost:8080/PetAmigo/AnimaisPerdidosJson
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String json = animalController.listAnimaisPerdidosGson(); //busca informa�oes do bd
                
                response.setHeader("Content-Type", "application/json;charset=UTF-8");
		response.getWriter().append(json);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
