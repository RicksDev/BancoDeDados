CREATE DATABASE vendaslibbs;

USE vendaslibbs;

CREATE TABLE clientes (
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100), 
    idade INT
);

CREATE TABLE produtos(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    preco VARCHAR(30)
);

CREATE TABLE fornecedores(
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100),
    cnpj VARCHAR(100)
);

CREATE TABLE funcionario(
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100),
    cpf VARCHAR(11),
    ncarteira VARCHAR(30),
    salario INT
);

-- tabela que irá ligar todas as tabelas

CREATE TABLE pedidos(
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    idCliente INT,
    idProduto INT,
    idFuncionario INT,
    idFornecedor INT,
    -- FK (colundaAtual) RF tabela (nomeColuna)
    FOREIGN KEY(idCliente) REFERENCES clientes(id),
    FOREIGN KEY(idProduto) REFERENCES produtos(id),
    FOREIGN KEY(idFuncionario) REFERENCES funcionario(id),
    FOREIGN KEY(idFornecedor) REFERENCES fornecedores(id)
);

INSERT INTO clientes (nome, idade) 
VALUES ('Ricardo', 20), ('Chicken', 19), ('Lucas Moedas', 21);

INSERT INTO produtos (nome, preco) VALUES
('Camiseta da Insider', 'R$120,00'),('Teclado mecânico', 'R$199,90');

INSERT INTO fornecedores (nome, cnpj) VALUES
('Brás', '21.323.12/0001-12'),('Growth', '12.320.456/0001-12');

INSERT INTO funcionario (nome, cpf, ncarteira, salario) VALUES
('Luiz Ricardo', '5499992139','20391311',50000),
('Moedas', '65184894561', '5148654', 50000);

SELECT * FROM clientes;

SELECT * FROM produtos;

SELECT * FROM fornecedores;
SELECT * FROM funcionario;

INSERT INTO pedidos (idCliente, idProduto, idFuncionario, idFornecedor)
VALUES (3,1,2,1),(2,2,1,2);

DELETE FROM pedidos WHERE id = 1;

SELECT * FROM pedidos;

