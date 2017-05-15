package br.com.petAmigo.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.com.petAmigo.controller.UsuarioController;
import br.com.petAmigo.model.entity.Usuario;

/**
 * Servlet implementation class EditarUsuario
 */
@WebServlet("/editar-usuario")
public class EditarUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UsuarioController usuarioController;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditarUsuario() {
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

		Long id = Long.parseLong(request.getParameter("id"));
		String nome = request.getParameter("nome");
		String email = request.getParameter("email");
		String cidade = request.getParameter("cidade");
		String sexo = request.getParameter("sexo");
		String telefone = request.getParameter("telefone");
		

		Usuario usuario = new Usuario();
		
		usuario.setId(id);
		usuario.setNome(nome);
		usuario.setEmail(email);
		usuario.setCidade(cidade);
		usuario.setSexo(sexo);
		usuario.setTelefone(telefone);

		boolean editou = usuarioController.update(id, usuario);

		if (editou) {
			
			HttpSession sessao = request.getSession();
			sessao.removeAttribute("usuarioAutenticado");
			sessao.setAttribute("usuarioAutenticado", usuario);
			response.sendRedirect("PerfilUsuario.jsp");

		} else {

			response.sendError(500, "Algo deu errado na tentativa de efetuar o cadastro");

		}

	}

}
