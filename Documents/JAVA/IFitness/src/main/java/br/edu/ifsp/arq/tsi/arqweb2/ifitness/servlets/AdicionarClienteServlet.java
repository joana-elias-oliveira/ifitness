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

@WebServlet("/adicionarCliente")
public class AdicionarClienteServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
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

        Cliente cliente = new Cliente();
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

        ClienteDao clienteDao = new ClienteDao(DataSourceSearcher.getInstance().getDataSource());
        boolean success = clienteDao.save(cliente);

        if (success) {
            resp.sendRedirect(req.getContextPath() + "/cliente");
        } else {
            req.setAttribute("error", "Cliente com este CPF já existe");
            req.getRequestDispatcher("/erro.jsp").forward(req, resp);
        }
    }
}
