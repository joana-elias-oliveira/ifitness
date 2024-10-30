package br.edu.ifsp.arq.tsi.arqweb2.ifitness.servlets;

import br.edu.ifsp.arq.tsi.arqweb2.ifitness.model.Servico;
import br.edu.ifsp.arq.tsi.arqweb2.ifitness.model.Status;
import br.edu.ifsp.arq.tsi.arqweb2.ifitness.model.Cliente;
import br.edu.ifsp.arq.tsi.arqweb2.ifitness.model.FormaPagamento;
import br.edu.ifsp.arq.tsi.arqweb2.ifitness.model.dao.ServicoDao;
import br.edu.ifsp.arq.tsi.arqweb2.ifitness.model.dao.ClienteDao;
import br.edu.ifsp.arq.tsi.arqweb2.ifitness.model.dao.FormaPagamentoDao;
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

@WebServlet("/editarServico")
public class EditarServicoServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Long id = Long.parseLong(req.getParameter("id"));

        ServicoDao servicoDao = new ServicoDao(DataSourceSearcher.getInstance().getDataSource());

        Optional<Servico> optionalServico = servicoDao.getServicoById(id);
        if (optionalServico.isPresent()) {
            req.setAttribute("servico", optionalServico.get());
            req.getRequestDispatcher("/editarServico.jsp").forward(req, resp);
        } else {
            resp.sendRedirect(req.getContextPath() + "/servico");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Long id = Long.parseLong(req.getParameter("id"));
        String descricao = req.getParameter("descricao");

        // Conversão das datas de String para LocalDate
        LocalDate dataEmissao = LocalDate.parse(req.getParameter("dataEmissao"));
        LocalDate dataFinalizacao = LocalDate.parse(req.getParameter("dataFinalizacao"));

        // Conversão do valor de String para BigDecimal
        BigDecimal valor = new BigDecimal(req.getParameter("valor"));

        String observacao = req.getParameter("observacao");

        // Conversão do status de String para o enum Status
        Status status = Status.valueOf(req.getParameter("status").toUpperCase());

        // Obtenção do cliente e forma de pagamento através dos seus DAOs
        Long clienteId = Long.parseLong(req.getParameter("cliente"));
        Long formaPagamentoId = Long.parseLong(req.getParameter("formaPagamento"));

        ClienteDao clienteDao = new ClienteDao(DataSourceSearcher.getInstance().getDataSource());
        FormaPagamentoDao formaPagamentoDao = new FormaPagamentoDao(DataSourceSearcher.getInstance().getDataSource());

        Optional<Cliente> cliente = clienteDao.getClienteById(clienteId);
        Optional<FormaPagamento> formaPagamento = formaPagamentoDao.getFormaPagamentoById(formaPagamentoId);

        Servico servico = new Servico();
        servico.setId(id);
        servico.setDescricao(descricao);
        servico.setDataEmissao(dataEmissao);
        servico.setDataFinalizacao(dataFinalizacao);
        servico.setValor(valor);
        servico.setObservacao(observacao);
        servico.setStatus(status);
        cliente.ifPresent(servico::setCliente);
        formaPagamento.ifPresent(servico::setFormaPagamento);

        ServicoDao servicoDao = new ServicoDao(DataSourceSearcher.getInstance().getDataSource());

        boolean atualizado = servicoDao.update(servico);

        if (atualizado) {
            resp.sendRedirect(req.getContextPath() + "/servico");
        } else {
            req.setAttribute("error", "Erro ao atualizar o serviço");
            req.getRequestDispatcher("/erro.jsp").forward(req, resp);
        }
    }
}
