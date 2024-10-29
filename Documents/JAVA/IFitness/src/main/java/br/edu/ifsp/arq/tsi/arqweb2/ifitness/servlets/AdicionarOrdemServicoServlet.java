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

@WebServlet("/adicionarOrdemServico")
public class AdicionarOrdemServicoServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        OrdemServico ordem = new OrdemServico();
        ordem.setDescricao(req.getParameter("descricao"));
        ordem.setDataEmissao(LocalDate.parse(req.getParameter("dataEmissao")));
        ordem.setValor(new BigDecimal(req.getParameter("valor")));
        ordem.setObservacao(req.getParameter("observacao"));

        OrdemServicoDao ordemServicoDao = new OrdemServicoDao(DataSourceSearcher.getInstance().getDataSource());
        ordemServicoDao.addOrdemServico(ordem);

        resp.sendRedirect("listarOrdensServico");
    }
}
