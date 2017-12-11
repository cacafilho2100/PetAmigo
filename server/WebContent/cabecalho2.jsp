<%@page import="br.com.petAmigo.model.entity.Usuario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <script src="http://i18next.com/public/download/latest/i18next.js"></script>
<title></title>

<script type="application/x-javascript">
	
	
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 



</script>
<!-- css -->

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

<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<!-- //font -->
<script src="js/jquery-1.11.1.min.js"></script>

</head>
<body onload="">
 
	<nav class="navbar navbar-default"> 
	<div class="header-top-w3layouts">
		<div class="container">
			<div class="col-md-6 logo-w3">
			<button class="translate" id="en">English</button>
	<button class="translate" id="pt">Português</button>
				<a href="index.jsp"><img src="imagens/pata.jpg" alt=" " />
				<!-- <h1>Pet Amigo</h1>  -->	
				<h1>Pet Amigo</h1>
				<div class="row">
 
				
			</div>
			<div class="col-md-6 logo-w3 right">
				</a><span class="lang" key="bemvindo">Bem Vindo</span>  <a href="login.jsp"><span class="lang" key="login">Faça seu Login!</span></a>
			</div>
		</div>
	</div>
	<div class="header-bottom-w3ls">
		<div class="container">
			<div class="col-md-12 navigation-agileits">
				<nav class="navbar navbar-default">
				<div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
					<ul class="nav navbar-nav ">
						
						<li><a href="index.jsp" class="hyper "><span  class="lang"  key="inicio">Inicio</span></a></li>
						
						<li><a href="AdoteUmAnimal.jsp" class="hyper"><span  class="lang"  key="adote">Adote um Animal</span></a></li>
						
						<li><a href="EncontreUmPar.jsp" class="hyper"><span class="lang" key="encontre">Encontre um Par</span></a></li>
						
						<li><a href="AnimaisPerdidos.jsp" class="hyper"><span class="lang"  key="perdidos">Animais Perdidos</span></a></li>
						
						<li><a href="DoadoresSangue.jsp" class="hyper"><span  class="lang"  key="doadores">Doadores de Sangue</span></a></li>
					</ul>
				</div>
				</nav>
			</div>
		</div>
	</div>
	<div class="sub-banner my-banner3"></div>
	
	
	<!--  
	<ul>
		<li class="lang" key="home"></li>
		<li class="lang" key="about"></li>
		<li class="lang" key="contact"></li>
	</ul>-->
	
	
<script>

	var arrLang = {
			'en' : {
				'inicio' : 'Home',
				'adote' : 'Adopt an animal',
				'encontre' : 'Find a pair',
				'perdidos' : 'Lost animals',
				'doadores' : 'Blood donors',
				'login' : 'Login!',
				'bemvindo' : 'Welcome'
			},
			'pt' : {
				'inicio' : 'Inicio',
				'adote' : 'Adote um Animal',
				'encontre' : 'Encontre um Par',
				'perdidos' : 'Animais Perdidos',
				'doadores' : 'Doadores de Sangue',
				'login' : 'Faça seu Login!',
				'bemvindo' : 'Bem Vindo'
			}
	};
	
	$(function(){
		$('.translate').click(function(){
			var lang = $(this).attr('id');
			
			$('.lang').each(function(index, element){
				$(this).text(arrLang[lang][$(this).attr('key')]);
			});
		});
	});
	
	

</script>
	
	
</body>
</html>