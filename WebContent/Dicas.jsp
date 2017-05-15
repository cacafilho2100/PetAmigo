<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
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

<div class="content">
	<div class="container">
		<!-- <div class="col-md-4 w3ls_dresses_grid_left">
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
		<h1>Dicas</h1>
		<br/><br/>
		<h4>Dica 1 : Dicas de Cuidados com seu Animal</h4>
		<h5>Conheça algumas dicas para você conviver melhor com o seu animal de estimação, clicando no link abaixo:
		<a href="http://www.protecaoanimal.curitiba.pr.gov.br/Conteudo/Dicas.aspx" target="blank">http://www.protecaoanimal.curitiba.pr.gov.br/Conteudo/Dicas.aspx</a> </h5>
	    <br/><br/>
	    <h4>Dica 2 : Dicas sobre Saúde Animal</h4>
	    <h5>Acesse o link : <a href="https://clubedosanimais.com.br/dicas-de-saude-animal/" target="blank">https://clubedosanimais.com.br/dicas-de-saude-animal/</a></h5>
	</div>
</div>


	<c:import url="rodape.jsp"/>
		
</body>
</html>
