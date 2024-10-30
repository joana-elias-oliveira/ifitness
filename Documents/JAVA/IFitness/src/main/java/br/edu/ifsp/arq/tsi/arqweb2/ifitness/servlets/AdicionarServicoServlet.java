package br.edu.ifsp.arq.tsi.arqweb2.ifitness.servlets;

import br.edu.ifsp.arq.tsi.arqweb2.ifitness.model.Cliente;
import br.edu.ifsp.arq.tsi.arqweb2.ifitness.model.Servico;
import br.edu.ifsp.arq.tsi.arqweb2.ifitness.model.Status;
import br.edu.ifsp.arq.tsi.arqweb2.ifitness.model.FormaPagamento;
import br.edu.ifsp.arq.tsi.arqweb2.ifitness.model.dao.ClienteDao;
import br.edu.ifsp.arq.tsi.arqweb2.ifitness.model.dao.FormaPagamentoDao;
import br.edu.ifsp.arq.tsi.arqweb2.ifitness.model.dao.ServicoDao;
import br.edu.ifsp.arq.tsi.arqweb2.ifitness.utils.DataSourceSearcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.Optional;

@WebServlet("/adicionarServico")
public class AdicionarServicoServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Recuperando parâmetros do formulário
            String descricao = req.getParameter("descricao");
            LocalDate dataEmissao = LocalDate.parse(req.getParameter("dataEmissao"));
            LocalDate dataFinalizacao = LocalDate.parse(req.getParameter("dataFinalizacao"));
            BigDecimal valor = new BigDecimal(req.getParameter("valor"));
            String observacao = req.getParameter("observacao");
            Status status = Status.valueOf(req.getParameter("status").toUpperCase());

            // Obtendo ID do cliente e da forma de pagamento
            Long clienteId = Long.parseLong(req.getParameter("cliente"));
            Long formaPagamentoId = Long.parseLong(req.getParameter("formaPagamento"));

            // Buscando Cliente e FormaPagamento usando DAOs
            ClienteDao clienteDao = new ClienteDao(DataSourceSearcher.getInstance().getDataSource());
            FormaPagamentoDao formaPagamentoDao = new FormaPagamentoDao(DataSourceSearcher.getInstance().getDataSource());

            Optional<Cliente> cliente = clienteDao.getClienteById(clienteId);
            Optional<FormaPagamento> formaPagamento = formaPagamentoDao.getFormaPagamentoById(formaPagamentoId);

            // Verificando se Cliente e FormaPagamento existem
            if (cliente.isEmpty() || formaPagamento.isEmpty()) {
                req.setAttribute("error", "Cliente ou Forma de Pagamento inválidos.");
                req.getRequestDispatcher("/erro.jsp").forward(req, resp);
                return;
            }

            // Criando o objeto Servico e setando os valores
            Servico servico = new Servico();
            servico.setDescricao(descricao);
            servico.setDataEmissao(dataEmissao);
            servico.setDataFinalizacao(dataFinalizacao);
            servico.setValor(valor);
            servico.setObservacao(observacao);
            servico.setStatus(status);
            servico.setCliente(cliente.get());
            servico.setFormaPagamento(formaPagamento.get());

            // Salvando o serviço
            ServicoDao servicoDao = new ServicoDao(DataSourceSearcher.getInstance().getDataSource());
            boolean success = servicoDao.save(servico);

            // Redirecionamento após salvar
            if (success) {
                resp.sendRedirect(req.getContextPath() + "/listarServicos");
            } else {
                req.setAttribute("error", "Erro ao adicionar o serviço.");
                req.getRequestDispatcher("/erro.jsp").forward(req, resp);
            }
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "Erro ao processar o serviço.");
            req.getRequestDispatcher("/erro.jsp").forward(req, resp);
        }
    }
}
