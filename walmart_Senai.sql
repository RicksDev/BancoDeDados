CREATE DATABASE walmartsenai;
USE walmartsenai;

CREATE TABLE produto (
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100),
    quantidade INT
);

CREATE TABLE cliente (
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100),
    idade INT
);

CREATE TABLE fornecedor (
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100)
);

CREATE TABLE pedido (
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_produto INT,
    id_cliente INT,
    id_fornecedor INT,
    
    FOREIGN KEY (id_produto) REFERENCES produto(id),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id),
    FOREIGN KEY (id_fornecedor) REFERENCES fornecedor(id)
    
); 	

INSERT INTO produto(nome, quantidade) VALUES
('Tesoura', 39),('Borracha', 85), ('Lápis',  120),('Caderno', 80);

INSERT INTO cliente (nome, idade) VALUES
('Rafael', 10), ('Ricardo', 20),('Artur', 20), ('Bruce', 40),('Ive', 40), ('José', 38);

INSERT INTO fornecedor (nome) VALUES
('Bj modas'), ('Vida Louca'),('Fatto a mano'),('Lucas Moedas');

INSERT INTO pedido (id_produto, id_cliente, id_fornecedor) VALUES
(1,2,1),(2,3,1),(3,4,1),(4,5,1),(2,1,2),(3,2,3),(4,6,4),(1,5,2);

SELECT cl.nome, cl.idade, pedido.id_fornecedor
FROM cliente AS cl
INNER JOIN pedido ON pedido.id_cliente = cl.id;