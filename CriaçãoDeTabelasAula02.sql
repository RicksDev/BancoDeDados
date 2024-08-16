CREATE DATABASE operadores_libbs;

USE operadores_libbs;

CREATE TABLE clientes (
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(70),
    idade INT
);

CREATE TABLE empregados (
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(70),
    idade INT,
    salario INT
);

INSERT INTO clientes (nome,idade)
VALUES ('Roger', 18), ('Ricardo', 20);

INSERT INTO empregados(nome, idade, salario)
VALUES('Viviane',21,10000),('Igor',31,5000);


CREATE TABLE produtos (
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(70),
    preco INT,
    quantidade INT
);

INSERT INTO produtos (nome, preco, quantidade)
VALUES ('Torradeira', 4000, 5), ('Air Fry', 5000, 15);


SELECT * FROM clientes;
SELECT * FROM empregados;
SELECT * FROM produtos;

