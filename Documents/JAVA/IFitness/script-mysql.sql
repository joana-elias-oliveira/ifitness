use ifitness;
SHOW TABLES;
SHOW CREATE TABLE cliente;
# Table	Create Table
               CREATE TABLE `cliente` (
                                          `codigo` bigint NOT NULL AUTO_INCREMENT,
                                          `nome` varchar(255) NOT NULL,
    `email` varchar(255) DEFAULT NULL,
    `telefone` varchar(20) DEFAULT NULL,
    `cpf` varchar(11) NOT NULL,
    `ativo` tinyint(1) DEFAULT NULL,
    `logradouro` varchar(255) DEFAULT NULL,
    `numero` varchar(10) DEFAULT NULL,
    `complemento` varchar(255) DEFAULT NULL,
    `bairro` varchar(100) DEFAULT NULL,
    `cep` varchar(9) DEFAULT NULL,
    `cidade` varchar(100) DEFAULT NULL,
    `estado` varchar(2) DEFAULT NULL,
    PRIMARY KEY (`codigo`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE FormaPagamento (
                                codigo BIGINT PRIMARY KEY AUTO_INCREMENT,
                                nome VARCHAR(50) NOT NULL
);

CREATE TABLE Cliente (
                         codigo BIGINT PRIMARY KEY AUTO_INCREMENT,
                         nome VARCHAR(100),
                         email VARCHAR(100),
                         telefone VARCHAR(20),
                         cpf VARCHAR(20),
                         ativo BOOLEAN,
                         logradouro VARCHAR(100),
                         numero VARCHAR(10),
                         complemento VARCHAR(50),
                         bairro VARCHAR(50),
                         cep VARCHAR(15),
                         cidade VARCHAR(50),
                         estado VARCHAR(2)
);

CREATE TABLE OrdemServico (
                              codigo BIGINT PRIMARY KEY AUTO_INCREMENT,
                              descricao TEXT,
                              dataEmissao DATE,
                              dataFinalizacao DATE,
                              valor DECIMAL(10, 2),
                              observacao TEXT,
                              status ENUM('EM_APROVACAO', 'APROVADA', 'EM_ANDAMENTO', 'FINALIZADA'),
                              formaPagamento_id BIGINT,
                              cliente_id BIGINT,
                              FOREIGN KEY (formaPagamento_id) REFERENCES FormaPagamento(codigo),
                              FOREIGN KEY (cliente_id) REFERENCES Cliente(codigo)
);


SELECT * FROM cliente;
DELETE FROM Cliente WHERE codigo =2;
