<!DOCTYPE html>
<%@page import="br.com.petAmigo.controller.AnimalController"%>
<%@page import="br.com.petAmigo.model.entity.Animal"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html lang="en">
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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

		animals = animalController.listAnimaisAdocao();
	%>

	<!-- <div class="col-md-4 w3ls_dresses_grid_left">
		<div class="w3ls_dresses_grid_left_grid">
			<h3>Login</h3>
			<div class="w3ls_dresses_grid_left_grid_sub">
				<div class="ecommerce_dres-type">
					<form action="#" method="post">
						<div class="key">
							<input type="text" name="Email" required="" placeholder="Email">
							<div class="clearfix"></div>
						</div>
						<div class="key">
							<input type="password" name="Password" required=""
								placeholder="Senha">
							<div class="clearfix"></div>
						</div>
						<input type="submit" value="ENTRAR">
					</form>
				</div>
			</div>
		</div>
		<div class="w3ls_dresses_grid_left_grid">
			<div class="dresses_img_hover">
				<img src="imagens/anuncieaqui.png" alt=" " class="img-responsive" />

			</div>
		</div>
	</div>-->

	<h1>Adoção</h1>
       <div class="row">
        <div class="dropdown col-md-1" style="margin-right: 100px; float: right;">
  <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Pelagem
  <span class="caret"></span></button>
  <ul class="dropdown-menu ">
    <li><a href="AdoteUmAnimal-Longo.jsp">Longo</a></li>
    <li><a href="AdoteUmAnimal-Curto.jsp">Curto</a></li>
    <li><a href="AdoteUmAnimal-Medio.jsp">Médio</a></li>
     <li><a href="AdoteUmAnimal.jsp">Todos</a></li>
  </ul>
</div>

        
        <div class="row">
        <div class="dropdown col-md-1"  style="float: right;">
  <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Porte
  <span class="caret"></span></button>
  <ul class="dropdown-menu col-md-4">
    <li><a href="AdoteUmAnimal-Grande.jsp">Grande</a></li>
    <li><a href="AdoteUmAnimal-MedioP.jsp">Médio</a></li>
    <li><a href="AdoteUmAnimal-Pequeno.jsp">Pequeno</a></li>
     <li><a href="AdoteUmAnimal.jsp">Todos</a></li>
  </ul>
</div>
        </div>
                        
                       <div id="Longo" class="col-md-8 col-sm-8 women-dresses">
		<div class="women-set1">

			<%
				for (Animal animal : animals) {
                                    if(animal.getPorte().equals("medio")){
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
					<%=animal.getNome() %></h5>
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
                            }
			%>

		</div>
	</div>
                        
                       
	<c:import url="rodape.jsp" />

</body>
</html>