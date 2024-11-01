use ifitness;

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

select * from FormaPagamento;
INSERT INTO FormaPagamento (codigo, nome) VALUES (5, 'aaa');
drop table FormaPagamento;
CREATE TABLE servico (
                              codigo BIGINT PRIMARY KEY AUTO_INCREMENT,
                              descricao TEXT,
                              dataEmissao DATE,
                              dataFinalizacao DATE,
                              valor DECIMAL(10, 2),
                              observacao TEXT,
                              status ENUM('EM_APROVACAO', 'APROVADA', 'EM_ANDAMENTO', 'FINALIZADA'),
                              formaPagamentoId BIGINT,
                              clienteId BIGINT,
                              FOREIGN KEY (formaPagamentoId) REFERENCES FormaPagamento(codigo),
                              FOREIGN KEY (clienteId) REFERENCES Cliente(codigo)
);

INSERT INTO servico (descricao, dataEmissao, dataFinalizacao, valor, observacao, status, formaPagamentoId, clienteId)
VALUES (
    'Serviço de manutenção geral',       -- descrição do serviço
    '2023-10-01',                        -- dataEmissao
    '2023-10-15',                        -- dataFinalizacao
    150.00,                              -- valor
    'Manutenção de equipamentos',        -- observação
    'EM_ANDAMENTO',                      -- status
    1,                                   -- formaPagamento_id (assumindo que o ID 1 existe na tabela FormaPagamento)
    1                                    -- cliente_id (assumindo que o ID 1 existe na tabela Cliente)
);

-- Substitua servico_ibfk_2 pelo nome exato da chave estrangeira na tabela servico
ALTER TABLE servico
DROP FOREIGN KEY servico_ibfk_2;

SHOW CREATE TABLE servico;

-- Adicionar a chave estrangeira novamente com exclusão em cascata
ALTER TABLE servico
ADD CONSTRAINT fk_servico_cliente FOREIGN KEY (clienteId) REFERENCES Cliente(codigo) ON DELETE CASCADE;

ALTER TABLE servico
DROP FOREIGN KEY servico_ibfk_1;


SELECT * FROM servico;
DELETE FROM servico WHERE codigo =6;
