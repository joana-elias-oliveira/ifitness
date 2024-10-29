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
import java.util.List;

@WebServlet("/listarOrdensServico")
public class ListarOrdemServicoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        OrdemServicoDao ordemServicoDao = new OrdemServicoDao(DataSourceSearcher.getInstance().getDataSource());
        List<OrdemServico> ordensServico = ordemServicoDao.getAllOrdensServico();

        req.setAttribute("ordensServico", ordensServico);
        req.getRequestDispatcher("/listarOrdensServico.jsp").forward(req, resp);
    }
}
