<!DOCTYPE html>
<%@page import="br.com.petAmigo.model.entity.Animal"%>
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
	
	<%Animal pet = (Animal) request.getAttribute("animal");%>

	<div class="login">

		<div class="main-agileits">
			<div class="form-w3agile">
				<h3>Cadastro do Animal</h3>
				<form action="editar-animal" method="post">
					<div class="key">
						<input type="hidden" name="id" required value="<%=pet.getId()%>">
						<input type="text" name="nome" required value="<%=pet.getNome()%>">
						<div class="clearfix"></div>
					</div>
					<div class="key">

						<input type="text" name="raca" required value="<%=pet.getRaca()%>">
						<div class="clearfix"></div>
					</div>
					<div class="key">

						<input type="number" name="idade" required
							value="<%=pet.getIdade()%>">
						<div class="clearfix"></div>
					</div>
					<div class="key">
						<h6>SEXO</h6>
						<%
							if (pet.getSexo().equals("macho")) {
						%>

						<input type="radio" name="sexo" value="macho" checked="checked" />
						Macho <input type="radio" name="sexo" value="femea" /> Femea
						<%
							} else {
						%>

						<input type="radio" name="sexo" value="macho" /> Macho <input
							type="radio" name="sexo" value="femea" checked="checked" />
						Femea

						<%
							}
						%>

						<div class="clearfix"></div>
					</div>
					<div class="key">

						<h6>PELAGEM</h6>

						<%
							if (pet.getPelagem().equals("curto")) {
						%>

						<input type="radio" name="pelagem" value="curto" checked="checked" />
						Curto <br /> <input type="radio" name="pelagem" value="longo" />
						Longo <br />

						<%
							} else {
						%>

						<input type="radio" name="pelagem" value="curto" /> Curto <br />
						<input type="radio" name="pelagem" value="longo" checked="checked" />
						Longo <br />

						<%
							}
						%>

						<div class="clearfix"></div>
					</div>
					<div class="key">

						<h6>PORTE</h6>

						<%
							if (pet.getPorte().equals("pequeno")) {
						%>

						<input type="radio" name="porte" value="pequeno" checked="checked" />
						Pequeno <br /> <input type="radio" name="porte" value="medio" />
						Medio <br /> <input type="radio" name="porte" value="grande" />
						Grande <br />

						<%
							} else if (pet.getPorte().equals("medio")) {
						%>

						<input type="radio" name="porte" value="pequeno" /> Pequeno <br />
						<input type="radio" name="porte" value="medio" checked="checked" />
						Medio <br /> <input type="radio" name="porte" value="grande" />
						Grande <br />

						<%
							} else if (pet.getPorte().equals("grande")) {
						%>

						<input type="radio" name="porte" value="pequeno" /> Pequeno <br />
						<input type="radio" name="porte" value="medio" /> Medio <br /> <input
							type="radio" name="porte" value="grande" checked="checked" />
						Grande <br />

						<%
							}
						%>
						<div class="clearfix"></div>
					</div>
					<div class="key">

						<h6>Especificação do cadastro</h6>
						<br> <select id="tudo" name="statusAnimal">

							<%
								for (int i = 0; i < animal.size(); i++) {
							%>

							<option value="<%=animal.get(i).getId()%>"
							<%if(pet.getStatusAnimal().getStatusAnimal().equals(animal.get(i).getStatusAnimal())){%> 
							selected="selected"<%}%>> 
							<%=animal.get(i).getStatusAnimal()%>
							</option>
							<%
								}
							%>
						</select>

						<div class="clearfix"></div>
					</div>

					<input type="submit" value="Atualizar">
				</form>
			</div>
		</div>
	</div>

	<c:import url="rodape.jsp" />

</body>
</html>