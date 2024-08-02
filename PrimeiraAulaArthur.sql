CREATE DATABASE senai;  -- Criar um database
 
USE senai;  -- Selecionando o database que vamos utilizar
 
CREATE TABLE professores(
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	-- INT inteiro
	-- Primary key -> Indica chave primaria
	-- Not Null -> Nunca vai ser vazio
	-- Auto_Increment -> Auto adicionar novo numero
	nome VARCHAR(60),
	materia VARCHAR(30)
);

INSERT INTO professores(nome, materia) VALUES
('Arthur Rosa', 'Banco de dados'),
('Samuel Brice','Flutter');

-- Select * -> selecionsa todas as colunas
-- FROm -> de todas as tabelas

-- Aqui eu estou dizendo que eu quero que ele ATUALIZE A tabela de professores, 
-- Ajuste a materia = backend e SE (where) for igual a 1, atualiza a matéria.

UPDATE professores SET materia = 'Backend' WHERE id = 1;
SELECT * FROM professores;

-- Delete de professores onde o ID é igual a 1.
DELETE FROM professores WHERE id = 1;





CREATE TABLE alunos (
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(60),
    idade INT
);

INSERT INTO alunos (nome, idade) VALUES
('Ricardão',20),
('Kawan Vigue', 19);


-- Deletar todos os alunos
TRUNCATE TABLE alunos;

-- Vai remover a tabela e todos os dados cadastrados.
DROP TABLE alunos;

-- Deleta mais de um ID	
DELETE FROM alunos WHERE id IN (1,2);

UPDATE alunos SET nome = 'Arthur' , idade = 22 WHERE id IN (1,2,3);


-- Colunas

-- alterar a coluna nome (a quantidade de caracteres).
ALTER TABLE alunos
MODIFY COLUMN nome VARCHAR(40);

-- Adicionar nova coluna

-- Add uma coluna
ALTER TABLE alunos
ADD COLUMN matricula VARCHAR(10);

-- Deletar uma coluna
ALTER TABLE alunos
DROP COLUMN matricula;

-- Trocar o nome
ALTER TABLE alunos
CHANGE COLUMN novoNome nome VARCHAR(30);

-- ALterar o nome da tabela

ALTER TABLE alunos
RENAME TO estudantes;

SELECT * FROM alunos;
