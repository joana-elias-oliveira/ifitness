package br.edu.ifsp.arq.tsi.arqweb2.ifitness.servlets;

import br.edu.ifsp.arq.tsi.arqweb2.ifitness.model.dao.ClienteDao;
import br.edu.ifsp.arq.tsi.arqweb2.ifitness.utils.DataSourceSearcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/excluirCliente")
public class ExcluirClienteServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idParam = req.getParameter("id");
        System.out.println("ID recebido para exclusão no servlet: " + idParam); // Verifique se o ID está chegando

        if (idParam != null && !idParam.isEmpty()) {
            try {
                long id = Long.parseLong(idParam);
                ClienteDao clienteDao = new ClienteDao(DataSourceSearcher.getInstance().getDataSource());

                boolean success = clienteDao.deleteById(id);
                if (success) {
                    resp.sendRedirect("cliente"); // Redireciona para a lista de clientes após a exclusão
                } else {
                    resp.getWriter().write("Erro ao excluir o cliente. <a href='cliente'>Voltar para a lista de clientes</a>");
                }
            } catch (NumberFormatException e) {
                resp.getWriter().write("ID inválido. <a href='cliente'>Voltar para a lista de clientes</a>");
            }
        } else {
            resp.getWriter().write("ID não fornecido. <a href='cliente'>Voltar para a lista de clientes</a>");
        }
    }
}