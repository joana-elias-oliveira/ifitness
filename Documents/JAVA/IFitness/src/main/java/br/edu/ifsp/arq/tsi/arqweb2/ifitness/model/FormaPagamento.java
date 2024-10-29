package br.edu.ifsp.arq.tsi.arqweb2.ifitness.model;

public class FormaPagamento {
    private int codigo; // Código da forma de pagamento (ID ou identificador)
    private String tipo; // Tipo de pagamento (ex: Cartão, Dinheiro)
    private String descricao; // Descrição adicional

    // Construtor padrão
    public FormaPagamento() {}

    // Construtor com parâmetros
    public FormaPagamento(int codigo, String tipo, String descricao) {
        this.codigo = codigo;
        this.tipo = tipo;
        this.descricao = descricao;
    }

    // Getters e Setters
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

    // Método toString para facilitar a exibição de informações
    @Override
    public String toString() {
        return "FormaPagamento{" +
                "codigo=" + codigo +
                ", tipo='" + tipo + '\'' +
                ", descricao='" + descricao + '\'' +
                '}';
    }
}
