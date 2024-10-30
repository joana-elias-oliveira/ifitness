<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Clientes - iRepair Soluções</title>
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
    .service-table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 40px;
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
    }

    .service-table th, .service-table td {
      padding: 12px 20px;
      text-align: left;
      border-bottom: 1px solid #ddd;
    }

    .service-table th {
      background-color: #0351ab;
      color: white;
      font-weight: 600;
    }

    .service-table tr:hover {
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

<!-- Cabeçalho da página de Clientes -->
<header class="header-section">
  <div class="container">
    <h1>Servicos</h1>
    <p>Gerencie suas ordens de servico eficientemente.</p>
    <a href="#" class="btn-add-client" id="ordemModal">Adicionar Nova ordem de servico</a>
  </div>
</header>

<!-- Modal para confirmar exclusão de cliente -->
<div id="deleteClientModal" class="modal-delete">
  <div class="modal-delete-content">
    <span class="close-delete">&times;</span>
    <p>Tem certeza de que deseja excluir este cliente?</p>
    <button id="confirmDelete" class="btn-confirm">Excluir</button>
    <button id="cancelDelete" class="btn-cancel">Cancelar</button>
  </div>
</div>

<!-- Modal para Adicionar Ordem de Serviço -->
<div id="addOrdemServicoModal" class="modal">
  <div class="modal-content">
    <span class="close" onclick="closeModal('addOrdemServicoModal')">&times;</span>
    <h2>Adicionar Nova Ordem de Serviço</h2>
    <form action="adicionarOrdemServico" method="POST">
      <div class="form-container">

        <!-- Descrição -->
        <div class="form-group">
          <label for="descricao">Descrição:</label>
          <input type="text" id="descricao" name="descricao" placeholder="Descrição da ordem de serviço" required>
        </div>

        <!-- Data de Emissão -->
        <div class="form-group">
          <label for="dataEmissao">Data de Emissão:</label>
          <input type="date" id="dataEmissao" name="dataEmissao" required>
        </div>

        <!-- Data de Finalização -->
        <div class="form-group">
          <label for="dataFinalizacao">Data de Finalização:</label>
          <input type="date" id="dataFinalizacao" name="dataFinalizacao">
        </div>

        <!-- Valor -->
        <div class="form-group">
          <label for="valor">Valor:</label>
          <input type="number" id="valor" name="valor" step="0.01" placeholder="0.00" required>
        </div>

        <!-- Status -->
        <div class="form-group">
          <label for="status">Status:</label>
          <select id="status" name="status" required>
            <option value="PENDENTE">Pendente</option>
            <option value="EM_ANDAMENTO">Em Andamento</option>
            <option value="FINALIZADO">Finalizado</option>
          </select>
        </div>

        <!-- Cliente ID -->
        <div class="form-group">
          <label for="clienteId">Cliente:</label>
          <select id="clienteId" name="clienteId" required>
            <option value="" disabled selected>Selecione um cliente</option>
            <!-- Aqui é onde a lista de clientes será exibida -->
            <c:forEach var="cliente" items="${clientes}">
              <option value="${cliente.id}">${cliente.nome}</option>
            </c:forEach>
          </select>
        </div>

        <!-- Forma de Pagamento -->
        <div class="form-group">
          <label for="formaPagamento">Forma de Pagamento:</label>
          <select id="formaPagamento" name="formaPagamento">
            <option value="1">Cartão de Crédito</option>
            <option value="2">Boleto</option>
            <option value="3">Dinheiro</option>
          </select>
        </div>
      </div>

      <!-- Botão de Submissão -->
      <button type="submit" class="submit-btn">Adicionar Ordem de Serviço</button>
    </form>
  </div>
</div>


<!-- Modal para Editar Cliente -->
<div id="editClientModal" class="modal">
  <div class="modal-content">
    <span class="close-edit">&times;</span>
    <h2>Editar Cliente</h2>
    <form id="editClientForm" action="editarCliente" method="POST">
      <input type="hidden" id="edit-id" name="id">
      <div class="form-container">
        <div class="form-group">
          <label for="edit-nome">Nome:</label>
          <input type="text" id="edit-nome" name="nome" required>
        </div>
        <div class="form-group">
          <label for="edit-email">Email:</label>
          <input type="email" id="edit-email" name="email" required>
        </div>
        <div class="form-group">
          <label for="edit-telefone">Telefone:</label>
          <input type="text" id="edit-telefone" name="telefone" required>
        </div>
        <div class="form-group">
          <label for="edit-cpf">CPF:</label>
          <input type="text" id="edit-cpf" name="cpf" readonly>
        </div>
        <div class="form-group">
          <label for="edit-logradouro">Logradouro:</label>
          <input type="text" id="edit-logradouro" name="logradouro">
        </div>
        <div class="form-group">
          <label for="edit-numero">Número:</label>
          <input type="text" id="edit-numero" name="numero">
        </div>
        <div class="form-group">
          <label for="edit-complemento">Complemento:</label>
          <input type="text" id="edit-complemento" name="complemento">
        </div>
        <div class="form-group">
          <label for="edit-bairro">Bairro:</label>
          <input type="text" id="edit-bairro" name="bairro">
        </div>
        <div class="form-group">
          <label for="edit-cep">CEP:</label>
          <input type="text" id="edit-cep" name="cep">
        </div>
        <div class="form-group">
          <label for="edit-cidade">Cidade:</label>
          <input type="text" id="edit-cidade" name="cidade">
        </div>
        <div class="form-group">
          <label for="edit-estado">Estado:</label>
          <select id="edit-estado" name="estado" required>
            <option value="SP">São Paulo</option>
            <option value="RJ">Rio de Janeiro</option>
            <option value="MG">Minas Gerais</option>
            <option value="BA">Bahia</option>
            <!-- Adicione outras opções de estados -->
          </select>
        </div>
      </div>
      <button type="submit" class="submit-btn">Salvar Alterações</button>
    </form>
  </div>
</div>


<!-- Lista de Ordens de Serviço -->
<section class="container" data-aos="fade-up">
  <br>
  <h2>Lista de Ordens de Serviço</h2>
  <table class="service-table">
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
    <c:forEach var="ordemServico" items="${ordensServico}">
      <tr>
        <td>${ordemServico.id}</td>
        <td>${ordemServico.descricao}</td>
        <td>${ordemServico.dataEmissao}</td>
        <td>${ordemServico.dataFinalizacao}</td>
        <td>${ordemServico.valor}</td>
        <td>${ordemServico.status}</td>
        <td class="action-buttons">
          <a href="#" class="btn-edit" onclick="openEditModal({
                  id: '${ordemServico.id}',
                  descricao: '${ordemServico.descricao}',
                  dataEmissao: '${ordemServico.dataEmissao}',
                  dataFinalizacao: '${ordemServico.dataFinalizacao}',
                  valor: '${ordemServico.valor}',
                  status: '${ordemServico.status}'
                  })">Editar</a>

          <a href="#" class="btn-delete" onclick="confirmDelete(${ordemServico.id})">Excluir</a>
        </td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</section>


