package br.edu.ifsp.arq.tsi.arqweb2.ifitness.model.dao;

import br.edu.ifsp.arq.tsi.arqweb2.ifitness.model.Cliente;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import javax.sql.DataSource;

public class ClienteDao {

    private DataSource dataSource;

    public ClienteDao(DataSource dataSource) {
        if (dataSource == null) {
            throw new IllegalArgumentException("DataSource não pode ser nulo");
        }
        this.dataSource = dataSource;
    }

    // Método para adicionar cliente
    public boolean save(Cliente cliente) {
        Optional<Cliente> optional = getClienteByCpf(cliente.getCpf());
        if (optional.isPresent()) {
            return false; // Cliente com esse CPF já existe
        }

        String sql = "INSERT INTO Cliente (nome, email, telefone, cpf, ativo, logradouro, numero, complemento, bairro, cep, cidade, estado) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, cliente.getNome());
            ps.setString(2, cliente.getEmail());
            ps.setString(3, cliente.getTelefone());
            ps.setString(4, cliente.getCpf());
            ps.setBoolean(5, cliente.getAtivo());
            ps.setString(6, cliente.getLogradouro());
            ps.setString(7, cliente.getNumero());
            ps.setString(8, cliente.getComplemento());
            ps.setString(9, cliente.getBairro());
            ps.setString(10, cliente.getCep());
            ps.setString(11, cliente.getCidade());
            ps.setString(12, cliente.getEstado());

            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Erro durante a inserção do cliente no BD", e);
        }
        return true;
    }

    // Método para buscar cliente por ID
    public Optional<Cliente> getClienteById(Long id) {
        String sql = "SELECT * FROM Cliente WHERE codigo = ?";
        Optional<Cliente> optional = Optional.empty();

        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setLong(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Cliente cliente = new Cliente();
                    cliente.setId(rs.getLong("codigo"));
                    cliente.setNome(rs.getString("nome"));
                    cliente.setEmail(rs.getString("email"));
                    cliente.setTelefone(rs.getString("telefone"));
                    cliente.setCpf(rs.getString("cpf"));
                    cliente.setAtivo(rs.getBoolean("ativo"));
                    cliente.setLogradouro(rs.getString("logradouro"));
                    cliente.setNumero(rs.getString("numero"));
                    cliente.setComplemento(rs.getString("complemento"));
                    cliente.setBairro(rs.getString("bairro"));
                    cliente.setCep(rs.getString("cep"));
                    cliente.setCidade(rs.getString("cidade"));
                    cliente.setEstado(rs.getString("estado"));

                    optional = Optional.of(cliente);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Erro durante a consulta do cliente por ID no BD", e);
        }
        return optional;
    }

    // Método para buscar cliente por CPF
    public Optional<Cliente> getClienteByCpf(String cpf) {
        String sql = "SELECT * FROM Cliente WHERE cpf = ?";
        Optional<Cliente> optional = Optional.empty();

        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, cpf);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Cliente cliente = new Cliente();
                    cliente.setId(rs.getLong("codigo"));
                    cliente.setNome(rs.getString("nome"));
                    cliente.setEmail(rs.getString("email"));
                    cliente.setTelefone(rs.getString("telefone"));
                    cliente.setCpf(rs.getString("cpf"));
                    cliente.setAtivo(rs.getBoolean("ativo"));
                    cliente.setLogradouro(rs.getString("logradouro"));
                    cliente.setNumero(rs.getString("numero"));
                    cliente.setComplemento(rs.getString("complemento"));
                    cliente.setBairro(rs.getString("bairro"));
                    cliente.setCep(rs.getString("cep"));
                    cliente.setCidade(rs.getString("cidade"));
                    cliente.setEstado(rs.getString("estado"));

                    optional = Optional.of(cliente);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Erro durante a consulta do cliente por CPF no BD", e);
        }
        return optional;
    }

    public boolean update(Cliente cliente) {
        String sql = "UPDATE Cliente SET nome=?, email=?, telefone=?, ativo=?, logradouro=?, numero=?, complemento=?, bairro=?, cep=?, cidade=?, estado=? "
                + "WHERE cpf=?";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, cliente.getNome());
            ps.setString(2, cliente.getEmail());
            ps.setString(3, cliente.getTelefone());
            ps.setBoolean(4, cliente.getAtivo());
            ps.setString(5, cliente.getLogradouro());
            ps.setString(6, cliente.getNumero());
            ps.setString(7, cliente.getComplemento());
            ps.setString(8, cliente.getBairro());
            ps.setString(9, cliente.getCep());
            ps.setString(10, cliente.getCidade());
            ps.setString(11, cliente.getEstado());
            ps.setString(12, cliente.getCpf()); // Alterado para utilizar CPF

            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            throw new RuntimeException("Erro durante a atualização do cliente no BD", e);
        }
    }


    // Método para excluir cliente por ID
    public boolean deleteById(Long id) {
        String sql = "DELETE FROM Cliente WHERE codigo = ?";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setLong(1, id);
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            throw new RuntimeException("Erro durante a exclusão do cliente no BD", e);
        }
    }

    // Método para listar clientes
    public List<Cliente> listarClientes() {
        List<Cliente> clientes = new ArrayList<>();
        String sql = "SELECT * FROM cliente";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Cliente cliente = new Cliente();
                cliente.setId(rs.getLong("codigo"));
                cliente.setNome(rs.getString("nome"));
                cliente.setEmail(rs.getString("email"));
                cliente.setTelefone(rs.getString("telefone"));
                cliente.setCpf(rs.getString("cpf"));
                cliente.setAtivo(rs.getBoolean("ativo"));
                cliente.setLogradouro(rs.getString("logradouro"));
                cliente.setNumero(rs.getString("numero"));
                cliente.setComplemento(rs.getString("complemento"));
                cliente.setBairro(rs.getString("bairro"));
                cliente.setCep(rs.getString("cep"));
                cliente.setCidade(rs.getString("cidade"));
                cliente.setEstado(rs.getString("estado"));

                // Adiciona o cliente à lista
                clientes.add(cliente);

            }
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao listar clientes", e);
        }

        return clientes;


    }
}