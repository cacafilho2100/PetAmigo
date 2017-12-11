<!DOCTYPE html>
<%@page import="br.com.petAmigo.util.Constants"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="br.com.petAmigo.controller.AnimalController"%>
<%@page import="br.com.petAmigo.model.entity.Animal"%>
<%@page import="java.util.ArrayList"%>
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
	%>

	<c:import url="cabecalho2.jsp"></c:import>

	<%
		} else {
	%>

	<c:import url="cabecalho.jsp" />

	<%
		}
	%>
	<%
		ArrayList<Animal> animals = new ArrayList<>();
		AnimalController animalController = new AnimalController();

		animals = animalController.listAnimaisCruzar();
	%>

	<%-- <div class="col-md-4 w3ls_dresses_grid_left">
		<div class="w3ls_dresses_grid_left_grid">
			<h3>Login</h3>
			<div class="w3ls_dresses_grid_left_grid_sub">
				<div class="ecommerce_dres-type">
					<div class="key">
						Bem Vindo !!
						<div class="clearfix"></div>
					</div>
					<div class="key">
						<a href="PerfilUsuario.jsp"><%=usuarioAutenticado.getNome()%>
						</a>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
		</div>
		<div class="w3ls_dresses_grid_left_grid">
			<div class="dresses_img_hover">
				<img src="imagens/anuncieaqui.png" alt=" " class="img-responsive" />

			</div>
		</div>
	</div> --%>

	<h1>Encontre Um Par</h1>

	<div class="col-md-8 col-sm-8 women-dresses">
		<div class="women-set1">

			<%
				for (Animal animal : animals) {
			%>


			<div class="col-md-4 women-grids wp1 animated wow slideInUp"
				data-wow-delay=".5s">
				<a href="detalhe?id=<%=animal.getId()%>">
					<div class="product-img">
						<img src="download-file?file=<%=animal.getFoto().getName()%>" />
					</div>
				</a>

				<h5>
					Nome:
					<%=animal.getNome()%></h5>
				<h5>
					Idade:
					<%=animal.getIdade()%></h5>
				<h5>
					Raca:
					<%=animal.getRaca()%></h5>
				<h5>
					Sexo:
					<%=animal.getSexo()%></h5>

			</div>

			<%
				}
			%>


		</div>
	</div>

	<c:import url="rodape.jsp" />

</body>
</html>