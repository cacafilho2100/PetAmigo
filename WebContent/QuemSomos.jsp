<!DOCTYPE html>
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



	<!--<div class="col-md-4 w3ls_dresses_grid_left">
			<div class="w3ls_dresses_grid_left_grid">
				<h3>Login</h3>
					<div class="w3ls_dresses_grid_left_grid_sub">
						<div class="ecommerce_dres-type">
							<form action="#" method="post">
						<div class="key">
							<input  type="text" name="Email" required="" placeholder="Email">
							<div class="clearfix"></div>
						</div>
						<div class="key">
							<input  type="password" name="Password" required="" placeholder="Senha">
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
	<h1>Quem Somos.</h1>
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<h5>O grupo VieCost Software ,foi fundado no ano de 2016, na
		cidade de Caruaru-PE pelos jovens João Paulo Viegas e Carlos Alberto
		Costa. Sua principal missão é oferecer qualidade e segurança, no
		desenvolvimento de sites e aplicativos Android.</h5>
	<h5>Nosso principal projeto, está sendo o 'Pet Amigo', destinado
		para adoção de animais, cruzamento entre pets e e divulgação de
		animais perdidos. O site estará disponível em breve. Atualmente,
		contamos com a tecnologia Java e HTML5 para nosso desenvolvimento de
		Sistemas Web e Aplicativos Android. Trabalhamos com consultoria
		autônoma de forma que o cliente esteja ambientado com o mundo
		tecnológico e seus benefícios.</h5>
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<h4>VieCost Software</h4>
	<h5>2016</h5>
	<h5>Todos os Direitos Reservados.</h5>

	<c:import url="rodape.jsp" />

</body>
</html>