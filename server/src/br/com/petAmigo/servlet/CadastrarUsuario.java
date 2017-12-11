package br.com.petAmigo.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.petAmigo.controller.UsuarioController;
import br.com.petAmigo.model.entity.Usuario;

/**
 * Servlet implementation class CadastrarUsuario
 */
@WebServlet("/cadastrar-usuario")
public class CadastrarUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UsuarioController usuarioController;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CadastrarUsuario() {
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

		usuarioController = new UsuarioController();

		String nome = request.getParameter("nome");
		String email = request.getParameter("email");
		String cidade = request.getParameter("cidade");
		String sexo = request.getParameter("sexo");
		String telefone = request.getParameter("telefone");
		String senha = request.getParameter("senha1");
		String confirmeSenha = request.getParameter("senha2");

		Usuario usuario = new Usuario();
		usuario.setNome(nome);
		usuario.setEmail(email);
		usuario.setCidade(cidade);
		usuario.setSexo(sexo);
		usuario.setTelefone(telefone);
		usuario.setSenha(senha);
		usuario.setConfirmeSenha(confirmeSenha);

		boolean cadastrou = usuarioController.create(usuario);

		if (cadastrou) {

			response.sendRedirect("login.jsp");

		} else {

			response.sendError(500, "Algo deu errado na tentativa de efetuar o cadastro");

		}

	}

}
