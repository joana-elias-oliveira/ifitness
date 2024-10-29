<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Ordens de Serviço - iRepair Soluções</title>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
  <style>
    /* CSS Consistente com a Página de Clientes */

    /* Estilo Global */
    body {
      font-family: 'Poppins', sans-serif;
      color: #333;
    }

    .container {
      max-width: 1200px;
      margin: 0 auto;
      padding: 30px 0;
    }

    h1 {
      text-align: center;
      color: #0351ab;
      font-weight: 600;
    }

    .btn-add-order {
      display: inline-block;
      background-color: #fca311;
      color: white;
      padding: 10px 20px;
      text-decoration: none;
      border-radius: 5px;
      margin-top: 20px;
      font-size: 1.1rem;
    }

    .btn-add-order:hover {
      background-color: #e69310;
    }

    /* Tabela */
    .order-table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 40px;
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
    }

    .order-table th, .order-table td {
      padding: 12px 20px;
      text-align: left;
      border-bottom: 1px solid #ddd;
    }

    .order-table th {
      background-color: #0351ab;
      color: white;
      font-weight: 600;
    }

    .order-table tr:hover {
      background-color: #f1f1f1;
    }

    .action-buttons a {
      padding: 8px 15px;
      border-radius: 5px;
      margin-right: 10px;
      color: white;
      text-decoration: none;
    }

    .btn-edit {
      background-color: #e69310;
    }

    .btn-edit:hover {
      background-color: #a86703;
    }

    .btn-delete {
      background-color: #dc3545;
    }

    .btn-delete:hover {
      background-color: #8f0c19;
    }

    /* Modais */
    .modal {
      display: none;
      position: fixed;
      z-index: 1000;
      left: 0;
      top: 0;
      width: 100%;
      height: 100%;
      background-color: rgba(0, 0, 0, 0.5);
      padding-top: 50px;
    }

    .modal-content {
      background-color: #fff;
      margin: 5% auto;
      padding: 20px;
      border: 1px solid #888;
      width: 50%;
      max-width: 700px;
      border-radius: 10px;
    }

    .form-container {
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 15px;
    }

    .form-group label {
      font-weight: 600;
      color: #0351ab;
    }

    .form-group input, .form-group select {
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 5px;
      font-size: 1rem;
    }

    .submit-btn {
      background-color: #fca311;
      color: white;
      padding: 10px 20px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      width: 100%;
    }

    .submit-btn:hover {
      background-color: #e69310;
    }

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
      padding-bottom: 30px;
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
      align-items: center;
      list-style: none;
      padding: 0;
      margin: 0;
    }

    .logo-container {
      display: flex;
      justify-content: center;
      align-items: center;
      margin-right: 20px;
    }

    .logo-container img {
      width: 115px;
      height: auto;
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
      padding: 100px 0;
      text-align: center;
      background-size: cover;
      background-position: center;
    }

    .header-section h1 {
      font-size: 3rem;
      letter-spacing: 2px;
      text-transform: uppercase;
      margin-bottom: 20px;
    }

    .header-section p {
      font-size: 1.2rem;
      margin-bottom: 30px;
    }

    .btn-add-client {
      background-color: #fca311;
      color: white;
      padding: 10px 20px;
      font-size: 1.1rem;
      border-radius: 5px;
      text-decoration: none;
      transition: background-color 0.3s ease;
    }

    .btn-add-client:hover {
      background-color: #e69310;
    }

    /* Tabela de Clientes */
    .client-table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 40px;
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
    }

    .client-table th, .client-table td {
      padding: 12px 20px;
      text-align: left;
      border-bottom: 1px solid #ddd;
    }

    .client-table th {
      background-color: #0351ab;
      color: white;
      font-weight: 600;
    }

    .client-table tr:hover {
      background-color: #f1f1f1;
    }

    /* Botões de ação */
    .action-buttons a {
      margin-right: 10px;
      text-decoration: none;
      color: white;
      padding: 8px 15px;
      border-radius: 5px;
      transition: background-color 0.3s ease;
    }

    .btn-edit {
      background-color: #e69310;
    }

    .btn-edit:hover {
      background-color: #a86703;
    }

    .btn-delete {
      background-color: #dc3545;
    }

    .btn-delete:hover {
      background-color: #8f0c19;
    }

    /* Estilo do Modal */
    .modal {
      display: none;
      position: fixed;
      z-index: 1000;
      left: 0;
      top: 0;
      width: 100%;
      height: 100%;
      overflow: auto;
      background-color: rgba(0, 0, 0, 0.5);
      padding-top: 50px;
    }

    .modal-content {
      background-color: #fff;
      margin: 5% auto;
      padding: 20px;
      border: 1px solid #888;
      width: 60%; /* Ajuste de largura */
      max-width: 700px;
      border-radius: 10px;
    }

    .close {
      color: #aaa;
      float: right;
      font-size: 28px;
      font-weight: bold;
    }

    .close:hover,
    .close:focus {
      color: black;
      text-decoration: none;
      cursor: pointer;
    }

    .form-group {
      display: flex;
      flex-direction: column;
    }

    .form-group label {
      font-weight: 600;
      margin-bottom: 5px;
      color: #0351ab;
    }

    .form-group input, .form-group select {
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 5px;
      font-size: 1rem;
    }

    .form-group input {
      width: 100%;
      padding: 8px;
      box-sizing: border-box;
      border: 1px solid #ccc;
      border-radius: 4px;
    }

    .submit-btn {
      background-color: #fca311;
      color: white;
      padding: 10px 20px;
      font-size: 1.1rem;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      margin-top: 15px;
      width: 100%;
      transition: background-color 0.3s ease;
    }

    .form-container {
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 15px; /* Espaçamento entre os campos */
    }

    footer {
      background-color: #0351ab;
      color: white;
      text-align: center;
      padding: 15px 0;
      margin-top: auto;
    }

    .submit-btn:hover {
      background-color: #e69310;
    }
    .modal-delete {
      display: none;
      position: fixed;
      z-index: 1000;
      left: 0;
      top: 0;
      width: 100%;
      height: 100%;
      overflow: auto;
      background-color: rgba(0, 0, 0, 0.5);
      padding-top: 50px;
    }

    .modal-delete-content {
      background-color: #fff;
      margin: 5% auto;
      padding: 20px;
      border: 1px solid #888;
      width: 40%;
      max-width: 400px;
      border-radius: 10px;
      text-align: center;
    }

    .modal-delete-content p {
      margin-bottom: 20px;
    }

    .modal-delete .close-delete {
      color: #aaa;
      float: right;
      font-size: 28px;
      font-weight: bold;
    }

    .modal-delete .close-delete:hover,
    .modal-delete .close-delete:focus {
      color: black;
      text-decoration: none;
      cursor: pointer;
    }

    .btn-confirm,
    .btn-cancel {
      padding: 10px 20px;
      margin: 10px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
    }

    .btn-confirm {
      background-color: #dc3545;
      color: white;
    }

    .btn-cancel {
      background-color: #ccc;
      color: black;
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
    <li><a href="servicos.jsp">Servicos</a></li>
    <li><a href="#">Contato</a></li>
  </ul>
</nav>


<div class="container">
  <h1>Ordens de Serviço</h1>
  <p style="text-align:center;">Gerencie suas ordens de serviço de forma eficiente.</p>
  <a href="#" class="btn-add-order" id="addOrderBtn">Adicionar Nova Ordem</a>

  <!-- Tabela de Ordens de Serviço -->
  <table class="order-table">
    <thead>
    <tr>
      <th>ID</th>
      <th>Descrição</th>
      <th>Data de Emissão</th>
      <th>Data de Finalização</th>
      <th>Valor</th>
      <th>Status</th>
      <th>Ações</th>
    </tr>
    </thead>
    <tbody>
    <!-- Exemplo de ordem -->
    <tr>
      <td>1</td>
      <td>Reparo de tela</td>
      <td>01/10/2024</td>
      <td>05/10/2024</td>
      <td>R$ 250,00</td>
      <td>Pendente</td>
      <td class="action-buttons">
        <a href="#" class="btn-edit">Editar</a>
        <a href="#" class="btn-delete">Excluir</a>
      </td>
    </tr>
    <!-- Repita para cada ordem -->
    </tbody>
  </table>
</div>

<!-- Modal de Adicionar Ordem -->
<div id="addOrderModal" class="modal">
  <div class="modal-content">
    <span class="close">&times;</span>
    <h2>Adicionar Nova Ordem de Serviço</h2>
    <form>
      <div class="form-container">
        <div class="form-group">
          <label for="descricao">Descrição:</label>
          <input type="text" id="descricao" name="descricao">
        </div>
        <div class="form-group">
          <label for="dataEmissao">Data de Emissão:</label>
          <input type="date" id="dataEmissao" name="dataEmissao">
        </div>
        <div class="form-group">
          <label for="dataFinalizacao">Data de Finalização:</label>
          <input type="date" id="dataFinalizacao" name="dataFinalizacao">
        </div>
        <div class="form-group">
          <label for="valor">Valor:</label>
          <input type="text" id="valor" name="valor">
        </div>
        <div class="form-group">
          <label for="status">Status:</label>
          <select id="status" name="status">
            <option value="pendente">Pendente</option>
            <option value="concluida">Concluída</option>
          </select>
        </div>
      </div>
      <button type="submit" class="submit-btn">Adicionar Ordem</button>
    </form>
  </div>
</div>

<!-- JavaScript para abrir e fechar os modais -->
<script>
  var addOrderModal = document.getElementById("addOrderModal");
  var addOrderBtn = document.getElementById("addOrderBtn");
  var closeBtns = document.getElementsByClassName("close");

  addOrderBtn.onclick = function() {
    addOrderModal.style.display = "block";
  }

  Array.from(closeBtns).forEach(btn => {
    btn.onclick = function() {
      addOrderModal.style.display = "none";
    }
  });

  window.onclick = function(event) {
    if (event.target == addOrderModal) {
      addOrderModal.style.display = "none";
    }
  }
</script>

</body>
</html>
