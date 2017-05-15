<!DOCTYPE html>
<%@page import="br.com.petAmigo.controller.StatusAnimalController"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.petAmigo.model.entity.StatusAnimal"%>
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
		HttpSession sessao = request.getSession();
		Usuario usuarioAutenticado = (Usuario) sessao.getAttribute("usuarioAutenticado");

		StatusAnimalController statusAnimalController = new StatusAnimalController();
		ArrayList<StatusAnimal> animal = new ArrayList<StatusAnimal>();

		for (StatusAnimal statusAnimal : statusAnimalController.getListaStatus()) {

			animal.add(statusAnimal);

		}
	%>

	<div class="login">

		<div class="main-agileits">
			<div class="form-w3agile">
					<h3>Cadastro do Animal</h3>
					<form action="cadastra-animal" method="post"
						enctype="multipart/form-data">
						<div class="key">
							<input type="hidden" name="id"
								value="<%=usuarioAutenticado.getId()%>"> <input
								type="text" name="nome" required placeholder="Nome">
							<div class="clearfix"></div>
						</div>
						<div class="key">

							<input type="text" name="raca" required placeholder="Raca">
							<div class="clearfix"></div>
						</div>
						<div class="key">

							<input type="number" name="idade" required placeholder="Idade">
							<div class="clearfix"></div>
						</div>
						<div class="key">

							<input type="text" name="info" placeholder="Informações Adicionais">
							<div class="clearfix"></div>
						</div>
						<div class="key">

							<h6>SEXO</h6>
							<input type="radio" name="sexo" value="macho" /> Macho <input
								type="radio" name="sexo" value="femea" /> Femea
							<div class="clearfix"></div>
						</div>
						<div class="key">

							<h6>PELAGEM</h6>
							<input type="radio" name="pelagem" value="curto" /> Curto <br />
							<input type="radio" name="pelagem" value="longo" /> Longo <br />
							<div class="clearfix"></div>
						</div>
						<div class="key">

							<h6>PORTE</h6>
							<input type="radio" name="porte" value="pequeno" /> Pequeno <br />
							<input type="radio" name="porte" value="medio" /> Medio <br />
							<input type="radio" name="porte" value="grande" /> Grande <br />
							<div class="clearfix"></div>
						</div>
						<div class="key">

							<h6>Especificação do cadastro</h6>
							<br> <select id="tudo" name="statusAnimal">

								<%
									for (int i = 0; i < animal.size(); i++) {
								%>

								<option value="<%=animal.get(i).getId()%>"><%=animal.get(i).getStatusAnimal()%></option>

								<%
									}
								%>
							</select>

							<div class="clearfix"></div>
						</div>

						Imagem:<input type="file" name="imagem" required><br /> <input
							type="submit" value="Cadastrar">
					</form>
			</div>
		</div>
	</div>

	<c:import url="rodape.jsp" />

</body>
</html>