<footer>
  <p>&copy; 2024 iRepair Soluções. Todos os direitos reservados.</p>
</footer>

<script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
<script>
  AOS.init({
    duration: 1000,
    once: true,
  });

  //modal excluir
  var deleteModal = document.getElementById("deleteClientModal");
  var closeDelete = document.getElementsByClassName("close-delete")[0];
  var confirmDeleteButton = document.getElementById("confirmDelete");
  var cancelDeleteButton = document.getElementById("cancelDelete");
  var clientIdToDelete = null;

  // Função para abrir o modal de exclusão e definir o ID do cliente
  function confirmDelete(clientId) {
    clientIdToDelete = clientId;
    console.log("ID do cliente para exclusão (capturado no JavaScript):", clientIdToDelete);
    deleteModal.style.display = "block";
  }

  // Fechar o modal de exclusão ao clicar em "Cancelar" ou no "X"
  closeDelete.onclick = function() {
    deleteModal.style.display = "none";
    clientIdToDelete = null;
  };

  cancelDeleteButton.onclick = function() {
    deleteModal.style.display = "none";
    clientIdToDelete = null;
  };

  // Enviar a solicitação de exclusão ao confirmar
  confirmDeleteButton.onclick = function(clientId) {
    clientIdToDelete = clientId;
    if (clientIdToDelete) {
      const url = `excluirCliente?id=${clientIdToDelete}`;
      console.log("URL de exclusão (construída no JavaScript):", url);
      window.location.href = url;
    } else {
      console.error("ID do cliente não definido para exclusão.");
    }
  };


  // Modal para Adicionar Ordem de Serviço
  var ordemModal = document.getElementById("addOrdemServicoModal");
  var ordemBtn = document.getElementById("ordemModal"); // Certifique-se de que o ID seja "ordemModal"
  var ordemClose = ordemModal.getElementsByClassName("close")[0]; // Captura o botão de fechar dentro do modal

  ordemBtn.onclick = function() {
    ordemModal.style.display = "block";
  }

  ordemClose.onclick = function() {
    ordemModal.style.display = "none";
  }

  // Fecha o modal ao clicar fora do conteúdo
  window.onclick = function(event) {
    if (event.target == ordemModal) {
      ordemModal.style.display = "none";
    }
  }



  //modal editar
  var editModal = document.getElementById("editClientModal");
  var closeEdit = document.getElementsByClassName("close-edit")[0];

  // Função para abrir o modal de edição e preencher os dados
  function openEditModal(cliente) {
    document.getElementById("edit-id").value = cliente.id;
    document.getElementById("edit-nome").value = cliente.nome;
    document.getElementById("edit-email").value = cliente.email;
    document.getElementById("edit-telefone").value = cliente.telefone;
    document.getElementById("edit-cpf").value = cliente.cpf;
    document.getElementById("edit-logradouro").value = cliente.logradouro;
    document.getElementById("edit-numero").value = cliente.numero;
    document.getElementById("edit-complemento").value = cliente.complemento;
    document.getElementById("edit-bairro").value = cliente.bairro;
    document.getElementById("edit-cep").value = cliente.cep;
    document.getElementById("edit-cidade").value = cliente.cidade;
    document.getElementById("edit-estado").value = cliente.estado;
    editModal.style.display = "block";
  }

  // Fechar o modal de edição
  closeEdit.onclick = function() {
    editModal.style.display = "none";
  };

  // Fechar o modal de edição ao clicar fora
  window.onclick = function(event) {
    if (event.target == editModal) {
      editModal.style.display = "none";
    }
  };


  function buscarCEP() {
    const cepInput = document.getElementById("cep"); // Captura o elemento diretamente

    if (!cepInput) {
      alert("Campo de CEP não encontrado!");
      return;
    }

    const cep = cepInput.value.trim().replace(/\D/g, ''); // Remove espaços e caracteres não numéricos
    console.log("CEP capturado:", cep);

    if (cep.length === 8) {
      const url = `https://cors-anywhere.herokuapp.com/https://viacep.com.br/ws/${cep}/json/`;
      console.log("URL de requisição:", url); // Confirme que a URL está correta

      fetch(url)
              .then(response => {
                if (!response.ok) {
                  throw new Error('Erro na requisição');
                }
                return response.json();
              })
              .then(data => {
                console.log("Dados recebidos do CEP:", data);

                if (!data.erro) {
                  document.getElementById("logradouro").value = data.logradouro || '';
                  document.getElementById("bairro").value = data.bairro || '';
                  document.getElementById("cidade").value = data.localidade || '';
                  document.getElementById("estado").value = data.uf || '';
                } else {
                  alert("CEP não encontrado.");
                }
              })
              .catch(error => {
                alert("Erro ao buscar o CEP.");
                console.error("Erro na requisição:", error);
              });
    } else {
      alert("CEP inválido. Certifique-se de que ele tenha 8 dígitos.");
    }
  }




</script>
</body>
</html>
