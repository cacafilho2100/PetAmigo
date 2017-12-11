<!DOCTYPE html>
<%@page import="br.com.petAmigo.model.entity.Usuario"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html lang="en">
<head>
<title>Pet Amigo</title>

</head>
<body>

	<%
		if (request.getSession().getAttribute("usuarioAutenticado") == null) {

			response.sendRedirect("login.jsp");

		} else {
	%>
	<c:import url="cabecalho.jsp" />
	<%
		}
	%>
	<%
		HttpSession sessao = request.getSession();
		Usuario usuarioAutenticado = (Usuario) sessao.getAttribute("usuarioAutenticado");
	%>
	<div class="login">

		<div class="main-agileits">
			<div class="form-w3agile">
				<h3>Edite seu Perfil</h3>
				<form name="f1" action="editar-usuario" method="post">
					<div class="key">
					<input type="hidden" name="id" value="<%=usuarioAutenticado.getId()%>"> 
					
					Nome<input type="text" name="nome" value="<%=usuarioAutenticado.getNome()%>"
							required> 
						<div class="clearfix"></div>
					</div>
					<div class="key">

						Email<input type="email" name="email"
							value="<%=usuarioAutenticado.getEmail()%>" required>
						<div class="clearfix"></div>
					</div>

					<div class="key">

						Cidade<input type="text" name="cidade"
							value="<%=usuarioAutenticado.getCidade()%>" required>
						<div class="clearfix"></div>
					</div>
					<div class="key">

					Telefone<input type="text" name="telefone"
							value="<%=usuarioAutenticado.getTelefone()%>" required>
						<div class="clearfix"></div>
					</div>
					<div class="form-group">
						<%
							if (usuarioAutenticado.getSexo().equals("Homem")) {
						%>
						Masculino <input type="radio" name="sexo" value="Homem"
							checked="checked" required><br>
						<%
							} else {
						%>
						Masculino <input type="radio" name="sexo" value="Homem" required><br>
						<%
							}
						%>
						<%
							if (usuarioAutenticado.getSexo().equals("Mulher")) {
						%>
						Feminino <input type="radio" name="sexo" value="Mulher"
							checked="checked" required>
						<%
							} else {
						%>

						Feminino <input type="radio" name="sexo" value="Mulher" required>

						<%
							}
						%>
					</div>
					<div class="clearfix"></div>
					<input type="submit" value="Editar">
				</form>
			</div>
		</div>
	</div>

	<c:import url="rodape.jsp" />

</body>
</html>