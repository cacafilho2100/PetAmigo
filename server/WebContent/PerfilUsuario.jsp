<!DOCTYPE html>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.petAmigo.controller.AnimalController"%>
<%@page import="br.com.petAmigo.model.entity.Animal"%>
<%@page import="br.com.petAmigo.model.entity.Usuario"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<html lang="en">
<head>
<title>Perfil</title>
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

	<div class="content">
		<div class="container">
			<!-- <div class="col-md-4 w3ls_dresses_grid_left">
				<div class="w3ls_dresses_grid_left_grid">
					<div class="w3ls_dresses_grid_left_grid">
						<div class="dresses_img_hover">
							<img src="imagens/anuncieaqui.png" alt=" " class="img-responsive" />

						</div>
					</div>
				</div>
				<div class="w3ls_dresses_grid_left_grid">
					<div class="dresses_img_hover">
						<img src="imagens/anuncieaqui.png" alt=" " class="img-responsive" />

					</div>
				</div>
			</div> -->
			<div>
				<fieldset>
					<legend>PERFIL</legend>
					<table class="table">
						<tr>
							<td><label for="nome">Nome: <%=usuarioAutenticado.getNome()%>
							</label></td>
						</tr>
						<tr>
							<td><label for="email">Email: <%=usuarioAutenticado.getEmail()%>
							</label></td>
						</tr>
						<tr>
							<td><label for="cidadde">Cidade: <%=usuarioAutenticado.getCidade()%></label></td>
						</tr>
						<tr>
							<td><label for="sexo">Sexo: <%=usuarioAutenticado.getSexo()%>
							</label></td>
						</tr>
						<tr>
							<td><label for="telefone">Telefone: <%=usuarioAutenticado.getTelefone()%>
							</label></td>

						</tr>
					</table>
				</fieldset>
				<ul class="nav navbar-nav ">
					<li><a href="EditarUsuario.jsp"  class="btn btn-success"><span>Editar Informações</span></a></li>
					<li><a href="CadastroAnimal.jsp" class="btn btn-info"><span>Cadastrar Animal</span></a></li>
				</ul>
		
			</div>
			<legend>Seus Animais Cadastrados</legend>

			<div class="left .col-md-6">

				<table class="table">
					<tr>
						<th>Nome</th>
						<th>Raça</th>
						<th>Idade</th>
						<th>Sexo</th>
						<th>Pelagem</th>
						<th>Porte</th>
						<th>Serviço</th>
						<th>#</th>
					</tr>

					<%
						ArrayList<Animal> animais = new ArrayList<Animal>();
						AnimalController animalController = new AnimalController();
						animais = animalController.getAnimaisById(usuarioAutenticado.getId());

						for (int i = 0; i < animais.size(); i++) {
					%>


					<tr>
						<td><%=animais.get(i).getNome()%></td>
						<td><%=animais.get(i).getRaca()%></td>
						<td><%=animais.get(i).getIdade()%></td>
						<td><%=animais.get(i).getSexo()%></td>
						<td><%=animais.get(i).getPelagem()%></td>
						<td><%=animais.get(i).getPorte()%></td>
						<td><%=animais.get(i).getStatusAnimal().getStatusAnimal()%></td>
						<td><a type="button"
							href="editar-animal?id=<%=animais.get(i).getId()%>"
							class="btn btn-warning">Editar</a></td>
						<td><a type="button"
							href="deletar-animal?id=<%=animais.get(i).getId()%>"
							class="btn btn-danger">Excluir</a></td>
					</tr>

					<%
						}
					%>
				</table>
			</div>
		</div>
	</div>

	<c:import url="rodape.jsp" />

</body>
</html>
