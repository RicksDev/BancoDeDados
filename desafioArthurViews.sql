CREATE DATABASE desafio_arthur;

USE desafio_arthur;

CREATE TABLE destinos (
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nomeDestino VARCHAR(100) NOT NULL,
    pais VARCHAR(70),
    descricao VARCHAR(100)
);

CREATE TABLE pacotes (
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    idDestino INT,
    nomePacote VARCHAR(100),
    preco DECIMAL(10,2),
    dataInicio DATE,
    dataTermino DATE,
    
    
    FOREIGN KEY (idDestino) REFERENCES destinos(id)
);

CREATE TABLE clientes(
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nomeCliente VARCHAR(100),
    email VARCHAR(100),
    telefone INT,
    endereco VARCHAR(100)
);

CREATE TABLE reservas (
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    idCliente INT, 
    idPacote INT,
    dataReserva DATE,
    numeroPessoas INT,
    status ENUM('Confirmada','Pendente', 'Cancelada') DEFAULT 'Pendente',
    
    FOREIGN KEY (idCliente) REFERENCES clientes(id),
    FOREIGN KEY (idPacote) REFERENCES pacotes(id)
);

INSERT INTO destinos (nomeDestino, pais, descricao) VALUES
('Paris', 'França', 'Cidade luz, famosa pela Torre Eiffel'),
('Roma', 'Itália', 'História e arte, famosa pelo Coliseu'),
('Nova York', 'EUA', 'A cidade que nunca dorme');


INSERT INTO pacotes (idDestino, nomePacote, preco, dataInicio, dataTermino) VALUES
(1, 'Paris Essencial', 5000.00, '2024-05-10', '2024-05-20'),
(2, 'Roma Histórica', 4500.00, '2024-06-01', '2024-06-10'),
(3, 'NY Aventura', 6000.00, '2024-07-15', '2024-07-25');

INSERT INTO clientes (nomeCliente, email, telefone, endereco) VALUES
('Alice', 'alice@example.com', '123456789', 'Rua A, 123'),
('Bob', 'bob@example.com', '987654321', 'Rua B, 456'),
('Carol', 'carol@example.com', '555555555', 'Rua C, 789');

INSERT INTO reservas (idCliente, idPacote, dataReserva, numeroPessoas, status) VALUES
(1, 1, '2024-04-01', 2, 'confirmada'),
(2, 2, '2024-04-02', 1, 'pendente'),
(3, 3, '2024-04-03', 4, 'cancelada');

SELECT * FROM destinos;


CREATE VIEW nomePacotes AS
SELECT destinos.nomeDestino, pacotes.nomePacote
FROM destinos
INNER JOIN pacotes ON destinos.id = pacotes.idDestino;


CREATE VIEW nomeClientes2 AS
SELECT reservas.idCliente, clientes.nomeCliente
FROM clientes
INNER JOIN reservas ON reservas.idCliente = clientes.nomeCliente;

SELECT * FROM nomeClientes2;

SELECT * FROM nomePacotes;

CREATE VIEW ClientesPacotesConfirmados AS
SELECT
    Clientes.nomeCliente AS nomeCliente,
    Clientes.email,
    pacotes.nomePacote AS nomePacote,
    reservas.dataReserva,
    reservas.numeroPessoas
FROM
    Clientes
JOIN Reservas ON Clientes.id = Reservas.idCliente
JOIN Pacotes ON Reservas.idPacote = Pacotes.id
WHERE Reservas.status = 'confirmada';

SELECT * FROM ClientesPacotesConfirmados;





