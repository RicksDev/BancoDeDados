CREATE DATABASE rainbank;

USE rainbank;

CREATE TABLE conta_bancaria (
	id INT PRIMARY KEY AUTO_INCREMENT,
    cliente VARCHAR(100),
    saldo DECIMAL(10,2)
);


 -- Definindo o início e depois o fim da Procedure.
DELIMITER //
CREATE PROCEDURE add_contabancaria(
	IN cb_nome VARCHAR(100),
    IN cb_saldo DECIMAL (10,2)
    
)
BEGIN
	INSERT INTO conta_bancaria(cliente, saldo)
    VALUES(cb_nome, cb_saldo);
    
END //
DELIMITER ;

CALL add_contabancaria("Arthur ROsa", 100.00);
CALL add_contabancaria("Neymar", 101.00);
CALL add_contabancaria("Cr7", 90.00);

-- Criar a proedure de atualização

DELIMITER //
CREATE PROCEDURE update_contabancaria(
	IN cb_id INT,
	IN cb_nome VARCHAR(100),
    IN cb_saldo DECIMAL(10,2 )
) 
BEGIN
	UPDATE conta_bancaria 
    SET cliente = cb_nome, saldo = cb_saldo 
    WHERE id = cb_id;
END //
DELIMITER ;