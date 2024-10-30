package br.edu.ifsp.arq.tsi.arqweb2.ifitness.servlets;

import br.edu.ifsp.arq.tsi.arqweb2.ifitness.model.Servico;
import br.edu.ifsp.arq.tsi.arqweb2.ifitness.model.dao.ServicoDao;
import br.edu.ifsp.arq.tsi.arqweb2.ifitness.model.dao.ServicoDao;
import br.edu.ifsp.arq.tsi.arqweb2.ifitness.utils.DataSourceSearcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/servico")
public class ListarServicosServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ServicoDao servicoDao = new ServicoDao(DataSourceSearcher.getInstance().getDataSource());

        // Use getAllClientes() para obter a lista de clientes
        List<Servico> servicos = servicoDao.getAllServicos();

        req.setAttribute("servicos", servicos);
        req.getRequestDispatcher("/servicos.jsp").forward(req, resp);
    }
}
