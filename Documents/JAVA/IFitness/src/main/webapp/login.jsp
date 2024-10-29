<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>
<!doctype html>
<html lang="pt-BR">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
	<style>
		body {
			font-family: 'Poppins', sans-serif;
			background-color: #f0f4f8;
			display: flex;
			justify-content: center;
			align-items: center;
			height: 100vh;
			margin: 0;
		}
		/* Menu de Navegação */
		nav {
			background-color: #0351ab;
			padding: 15px 0;
			position: fixed;
			width: 100%;
			top: 0;
			z-index: 100;
		}

		nav ul {
			display: flex;
			justify-content: center;
			align-items: center; /* Alinha verticalmente os itens */
			list-style: none;
			padding: 0; /* Remove o padding padrão */
			margin: 0; /* Remove a margem padrão */
		}

		.logo-container {
			display: flex;
			justify-content: center;
			align-items: center;
			margin-right: 20px; /* Espaçamento entre o logo e os links do menu */
		}

		.logo-container img {
			width: 115px; /* Define a largura da logo */
			height: auto; /* Mantém a proporção original da altura */
		}


		nav ul li {
			margin: 0 15px;
		}

		nav ul li a {
			color: white;
			font-size: 1rem;
			text-transform: uppercase;
			text-decoration: none;
			font-weight: 500;
			transition: color 0.3s ease;
		}

		nav ul li a:hover {
			color: #fca311;
		}
		.login-container {
			display: flex;
			background-color: white;
			width: 100%;
			max-width: 1000px; /* Max width para telas grandes */
			border-radius: 20px;
			box-shadow: 0px 8px 30px rgba(0, 0, 0, 0.1);
			overflow: hidden;
			flex-direction: column; /* Adiciona flexibilidade em telas menores */
		}
		@media (min-width: 768px) {
			.login-container {
				flex-direction: row; /* Em telas maiores, define os lados do login */
			}
		}
		.login-left {
			flex: 1;
			background-color: #0351ab;
			color: white;
			display: flex;
			flex-direction: column;
			justify-content: center;
			align-items: center;
			padding: 50px;
			text-align: center;
		}
		.login-left img {
			max-width: 100%; /* Faz a imagem se ajustar à largura disponível */
			height: auto; /* Mantém a proporção da imagem */
			margin-bottom: 20px; /* Espaçamento abaixo da imagem */
		}
		.login-left p {
			font-size: 1.1rem;
			font-weight: 300;
			line-height: 1.5;
			margin-top: 10px;
		}
		.login-right {
			flex: 1;
			padding: 50px;
			display: flex;
			flex-direction: column;
			justify-content: center;
			align-items: center;
			width: 100%;
		}
		.login-right h3 {
			margin-bottom: 40px;
			font-weight: 600;
			color: #333;
			text-align: center;
			font-size: 1.5rem;
		}
		.form-control {
			border-radius: 10px;
			padding: 15px;
			margin-bottom: 20px;
			box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
		}
		.btn-primary {
			background-color: #4A90E2;
			border-color: #4A90E2;
			border-radius: 10px;
			padding: 12px 20px;
			width: 100%;
			margin-bottom: 10px;
			font-weight: 500;
			box-shadow: 0 5px 15px rgba(74, 144, 226, 0.4);
		}
		.btn-secondary {
			border-radius: 10px;
			width: 100%;
			padding: 12px 20px;
			font-weight: 500;
			background-color: #bbb;
			border-color: #bbb;
			color: white;
		}
	</style>
	<title>iRepair Soluções</title>
</head>
<body>
<nav>
	<ul>
		<li class="logo-container" ><img src="img/logoo.png" alt="Imagem de Login" class="logo" ></li>
		<li><a href="home.jsp">Home</a></li>
		<li><a href="cliente">Clientes</a></li>
		<li><a href="#">Servicos</a></li>
		<li><a href="#">Contato</a></li>
	</ul>
</nav>

<div class="container">
	<!-- Removi as classes col-lg-4 offset-lg-4 para expandir o formulário -->
	<div class="row justify-content-center">
		<div class="col-lg-8 col-md-10 col-sm-12">
			<c:choose>
				<c:when test="${result == 'registered'}">
					<div class="alert alert-success alert-dismissible fade show" role="alert">
						Usuário cadastrado com sucesso. Faça o login.
						<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
					</div>
				</c:when>
				<c:when test="${result == 'loginError'}">
					<div class="alert alert-danger alert-dismissible fade show" role="alert">
						E-mail e/ou senha inválidos.
						<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
					</div>
				</c:when>
			</c:choose>
			<form action="login" method="post">
				<div class="login-container">
					<!-- Lado esquerdo com a mensagem e ilustração -->
					<div class="login-left">
						<img src="img/login.svg" alt="Imagem de Login"> <!-- Adiciona um texto alternativo para acessibilidade -->
						<h3>iRepare Soluções</h3>
					</div>
					<!-- Lado direito com o formulário de login -->
					<div class="login-right">
						<h3>Entre na sua conta</h3>
						<input type="email" class="form-control" name="email" placeholder="E-mail" required>
						<input type="password" class="form-control" name="password" placeholder="Senha" required>
						<button type="submit" class="btn btn-primary">Entrar</button>
						<a href="user-register.jsp" class="btn btn-secondary">Cadastre-se grátis</a>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>
