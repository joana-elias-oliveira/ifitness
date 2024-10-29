<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>
<!doctype html>
<html lang="pt-BR">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- Bootstrap CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
	<link href="css/styles.css" rel="stylesheet">
	<link href="css/errors.css" rel="stylesheet">
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
		.register-container {
			display: flex;
			background-color: white;
			width: 100%;
			max-width: 1500px;
			border-radius: 20px;
			box-shadow: 0px 8px 30px rgba(0, 0, 0, 0.1);
			overflow: hidden;
			flex-direction: column;
		}
		@media (min-width: 768px) {
			.register-container {
				flex-direction: row;
			}
		}
		.register-left {
			flex: 1;
			background-color: #0351ab;
			color: white;
			display: flex;
			flex-direction: column;
			justify-content: center;
			align-items: center;
			padding: 50px;
		}
		.register-left h2 {
			font-size: 2rem;
			margin-bottom: 20px;
			font-weight: 600;
			line-height: 1.5;
			text-align: center;
		}
		.register-left p {
			font-size: 1.1rem;
			font-weight: 300;
			line-height: 1.5;
			text-align: center;
		}
		.register-right {
			flex: 1;
			padding: 50px;
			display: flex;
			flex-direction: column;
			justify-content: center;
			align-items: center;
			width: 100%;
		}
		.register-right h3 {
			margin-bottom: 40px;
			font-weight: 600;
			color: #333;
			text-align: center;
			font-size: 1.5rem;
		}
		.login-left img {
			max-width: 100%; /* Faz a imagem se ajustar à largura disponível */
			height: auto; /* Mantém a proporção da imagem */
			margin-bottom: 40px; /* Espaçamento abaixo da imagem */
		}
		.btn-primary {
			background-color: #4A90E2;
			border-color: #4A90E2;
			border-radius: 10px;
			padding: 12px 20px;
			width: 100%;
			margin-bottom: 10px;
			margin-top: 20px;
			font-weight: 500;
			box-shadow: 0 5px 15px rgba(74, 144, 226, 0.4);
		}
		/* Estilo comum para todos os inputs e selects */
		.form-control, .form-select {
			border-radius: 10px;
			padding: 15px;
			margin-bottom: 20px;
			box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
			width: 100%;
			font-size: 1rem;
			color: #333; /* Ajusta a cor do texto */
			background-color: white; /* Cor de fundo consistente */
			border: 1px solid #ccc; /* Borda suave */
		}

		/* Estilo para o campo de data (input type="date") */
		input[type="date"] {
			appearance: none;
			-webkit-appearance: none;
			padding: 15px;
			font-size: 1rem;
			color: gray; /* Define a cor do texto no campo de data */
			background-color: #white; /* Mesma cor de fundo que os outros campos */
			border: 1px solid #ccc;
		}

		/* Estilo para o campo select */
		select.form-select {
			appearance: none;
			-webkit-appearance: none;
			padding: 15px;
			font-size: 1rem;
			color: gray; /* Define a cor do texto no campo de seleção */
			background-color: #white; /* Mesma cor de fundo */
			border: 1px solid #ccc;
		}

		/* Remove o estilo padrão de foco (outline) e adiciona um foco suave */
		.form-control:focus, .form-select:focus {
			outline: none;
			border-color: #4A90E2;
			box-shadow: 0 0 10px rgba(74, 144, 226, 0.5);
		}

	</style>
	<title>iRepair - Cadastro de Usuário</title>
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
	<div class="row justify-content-center">
		<div class="col-lg-8 col-md-10 col-sm-12">
			<c:if test="${result == 'notRegistered'}">
				<div class="alert alert-danger alert-dismissible fade show" role="alert">
					E-mail já cadastrado. Tente novamente.
					<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
				</div>
			</c:if>
			<form action="userRegister" method="post" id="form1">
				<div class="register-container">
					<!-- Lado esquerdo com a mensagem -->
					<div class="register-left">
						<div class="login-left">
							<img src="img/register.svg" alt="Imagem de Login">
						</div>
						<p>Crie sua conta rapidamente e aproveite serviços personalizados!</p>
					</div>
					<!-- Lado direito com o formulário de cadastro -->
					<div class="register-right">
						<h3>Preencha seus dados</h3>
						<input type="text" name="name" id="name" class="form-control" placeholder="Nome completo" minlength="3" maxlength="50" required="required">
						<input type="email" name="email" id="email" class="form-control" placeholder="E-mail" required="required">
						<input type="password" name="password" id="password" class="form-control" placeholder="Senha" minlength="6" maxlength="12" required="required">
						<input type="password" name="confirmPassword" id="confirmPassword" class="form-control" placeholder="Confirmação de Senha" minlength="6" maxlength="12" required="required">
						<input type="date" name="dateOfBirth" id="dateOfBirth" class="form-control" max="2012-12-31" required="required">
						<select class="form-select" name="gender" id="gender" required="required">
							<option value="" selected>Selecione seu gênero</option>
							<option value="MASCULINO">Masculino</option>
							<option value="FEMININO">Feminino</option>
							<option value="OUTRO">Outro</option>
							<option value="PREFIRO_NAO_DIZER">Prefiro não dizer</option>
						</select>
						<button type="submit" class="btn btn-primary">Salvar</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="js/user-register.js"></script>
</body>
</html>
