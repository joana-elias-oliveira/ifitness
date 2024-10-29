<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>iRepair Soluções</title>
	<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css">
	<script src="https://kit.fontawesome.com/a076d05399.js"></script>
	<style>
		* {
			margin: 0;
			padding: 0;
			box-sizing: border-box;
		}

		body {
			font-family: 'Poppins', sans-serif;
			line-height: 1.6;
			color: #333;
		}

		.container {
			width: 100%;
			max-width: 1200px;
			margin: 0 auto;
		}

		.row {
			display: flex;
			flex-wrap: wrap;
			margin: -15px;
		}

		.col-md-6, .col-md-4 {
			padding: 15px;
			flex: 1;
		}

		h1, h2, h3 {
			font-weight: 600;
			color: #0351ab;
			margin-bottom: 20px;
		}

		p {
			color: #666;
			font-weight: 300;
		}

		img.img-fluid {
			max-width: 100%;
			height: auto;
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
		/* Estilo da página */
		.header-section {
			background-color: #f7f7f7;
			color: white;
			padding: 165px 0 80px; /* Aumentado para compensar o menu fixo */
			text-align: center;
			background-size: cover;
			background-position: center;
		}

		.header-section h1 {
			font-size: 3.5rem;
			letter-spacing: 2px;
			text-transform: uppercase;
			margin-bottom: 20px;
			padding-top: 110px;
		}

		.header-section p {
			font-size: 1.2rem;
			margin-bottom: 30px;
		}

		.btn-get-started {
			background-color: #fca311;
			color: white;
			padding: 12px 30px;
			font-size: 1.2rem;
			border-radius: 30px;
			text-decoration: none;
			transition: all 0.3s ease;
		}

		.btn-get-started:hover {
			background-color: #e69310;
			transform: scale(1.05);
		}

		.reparos {
			background-color: white;
			padding: 220px 0;
			text-align: center;
		}

		.reparos h2 {
			font-size: 2.5rem;
			margin-bottom: 40px;
		}

		.service-card {
			background-color: white;
			border-radius: 10px;
			box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
			padding: 30px;
			text-align: center;
			transition: transform 0.3s ease, box-shadow 0.3s ease;
		}

		.service-card:hover {
			transform: translateY(-10px);
			box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
		}

		.service-card i {
			font-size: 3rem;
			color: #fca311;
			margin-bottom: 20px;
		}



	</style>
</head>
<body>

<!-- Menu de Navegação -->
<nav>
	<ul>
		<li class="logo-container" ><img src="img/logoo.png" alt="Imagem de Login" class="logo" ></li>
		<li><a href="home.jsp">Home</a></li>
		<li><a href="cliente">Clientes</a></li>
		<li><a href="#">Servicos</a></li>
		<li><a href="#">Contato</a></li>
	</ul>
</nav>

<!-- Cabeçalho da página (atualizado para funcionários) -->
<header class="header-section">
	<div class="container">
		<div class="row align-items-center">
			<div class="col-md-6">
				<h1>iRepair Soluções</h1>
				<p>Gerencie suas ordens de serviço de maneira eficiente.</p>
				<a href="#" class="btn-get-started">Ver Ordens de Serviço</a>
			</div>
			<div class="col-md-6 text-center">
				<img src="img/home.svg" class="img-fluid" alt="Painel de Controle">
			</div>

		</div>
	</div>
</header>

<!-- Seção de Serviços (Modificada para gerenciar ordens) -->
<section class="reparos" data-aos="fade-up">
	<div class="container">
		<h2>Gerenciamento de Ordens de Serviço</h2>
		<div class="row">
			<div class="col-md-4">
				<div class="service-card">
					<i class="fas fa-clipboard-list"></i>
					<h3>Ordens Pendentes</h3>
					<p>Veja e gerencie as ordens de serviço que ainda estão em andamento.</p>
				</div>
			</div>
			<div class="col-md-4">
				<div class="service-card">
					<i class="fas fa-check-circle"></i>
					<h3>Ordens Concluídas</h3>
					<p>Acompanhe o histórico de serviços já realizados.</p>
				</div>
			</div>
			<div class="col-md-4">
				<div class="service-card">
					<i class="fas fa-file-alt"></i>
					<h3>Gerar Relatórios</h3>
					<p>Crie relatórios de desempenho e produtividade dos serviços realizados.</p>
				</div>
			</div>
		</div>
	</div>
</section>


<script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
<script>
	AOS.init({
		duration: 1000,
		once: true,
	});
</script>
</body>
</html>
