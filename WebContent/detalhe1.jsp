<!DOCTYPE html>
<%@page import="br.com.petAmigo.model.entity.Animal"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html lang="en">
<head>
<title>Pet Amigo</title>

<script>
	$(window).load(function() {
		$('.flexslider').flexslider({
			animation : "slide",
			controlNav : "thumbnails"
		});
	});
</script>

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
	</div> -->

	<%
		Animal pet = (Animal) request.getAttribute("animal");
	%>

	<div class="products">
		<div class="container">
			<div class="single-page">
				<div class="single-page-row" id="detail-21">
					<div class="col-md-6 single-top-left">
						<div class="flexslider">
							<ul class="slides">
								<li data-thumb="download-file?file=<%=pet.getFoto().getName()%>">
									<div class="thumb-image detail_images">
										<img src="download-file?file=<%=pet.getFoto().getName()%>"
											data-imagezoom="true" class="img-responsive" alt="">
									</div>
								</li>
							</ul>
						</div>
					</div>
					<div class="col-md-6 single-top-right">
						<div>
							<fieldset>
								<legend>Detalhes</legend>
								<label for="lname"><b>NOME: <%=pet.getNome()%></b></label> <br>
								<label for="lname"><b>RAÇA: <%=pet.getRaca()%></b></label> <br>
								<label for="lname"><b>IDADE: <%=pet.getIdade()%></b></label> <br>
								<label for="lname"><b>SEXO: <%=pet.getSexo()%></b></label> <br>
								<label for="lname"><b>PELAGEM: <%=pet.getPelagem()%></b></label>
								<br> <label for="lname"><b>PORTE: <%=pet.getPorte()%></b></label>
								<br> <label for="lname"><b>Informações Adicionais: <%=pet.getInformações()%></b></label>

								<legend>Contato</legend>
								<label for="lname"><b>NOME: <%=pet.getUsuario().getNome()%></b></label>
								<br> <label for="lname"><b>TELEFONE: <%=pet.getUsuario().getTelefone()%></b></label>
								<br> <label for="lname"><b>EMAIL: <%=pet.getUsuario().getEmail()%></b></label>
								<br>

							</fieldset>
						</div>

					</div>

				</div>


			</div>
		</div>
	</div>
	<c:import url="rodape.jsp" />
</body>
</html>