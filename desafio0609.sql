CREATE DATABASE desafio0609;

USE desafio0609;

CREATE TABLE clientes (
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100), 
    email VARCHAR(100),
    telefone VARCHAR(20)
);

INSERT INTO clientes (nome, email, telefone) VALUES
('Ricardo Filho', 'fiho.ricardo13@gmail.com','11946194068'), ('Arthur Gomes', 'arthurzinho@gmail.com', '119994685215');

CREATE TABLE categorias (
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100)
);

INSERT INTO categorias (nome) VALUES
('Eletrônico'), ('Papelaria');

CREATE TABLE produtos (
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100),
    preco VARCHAR(20),
    categoriaId INT,
    
    FOREIGN KEY (categoriaId) REFERENCES categorias(id)
);

INSERT INTO produtos (nome, preco, categoriaId) VALUES
('Celular','9999,99', 1), ('Tesoura', '10', 2);

CREATE TABLE pedidos (
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    datapedido DATE,
    clienteId INT,
    
    FOREIGN KEY (clienteId) REFERENCES clientes(id)
);

INSERT INTO pedidos (datapedido, clienteId) VALUES
('2024-09-06', 1), ('2024-05-09', 2);

CREATE TABLE itensPedidos (
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    quantidade INT,
    preco_unitario INT,
    pedidoId INT,
    produtoId INT,
    
    FOREIGN KEY (pedidoId) REFERENCES pedidos(id),
    FOREIGN KEY (produtoId) REFERENCES produtos(id)
);

INSERT INTO itensPedidos (quantidade, preco_unitario, pedidoId, produtoId) VALUES
(15, 28,1,1), (18,30,2,2);

CREATE TABLE pagamentos (
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    metodo_pagamento VARCHAR(100),
    valor_pago INT,
    data_pagamento DATE,
    pedidoId INT,
    
    FOREIGN KEY (pedidoId) REFERENCES pedidos(id)
); 

INSERT INTO pagamentos (metodo_pagamento, valor_pago, data_pagamento, pedidoId) VALUES
('Crédito', 28, '2024-09-06', 1), ('Debito', 30, '2024-09-05',2);

select * from clientes;
select * from categorias;
select * from produtos;
select * from pedidos;
select * from itensPedidos;
select * from pagamentos;

-- Produtos -> Categorias
SELECT prod.nome, prod.preco, categorias.nome
FROM produtos AS prod
INNER JOIN categorias ON prod.categoriaId = categorias.id;

-- Clientes -> Pedidos
SELECT cl.nome, cl.email, cl.telefone, pedidos.datapedido
FROM clientes AS cl
INNER JOIN pedidos ON pedidos.clienteId = cl.id;

-- Pedidos -> Clientes
SELECT ped.id, ped.datapedido, clientes.nome
FROM pedidos AS ped
INNER JOIN clientes ON ped.clienteId = clientes.id;

-- itensPedidos -> Produto -> Pedido
SELECT ip.quantidade, ip.preco_unitario, produtos.nome, pedidos.datapedido
FROM itensPedidos AS ip
INNER JOIN produtos ON produtos.id = ip.produtoId
INNER JOIN pedidos ON ip.pedidoId = pedidos.id;

-- Categorias -> Produtos -> ItensPedidos -> Pedidos

SELECT pd.nome, pd.preco, categorias.nome, ip.quantidade, pedidos.datapedido
FROM produtos AS pd
INNER JOIN categorias ON pd.categoriaId = categorias.id
INNER JOIN itensPedidos AS ip ON ip.produtoId = pd.id
INNER JOIN pedidos ON ip.pedidoId = pedidos.id;

