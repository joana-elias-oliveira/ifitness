package br.edu.ifsp.arq.tsi.arqweb2.ifitness.model.dao;

import br.edu.ifsp.arq.tsi.arqweb2.ifitness.model.Servico;
import br.edu.ifsp.arq.tsi.arqweb2.ifitness.model.Status;
import br.edu.ifsp.arq.tsi.arqweb2.ifitness.model.Cliente;
import br.edu.ifsp.arq.tsi.arqweb2.ifitness.model.FormaPagamento;

import javax.sql.DataSource;
import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class ServicoDao {

    private DataSource dataSource;

    public ServicoDao(DataSource dataSource) {
        if (dataSource == null) {
            throw new IllegalArgumentException("DataSource não pode ser nulo");
        }
        this.dataSource = dataSource;
    }

    // Método para adicionar serviço
    public boolean save(Servico servico) {
        String sql = "INSERT INTO Servico (descricao, dataEmissao, dataFinalizacao, valor, observacao, status, clienteId, formaPagamentoId) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, servico.getDescricao());
            ps.setDate(2, Date.valueOf(servico.getDataEmissao()));
            ps.setDate(3, Date.valueOf(servico.getDataFinalizacao()));
            ps.setBigDecimal(4, servico.getValor());
            ps.setString(5, servico.getObservacao());
            ps.setString(6, servico.getStatus().name());
            ps.setLong(7, servico.getCliente().getId());
            ps.setInt(8, servico.getFormaPagamento().getCodigo());

            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            throw new RuntimeException("Erro durante a inserção do serviço no BD", e);
        }
    }

    // Método para buscar serviço por ID
    public Optional<Servico> getServicoById(Long id) {
        String sql = "SELECT * FROM Servico WHERE codigo = ?";
        Optional<Servico> optional = Optional.empty();

        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setLong(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Servico servico = mapRowToServico(rs);
                    optional = Optional.of(servico);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Erro durante a consulta do serviço por ID no BD", e);
        }
        return optional;
    }

    // Método auxiliar para mapear ResultSet para Servico
    private Servico mapRowToServico(ResultSet rs) throws SQLException {
        Servico servico = new Servico();
        servico.setId(rs.getLong("codigo"));
        servico.setDescricao(rs.getString("descricao"));
        servico.setDataEmissao(rs.getDate("dataEmissao").toLocalDate());
        servico.setDataFinalizacao(rs.getDate("dataFinalizacao") != null ? rs.getDate("dataFinalizacao").toLocalDate() : null);
        servico.setValor(rs.getBigDecimal("valor"));
        servico.setObservacao(rs.getString("observacao"));
        servico.setStatus(Status.valueOf(rs.getString("status")));

        // Presume que temos DAO para Cliente e FormaPagamento
        ClienteDao clienteDao = new ClienteDao(dataSource);
        Optional<Cliente> cliente = clienteDao.getClienteById(rs.getLong("clienteId"));
        cliente.ifPresent(servico::setCliente);

        FormaPagamentoDao formaPagamentoDao = new FormaPagamentoDao(dataSource);
        Optional<FormaPagamento> formaPagamento = formaPagamentoDao.getFormaPagamentoById(rs.getLong("formaPagamentoId"));
        formaPagamento.ifPresent(servico::setFormaPagamento);

        return servico;
    }

    // Método para atualizar serviço
    public boolean update(Servico servico) {
        String sql = "UPDATE Servico SET descricao=?, dataEmissao=?, dataFinalizacao=?, valor=?, observacao=?, status=?, clienteId=?, formaPagamentoId=? "
                + "WHERE codigo=?";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, servico.getDescricao());
            ps.setDate(2, Date.valueOf(servico.getDataEmissao()));
            ps.setDate(3, servico.getDataFinalizacao() != null ? Date.valueOf(servico.getDataFinalizacao()) : null);
            ps.setBigDecimal(4, servico.getValor());
            ps.setString(5, servico.getObservacao());
            ps.setString(6, servico.getStatus().name());
            ps.setLong(7, servico.getCliente().getId());
            ps.setInt(8, servico.getFormaPagamento().getCodigo());
            ps.setLong(9, servico.getId());

            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            throw new RuntimeException("Erro durante a atualização do serviço no BD", e);
        }
    }

    // Método para excluir serviço por ID
    public boolean deleteById(Long id) {
        String sql = "DELETE FROM Servico WHERE codigo = ?";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setLong(1, id);
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            throw new RuntimeException("Erro durante a exclusão do serviço no BD", e);
        }
    }

    // Método para listar todos os serviços
    public List<Servico> getAllServicos() {
        List<Servico> servicos = new ArrayList<>();
        String sql = "SELECT * FROM Servico";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Servico servico = mapRowToServico(rs);
                servicos.add(servico);
            }
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao listar serviços", e);
        }

        return servicos;
    }
}
