package br.edu.ifsp.arq.tsi.arqweb2.ifitness.servlets;

import br.edu.ifsp.arq.tsi.arqweb2.ifitness.model.Cliente;
import br.edu.ifsp.arq.tsi.arqweb2.ifitness.model.dao.ClienteDao;
import br.edu.ifsp.arq.tsi.arqweb2.ifitness.utils.DataSourceSearcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Optional;

@WebServlet("/editarCliente")
public class EditarClienteServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Long id = Long.parseLong(req.getParameter("id"));

        // Criando instância do ClienteDao com DataSource
        ClienteDao clienteDao = new ClienteDao(DataSourceSearcher.getInstance().getDataSource());

        Optional<Cliente> optionalCliente = clienteDao.getClienteById(id);
        if (optionalCliente.isPresent()) {
            req.setAttribute("cliente", optionalCliente.get());
            req.getRequestDispatcher("/editarCliente.jsp").forward(req, resp); // Exibe o formulário com os dados
        } else {
            resp.sendRedirect(req.getContextPath() + "/cliente"); // Redireciona para a listagem de clientes
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Pegando os parâmetros do formulário
        Long id = Long.parseLong(req.getParameter("id"));
        String nome = req.getParameter("nome");
        String email = req.getParameter("email");
        String telefone = req.getParameter("telefone");
        String cpf = req.getParameter("cpf");
        String logradouro = req.getParameter("logradouro");
        String numero = req.getParameter("numero");
        String complemento = req.getParameter("complemento");
        String bairro = req.getParameter("bairro");
        String cep = req.getParameter("cep");
        String cidade = req.getParameter("cidade");
        String estado = req.getParameter("estado");

        // Criando o objeto cliente com os dados atualizados
        Cliente cliente = new Cliente();
        cliente.setId(id);
        cliente.setNome(nome);
        cliente.setEmail(email);
        cliente.setTelefone(telefone);
        cliente.setCpf(cpf);
        cliente.setLogradouro(logradouro);
        cliente.setNumero(numero);
        cliente.setComplemento(complemento);
        cliente.setBairro(bairro);
        cliente.setCep(cep);
        cliente.setCidade(cidade);
        cliente.setEstado(estado);
        cliente.setAtivo(true);

        // Criando instância do ClienteDao com DataSource
        ClienteDao clienteDao = new ClienteDao(DataSourceSearcher.getInstance().getDataSource());

        boolean atualizado = clienteDao.update(cliente);

        if (atualizado) {
            resp.sendRedirect(req.getContextPath() + "/cliente");  // Redireciona para a listagem de clientes após a atualização
        } else {
            req.setAttribute("error", "Erro ao atualizar cliente");
            req.getRequestDispatcher("/erro.jsp").forward(req, resp); // Caso ocorra um erro, exibe uma página de erro
        }
    }
}
