CREATE DATABASE desafioArthur;

USE desafioArthur;

CREATE TABLE professor (
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100),
    idade INT
);

CREATE TABLE aluno (
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100)
);

ALTER TABLE aluno
ADD COLUMN idade INT;
 
CREATE TABLE turma (
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    idAluno INT,
    idProfessor INT,
    
    FOREIGN KEY (idProfessor) REFERENCES professor(id),
    FOREIGN KEY (idAluno) REFERENCES aluno(id)
);

INSERT INTO aluno(nome,idade) VALUES
('Rafael', 10), ('Ricardo', 20);

INSERT INTO professor(nome, idade) VALUES
('Artur', 20), ('Bruce', 40);

INSERT INTO professor(nome, idade) VALUES
('Ive', 40), ('José', 38);

INSERT INTO turma (idAluno, idProfessor) VALUES
(2,4), (1,3),(1,6),(2,5);

SELECT * FROM turma;

SELECT * FROM aluno;

SELECT * FROM professor;

SELECT * FROM turma;

-- Aluno -> Turma
-- Aluno virou "al" -> al.nome
SELECT al.nome, al.idade, turma.idProfessor
FROM aluno AS al
INNER JOIN turma ON turma.idALuno = al.id;

SELECT prof.nome, prof.idade, turma.idAluno
FROM professor AS prof
INNER JOIN turma ON turma.idProfessor = prof.id;

SELECT al.nome, al.idade, professor.nome
FROM aluno AS al 
INNER JOIN turma ON turma.idAluno = al.id 
INNER JOIN professor ON turma.idProfessor = professor.id


