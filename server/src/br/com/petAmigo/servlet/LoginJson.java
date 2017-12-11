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
import br.com.petAmigo.util.JSONUtil;
import java.util.ArrayList;

/**
 * Servlet implementation class Login
 */
@WebServlet("/LoginJson")
public class LoginJson extends HttpServlet {
	private static final long serialVersionUID = 1L;
	LoginController loginController = new LoginController();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginJson() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession sessao = request.getSession();
		String email = request.getParameter("emailLogin");
		String senha = request.getParameter("senhaLogin");
                String tipo = request.getParameter("tipoLogin");
                
		Usuario usuarioAutenticado = new Usuario();
                ArrayList<String> loginStatus = new ArrayList<>();
                
                if("facebook".equals(tipo) || "google".equals(tipo)){
                    usuarioAutenticado = loginController.loginSocial(email);
                } else {
                    usuarioAutenticado = loginController.login(email, senha);
                }

		if (usuarioAutenticado != null) {
                    loginStatus.add("true");
                    loginStatus.add(usuarioAutenticado.getNome());
                    loginStatus.add(usuarioAutenticado.getEmail());

		} else {
                    loginStatus.add("false");
		}
                
                response.getWriter().append(JSONUtil.objectToJSON(loginStatus));
                
	}

}
