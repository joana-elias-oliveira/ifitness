package br.edu.ifsp.arq.tsi.arqweb2.ifitness.model.dao;

import br.edu.ifsp.arq.tsi.arqweb2.ifitness.model.OrdemServico;
import br.edu.ifsp.arq.tsi.arqweb2.ifitness.model.Status;
import br.edu.ifsp.arq.tsi.arqweb2.ifitness.utils.DataSourceSearcher;

import javax.sql.DataSource;
import java.sql.*;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class OrdemServicoDao {

    private final DataSource dataSource;

    public OrdemServicoDao(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    // Método para adicionar uma nova ordem de serviço
    public boolean addOrdemServico(OrdemServico ordem) {
        String sql = "INSERT INTO OrdemServico (descricao, dataEmissao, dataFinalizacao, valor, observacao, status, clienteId, formaPagamentoId) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, ordem.getDescricao());
            ps.setDate(2, Date.valueOf(ordem.getDataEmissao()));
            ps.setDate(3, ordem.getDataFinalizacao() != null ? Date.valueOf(ordem.getDataFinalizacao()) : null);
            ps.setBigDecimal(4, ordem.getValor());
            ps.setString(5, ordem.getObservacao());
            ps.setString(6, ordem.getStatus().name());
            ps.setLong(7, ordem.getCliente().getId());
            ps.setLong(8, ordem.getFormaPagamento().getCodigo());

            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Método para obter todas as ordens de serviço
    public List<OrdemServico> getAllOrdensServico() {
        List<OrdemServico> ordensServico = new ArrayList<>();
        String sql = "SELECT * FROM OrdemServico";

        try (Connection conn = dataSource.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                OrdemServico ordem = mapRowToOrdemServico(rs);
                ordensServico.add(ordem);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return ordensServico;
    }

    // Método para obter uma ordem de serviço pelo ID
    public Optional<OrdemServico> getOrdemServicoById(Long id) {
        String sql = "SELECT * FROM OrdemServico WHERE codigo = ?";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setLong(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    OrdemServico ordem = mapRowToOrdemServico(rs);
                    return Optional.of(ordem);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return Optional.empty();
    }

    // Método para atualizar uma ordem de serviço
    public boolean updateOrdemServico(OrdemServico ordem) {
        String sql = "UPDATE OrdemServico SET descricao = ?, dataEmissao = ?, dataFinalizacao = ?, valor = ?, observacao = ?, status = ?, clienteId = ?, formaPagamentoId = ? " +
                "WHERE codigo = ?";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, ordem.getDescricao());
            ps.setDate(2, Date.valueOf(ordem.getDataEmissao()));
            ps.setDate(3, ordem.getDataFinalizacao() != null ? Date.valueOf(ordem.getDataFinalizacao()) : null);
            ps.setBigDecimal(4, ordem.getValor());
            ps.setString(5, ordem.getObservacao());
            ps.setString(6, ordem.getStatus().name());
            ps.setLong(7, ordem.getCliente().getId());
            ps.setLong(8, ordem.getFormaPagamento().getCodigo());
            ps.setLong(9, ordem.getCodigo());

            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Método para deletar uma ordem de serviço
    public boolean deleteOrdemServico(Long id) {
        String sql = "DELETE FROM OrdemServico WHERE codigo = ?";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setLong(1, id);
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Método auxiliar para mapear os resultados de uma linha para uma ordem de serviço
    private OrdemServico mapRowToOrdemServico(ResultSet rs) throws SQLException {
        OrdemServico ordem = new OrdemServico();
        ordem.setCodigo(rs.getLong("codigo"));
        ordem.setDescricao(rs.getString("descricao"));
        ordem.setDataEmissao(rs.getDate("dataEmissao").toLocalDate());
        ordem.setDataFinalizacao(rs.getDate("dataFinalizacao") != null ? rs.getDate("dataFinalizacao").toLocalDate() : null);
        ordem.setValor(rs.getBigDecimal("valor"));
        ordem.setObservacao(rs.getString("observacao"));
        ordem.setStatus(Status.valueOf(rs.getString("status")));

        // Aqui você pode adicionar a lógica para carregar o cliente e a forma de pagamento,
        // caso essas informações estejam em tabelas relacionadas e você tenha acesso a esses DAOs
        // Exemplo:
        // ClienteDao clienteDao = new ClienteDao(dataSource);
        // ordem.setCliente(clienteDao.getClienteById(rs.getLong("clienteId")).orElse(null));

        return ordem;
    }
}
