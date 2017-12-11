<!DOCTYPE html>
<html lang="en">
<head>
<title>Pet Amigo</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<script type="application/x-javascript">
	
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 

		function validarSenha() {
			senha1 = document.f1.senha1.value
			senha2 = document.f1.senha2.value

			if (senha1 != senha2){
				alert("SENHAS DIFERENTES")
				return false;
		}
			return true;
		}

</script>
<!-- css -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css"
	media="all" />
<!--// css -->
<!-- font -->
<link href="//fonts.googleapis.com/css?family=Source+Sans+Pro"
	rel="stylesheet">
<link
	href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic'
	rel='stylesheet' type='text/css'>
<!-- //font -->
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/bootstrap.js"></script>
</head>
<body>
	<div class="header-top-w3layouts">
		<div class="container">
			<div class="col-md-6 logo-w3">
				<a href="index.jsp"><img src="imagens/pata.jpg" alt=" " />
					<h1>Pet Amigo</h1></a>
			</div>

		</div>
		<div class="header-bottom-w3ls">
			<div class="container">
				<div class="col-md-7 navigation-agileits">
					<nav class="navbar navbar-default">
						<div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
							<ul class="nav navbar-nav ">
								<li><a href="index.jsp" class="hyper "><span>Inicio</span></a></li>
								<li><a href="AdoteUmAnimal.jsp" class="hyper"><span>Adote
											um animal</span></a></li>
								<li><a href="EncontreUmPar.jsp" class="hyper"><span>
											Encontre um par</span></a></li>
								<li><a href="AnimaisPerdidos.jsp" class="hyper"><span>Perdidos</span></a></li>
								<li><a href="DoadoresSangue.jsp" class="hyper"><span>Doadores
											de Sangue</span></a></li>
							</ul>
						</div>
					</nav>
				</div>


			</div>
		</div>

		<div class="login">

			<div class="main-agileits">
				<div class="form-w3agile">
					<h3>Cadastre-se</h3>
					<form name="f1" action="cadastrar-usuario" method="post" onsubmit="return validarSenha();">
						<div class="key">
							<input type="text" name="nome" required placeholder="Nome">
							<div class="clearfix"></div>
						</div>
						<div class="key">

							<input type="text" name="email" required placeholder="Email">
							<div class="clearfix"></div>
						</div>
						<div class="key">

							<input type="password" name="senha1" required placeholder="Senha">
							<div class="clearfix"></div>
						</div>
						<div class="key">

							<input type="password" name="senha2" required placeholder="Confirme senha">
							<div class="clearfix"></div>
						</div>
						<div class="key">
						
							<input type="text" name="cidade" required placeholder="Cidade">
							<div class="clearfix"></div>
						</div>
						<div class="key">
						
							<input type="text" name="telefone" required
								placeholder="Telefone">
							<div class="clearfix"></div>
						</div>
						<div class="form-group">
						
							Masculino <input type="radio" name="sexo" value="Homem" required><br>
							Feminino <input type="radio" name="sexo" value="Mulher" required>
						</div>
						<div class="clearfix"></div>
						<input type="submit" value="Cadastrar">
					</form>
				</div>
			</div>
		</div>

		<div class="footer">
			<div class="container">
				<div class="col-md-3 footer-grids fgd1">
					<a href="index.html"><h3>Pet Amigo</h3></a>
					<ul>
						<li>Caruaru</li>
						<li>Pernanbuco.</li>
						<li><a href="mailto:info@example.com">petamigo@outlook.com</a></li>
						<a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
						<a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
						<a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a>
					</ul>
				</div>
				<div class="col-md-3 footer-grids fgd2">
					<h4>Informações</h4>
					<ul>
						<li><a href="FaleConosco.jsp">Fale Conosco</a></li>
						<li><a href="Dicas.jsp">Dicas</a></li>
						<li><a href="QuemSomos.jsp">Quem somos</a></li>
					</ul>
				</div>
				<div class="col-md-3 footer-grids fgd3">
					<h4>Animais</h4>
					<ul>
						<li><a href="AdoteUmAnimal.jsp">Adote</a></li>
						<li><a href="EncontreUmPar.jsp">Encontre um par</a></li>
						<li><a href="AnimaisPerdidos.jsp">Animais Perdidos</a></li>

					</ul>
				</div>
				<div class="col-md-3 footer-grids fgd4">
					<h4>Minha Conta</h4>
					<ul>

						<li><a href="login.html">Login</a></li>
						<li><a href="CadastroUsuario.jsp">Se cadastre</a></li>
					</ul>
				</div>
				<div class="clearfix"></div>
				<p class="copy-right">© 2016 Pet Amigo . Todos os direitos
					reservados | Design por VieCost Software</p>
			</div>
		</div>
</body>
</html>