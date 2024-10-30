package br.edu.ifsp.arq.tsi.arqweb2.ifitness.model.dao;

import br.edu.ifsp.arq.tsi.arqweb2.ifitness.model.FormaPagamento;

import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class FormaPagamentoDao {

    private final DataSource dataSource;

    public FormaPagamentoDao(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    // Método para adicionar uma nova forma de pagamento
    public boolean addFormaPagamento(FormaPagamento formaPagamento) {
        String sql = "INSERT INTO FormaPagamento (codigo, tipo, descricao) VALUES (?, ?, ?)";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, formaPagamento.getCodigo());
            ps.setString(2, formaPagamento.getTipo());
            ps.setString(3, formaPagamento.getDescricao());

            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Método para buscar uma forma de pagamento pelo ID
    public Optional<FormaPagamento> getFormaPagamentoById(Long id) {
        String sql = "SELECT * FROM FormaPagamento WHERE codigo = ?";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setLong(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    FormaPagamento formaPagamento = new FormaPagamento();
                    formaPagamento.setCodigo(rs.getInt("codigo"));
                    formaPagamento.setTipo(rs.getString("tipo"));
                    formaPagamento.setDescricao(rs.getString("descricao"));
                    return Optional.of(formaPagamento);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return Optional.empty();
    }

    // Método para listar todas as formas de pagamento
    public List<FormaPagamento> getAllFormasPagamento() {
        List<FormaPagamento> formasPagamento = new ArrayList<>();
        String sql = "SELECT * FROM FormaPagamento";

        try (Connection conn = dataSource.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                FormaPagamento formaPagamento = new FormaPagamento();
                formaPagamento.setCodigo(rs.getInt("codigo"));
                formaPagamento.setTipo(rs.getString("tipo"));
                formaPagamento.setDescricao(rs.getString("descricao"));
                formasPagamento.add(formaPagamento);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return formasPagamento;
    }

    // Método para remover uma forma de pagamento pelo ID
    public boolean deleteFormaPagamento(Long id) {
        String sql = "DELETE FROM FormaPagamento WHERE codigo = ?";

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
}
