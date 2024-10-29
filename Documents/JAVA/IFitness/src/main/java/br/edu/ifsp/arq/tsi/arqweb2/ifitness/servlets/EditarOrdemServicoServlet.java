package br.edu.ifsp.arq.tsi.arqweb2.ifitness.servlets;

import br.edu.ifsp.arq.tsi.arqweb2.ifitness.model.OrdemServico;
import br.edu.ifsp.arq.tsi.arqweb2.ifitness.model.dao.OrdemServicoDao;
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

@WebServlet("/editarOrdemServico")
public class EditarOrdemServicoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Long id = Long.parseLong(req.getParameter("id"));
        OrdemServicoDao ordemServicoDao = new OrdemServicoDao(DataSourceSearcher.getInstance().getDataSource());

        Optional<OrdemServico> optionalOrdem = ordemServicoDao.getOrdemServicoById(id);
        if (optionalOrdem.isPresent()) {
            req.setAttribute("ordem", optionalOrdem.get());
            req.getRequestDispatcher("/editarOrdemServico.jsp").forward(req, resp);
        } else {
            resp.sendRedirect("listarOrdensServico");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Long id = Long.parseLong(req.getParameter("id"));
        OrdemServico ordem = new OrdemServico();
        ordem.setCodigo(id);
        ordem.setDescricao(req.getParameter("descricao"));
        ordem.setDataEmissao(LocalDate.parse(req.getParameter("dataEmissao")));
        ordem.setValor(new BigDecimal(req.getParameter("valor")));
        ordem.setObservacao(req.getParameter("observacao"));

        OrdemServicoDao ordemServicoDao = new OrdemServicoDao(DataSourceSearcher.getInstance().getDataSource());
        ordemServicoDao.updateOrdemServico(ordem);

        resp.sendRedirect("listarOrdensServico");
    }
}
