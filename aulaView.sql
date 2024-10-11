CREATE DATABASE cleancode;
USE cleancode;


CREATE DATABASE libbsview;
USE libbsview;

CREATE TABLE produtos(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome VARCHAR(100),
    quantidade INT, 
    preco DECIMAL(10,2),
    descricao VARCHAR(100)
);

CREATE TABLE clientes (
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome VARCHAR(100),
    email VARCHAR(100),
    senha VARCHAR(100)
);

CREATE TABLE pedidos(
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    idProduto INT,
    idCliente INT,
    FOREIGN KEY(idProduto) REFERENCES produtos(id),
    FOREIGN KEY(idCliente) REFERENCES clientes(id)
);

INSERT INTO produtos(nome, descricao, preco, quantidade) VALUES
('coca-cola', 'gelada é bom', 20.00, 3),('Camisa São Paulo', 'É bem feia', 199.89, 20),('Gs1200','randandandan', 10000.00, 3),('Tiger', 'vrummmmmmm', 19999.99, 20);

INSERT INTO clientes(nome, email, senha) VALUES
('Ricardo Filho', 'Filho@gmail.com','123123123'),('Kawan Wagner', 'kawan@gmail.com','23455667'),('Samuel','samuca@terra.com','777'),('João Chicken','chicken@gmail.com','999');

INSERT INTO pedidos(idProduto,idCliente) VALUES	
(1,1),(2,2),(3,3),(4,4),(2,1),(2,3),(3,4),(4,1);

-- Saber a quantidade total de estoque
SELECT SUM(quantidade) AS QuantidadeTotal FROM produtos;

CREATE VIEW visualizar_total_estoque AS 
SELECT SUM(quantidade) AS QuantidadeTotal FROM produtos;

SELECT * FROM visualizar_total_estoque;


-- Calcular o faturamento total do estoque
CREATE VIEW visualizar_faturamento_total2 AS
SELECT (preco * quantidade) AS preocoTotal FROM produtos;

SELECT SUM(preocoTotal) AS precoTotal FROM visualizar_faturamento_total2;

DROP VIEW visualizar_faturamento_total;

-- CRIE UMA CONSULTA QUE VAI SELECIONAR TODOS OS PRODUTOS QUE FORAM PEDIDOS
-- CRIAR VIEW
CREATE VIEW pedidosFeitos AS
SELECT nome, descricao, pedidos.id FROM produtos
INNER JOIN pedidos ON idProduto = produtos.id;


SELECT * FROM pedidosFeitos;

-- Visualiar o cliente, o pedido e o produto
CREATE VIEW viewGigante AS
SELECT cl.nome AS ClienteNome, cl.email, pedidos.id AS PedidoId, produtos.nome AS ProdutoNome
FROM clientes AS cl
INNER JOIN pedidos ON pedidos.idCliente = cl.id
INNER JOIN produtos  ON produtos.id  = pedidos.idProduto;

DROP VIEW viewGigante;

SELECT * FROM viewGigante;







