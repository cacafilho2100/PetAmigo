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

	<div class="content">
		<div class="container">

			<div class="login">

				<div class="main-agileits">
					<div class="form-w3agile">
						<h3>Login</h3>
						<form action="login" method="post">
							<div class="key">

								<input type="text" name="emailLogin" required=""
									placeholder="Email">
								<div class="clearfix"></div>
							</div>
							<div class="key">

								<input type="password" name="senhaLogin" required=""
									placeholder="Senha">
								<div class="clearfix"></div>
							</div>
							<input type="submit" value="ENTRAR">
						</form>
					</div>
					<div class="forg">
						<a href="#" class="forg-left">Esqueci minha senha</a> <a
							href="CadastroUsuario.jsp" class="forg-right">Se cadastrar</a>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>




		</div>
	</div>

	<c:import url="rodape.jsp"></c:import>
	
</body>
</html>
