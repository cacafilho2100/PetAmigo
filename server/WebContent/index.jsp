<!DOCTYPE html>
<%@page import="br.com.petAmigo.model.entity.Usuario"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.List"%>
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
	
	<div>
	<h2>Bem vindo!</h2>
	<h3> O site Pet Amigo foi criado no intuito de ajudar nossos amigos bichanos a encontrarem seus donos, ajudar à encontrar um par 
	para cruzar, e também, favorecer o próximo com doações de sangue.</h3>
	<h4>Usufrua do nosso site e nos ajude nessa grande causa!</h4>
	</div>

	<div class="content">
		<div class="container">
			<div class="col-md-4 w3ls_dresses_grid_left">
				<div class="w3ls_dresses_grid_left_grid">
					<div class="dresses_img_hover">
						<!-- <img src="imagens/anuncieaqui.png" alt=" " class="img-responsive" /> -->

					</div>
				</div>

				<div class="w3ls_dresses_grid_left_grid">
					<div class="dresses_img_hover">
						<!-- <img src="imagens/anuncieaqui.png" alt=" " class="img-responsive" /> -->

					</div>
				</div>
			</div>

			<div class="col-md-8 col-sm-8 women-dresses"></div>
		</div>
	</div>


	<c:import url="rodape.jsp" />

</body>
</html>

