package br.com.petAmigo.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.com.petAmigo.controller.LoginController;
import br.com.petAmigo.model.entity.Usuario;

/**
 * Servlet implementation class Login
 */
@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	LoginController loginController = new LoginController();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Login() {
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
		HttpSession sessao = request.getSession(false);
		if (sessao != null) {
			sessao.invalidate();
		}
		response.sendRedirect("index.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("emailLogin");
		String senha = request.getParameter("senhaLogin");

		Usuario usuarioAutenticado = new Usuario();

		usuarioAutenticado = loginController.login(email, senha);

		if (usuarioAutenticado != null) {
			HttpSession sessao = request.getSession();
			sessao.setAttribute("usuarioAutenticado", usuarioAutenticado);
			request.getRequestDispatcher("index.jsp").forward(request, response);

		} else {
			response.sendRedirect("login.jsp");
		}
	}

}
