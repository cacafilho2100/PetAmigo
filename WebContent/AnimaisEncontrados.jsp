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

			response.sendRedirect("login.jsp");

		} else {
	%>

	<c:import url="cabecalho.jsp" />
	<%
		}
	%>

	<div class="col-md-4 w3ls_dresses_grid_left">
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
						<input type="submit" value="Login">
					</form>
				</div>
			</div>
		</div>
		<div class="w3ls_dresses_grid_left_grid">
			<div class="dresses_img_hover">
				<img src="imagens/anuncieaqui.png" alt=" " class="img-responsive" />

			</div>
		</div>
	</div>

	<!--iniciando conteudo-->
	<h1>Animais Encontrados</h1>
	<div class="col-md-8 col-sm-8 women-dresses">
		<div class="women-set1">
			<div class="col-md-4 women-grids wp1 animated wow slideInUp"
				data-wow-delay=".5s">
				<a href="detalhe1.jsp"><div class="product-img">
						<img src="imagens/dog1.jpg" alt="" />

					</div></a>

				<h4>Beethoven</h4>
				<h5>5 anos</h5>
				<h5>Vira lata</h5>
				<h5>Encontrado</h5>
				<h5>96785888</h5>
			</div>
			<div class="col-md-4 women-grids wp2 animated wow slideInUp"
				data-wow-delay=".5s">
				<a href="detalhe1.jsp"><div class="product-img">
						<img src="imagens/dog2.jpg" alt="" />

					</div></a>

				<h4>Kuki</h4>
				<h5>2anos</h5>
				<h5>Vira lata</h5>
				<h5>Encontrado</h5>
			</div>
			<div class="col-md-4 women-grids wp3 animated wow slideInUp"
				data-wow-delay=".5s">
				<a href="detalhe1.jsp"><div class="product-img">
						<img src="imagens/dog3.jpg" alt="" />

					</div></a>

				<h4>Spike</h4>
				<h5>3anos</h5>
				<h5>Pitbull</h5>
				<h5>Encontrado</h5>
				<h5>98989898</h5>

			</div>
			<div class="clearfix"></div>
		</div>
		<div class="women-set2">
			<div class="col-md-4 women-grids wp4 animated wow slideInUp"
				data-wow-delay=".5s">
				<a href="detalhe1.jsp"><div class="product-img">
						<img src="imagens/cat1.jpg" alt="" />

					</div></a>

				<h4>Sem nome</h4>
				<h5>2anos</h5>
				<h5>Persa</h5>
				<h5>Encontrado</h5>
				<h5>fulanin@hotm.com</h5>
			</div>
			<div class="col-md-4 women-grids wp5 animated wow slideInUp"
				data-wow-delay=".5s">
				<a href="detalhe1.jsp"><div class="product-img">
						<img src="imagens/dog4.jpg" alt="" />

					</div></a>

				<h4>Sem nome</h4>
				<h5>5 anos</h5>
				<h5>Pastor Alemão</h5>
				<h5>Encontrado</h5>
				<h5>67767676</h5>
			</div>
			<div class="col-md-4 women-grids wp5 animated wow slideInUp"
				data-wow-delay=".5s">
				<a href="detalhe1.jsp"><div class="product-img">
						<img src="imagens/dog7.jpg" alt="" />

					</div></a>

				<h4>Sem nome</h4>
				<h5>5 anos</h5>
				<h5>Pastor Alemão</h5>
				<h5>Encontrado</h5>
				<h5>98983838</h5>
			</div>

		</div>
	</div>


	<c:import url="rodape.jsp" />

</body>
</html>