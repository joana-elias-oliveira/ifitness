package br.edu.ifsp.arq.tsi.arqweb2.ifitness.model;

public class FormaPagamento {
    private int codigo;
    private String tipo;
    private String descricao;

    // Construtor, Getters e Setters
    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }
}
