CREATE DATABASE escolaricardo;
USE escolaricardo;

CREATE TABLE Turmas (
    turma_id INT PRIMARY KEY,
    descricao VARCHAR(255)
);

CREATE TABLE Professores (
    professor_id INT PRIMARY KEY,
    nome VARCHAR(255)
);

CREATE TABLE Alunos (
    aluno_id INT PRIMARY KEY,
    nome VARCHAR(255),
    idade INT,
    turma_id INT,
    FOREIGN KEY (turma_id) REFERENCES Turmas(turma_id)
);

CREATE TABLE Turma_Professor (
    turma_id INT,
    professor_id INT,
    PRIMARY KEY (turma_id, professor_id),
    FOREIGN KEY (turma_id) REFERENCES Turmas(turma_id),
    FOREIGN KEY (professor_id) REFERENCES Professores(professor_id)
);

CREATE TABLE Atividades (
    atividade_id INT PRIMARY KEY,
    descricao VARCHAR(255),
    turma_id INT,
    FOREIGN KEY (turma_id) REFERENCES Turmas(turma_id)
);

CREATE TABLE Notas (
    aluno_id INT,
    atividade_id INT,
    nota DECIMAL(5, 2),
    PRIMARY KEY (aluno_id, atividade_id),
    FOREIGN KEY (aluno_id) REFERENCES Alunos(aluno_id),
    FOREIGN KEY (atividade_id) REFERENCES Atividades(atividade_id)
);


-- Dados das tabelas
-- Inserção de dados nas Turmas
INSERT INTO Turmas (turma_id, descricao) VALUES (1, 'Matemática 101');
INSERT INTO Turmas (turma_id, descricao) VALUES (2, 'História 101');
INSERT INTO Turmas (turma_id, descricao) VALUES (3, 'Ciências 101');

-- Inserção de dados nos Professores
INSERT INTO Professores (professor_id, nome) VALUES (1, 'Carlos Silva');
INSERT INTO Professores (professor_id, nome) VALUES (2, 'Maria Fernandes');
INSERT INTO Professores (professor_id, nome) VALUES (3, 'João Pereira');

SELECT * FROM Professores;

-- Inserção de dados na tabela Turma_Professor
INSERT INTO Turma_Professor (turma_id, professor_id) VALUES (1, 2);
INSERT INTO Turma_Professor (turma_id, professor_id) VALUES (2, 2);
INSERT INTO Turma_Professor (turma_id, professor_id) VALUES (3, 3);

SELECT * FROM Alunos;
-- Inserção de dados nos Alunos
INSERT INTO Alunos (aluno_id, nome, idade, turma_id) VALUES (1, 'Ana Santos', 15, 1);
INSERT INTO Alunos (aluno_id, nome, idade, turma_id) VALUES (2, 'Pedro Gonçalves', 16, 1);
INSERT INTO Alunos (aluno_id, nome, idade, turma_id) VALUES (3, 'Lucas Andrade', 15, 2);
INSERT INTO Alunos (aluno_id, nome, idade, turma_id) VALUES (4, 'Mariana Costa', 16, 3);

-- Inserção de dados nas Atividades
INSERT INTO Atividades (atividade_id, descricao, turma_id) VALUES (1, 'Prova de Matemática', 1);
INSERT INTO Atividades (atividade_id, descricao, turma_id) VALUES (2, 'Trabalho de História', 2);
INSERT INTO Atividades (atividade_id, descricao, turma_id) VALUES (3, 'Experimento de Ciências', 3);

-- Inserção de dados nas Notas
INSERT INTO Notas (aluno_id, atividade_id, nota) VALUES (1, 1, 9.5);
INSERT INTO Notas (aluno_id, atividade_id, nota) VALUES (2, 1, 8.0);
INSERT INTO Notas (aluno_id, atividade_id, nota) VALUES (3, 2, 7.5);

SELECT * FROM Turmas;
-- Desafios em Aula

SELECT al.nome, al.aluno_id, Turmas.turma_id, Turmas.descricao
FROM Alunos AS al
INNER JOIN Turmas ON Turmas.turma_id = al.turma_id;

-- Alunos e suas notas na atividade
SELECT al.nome, al.aluno_id, Notas.atividade_id, Notas.nota
FROM Alunos AS al
LEFT JOIN Notas ON Notas.aluno_id = al.aluno_id AND Notas.atividade_id = 1;
-- Se colocar o  WHERE para buscar a atividade_id, ele não busca os vazios. Já, se colocar o AND, ele busca os vázios também.

-- Listar a nota com e sem, com o nome dos alunos
SELECT n.nota, Alunos.aluno_id, Alunos.nome
FROM Notas AS n
RIGHT JOIN Alunos ON Alunos.aluno_id = n.aluno_id;

SELECT * FROM Turma_Professor;

USE escolaricardo; 

SELECT al.nome AS nome_aluno, Turmas.descricao, Professores.nome AS Nome_Professor
FROM Alunos AS al
INNER JOIN Turmas ON al.turma_id = Turmas.turma_id
INNER JOIN Turma_Professor ON Turmas.turma_id = Turma_Professor.turma_id
INNER JOIN Professores ON Turma_Professor.professor_id = Professores.professor_id;

SELECT al.nome AS Nome_aluno, Turmas.turma_id, Turmas.descricao AS Nome_Matéria
FROM Alunos AS al
LEFT JOIN Turmas ON al.turma_id = Turmas.turma_id;

SELECT nome FROM alunos WHERE aluno_id = 1;
SELECT nome FROM alunos WHERE aluno_id = 3;

-- IN subconsulta, praticidade diferente do exemplo de cima
SELECT nome FROM alunos WHERE aluno_id IN (1, 3);

-- Selecionar duas turmar com base no ID

SELECT descricao FROM turmar WHERE turma_id IN (1, 2);

-- listar os alunos que não estão na turma de história.
SELECT * FROM alunos;
SELECT nome FROM alunos WHERE turma_id NOT IN (2);

-- Any -> Qualquer
-- Vamos listar os alunos que tem pelo menos 1 nota > 8

SELECT nome FROM alunos WHERE aluno_id = ANY(
	SELECT aluno_id
    FROM notas
    WHERE nota <= 8.0 AND turma_id = 2
);

-- EXISTS -> Existe
-- Vamos listar os professores que tem pelo menos uma turma associada
SELECT nome FROM professores AS p
WHERE EXISTS (
	SELECT 1
    FROM Turma_Professor AS tp
    WHERE tp.professor_id = p.professor_id
);

-- ALL -> TODOS
-- IN -> ENTRE
-- ANY -> QUALQUER
-- LISTE TODOS OS ALUNOS QUE ESTÃO NA TURMA DE HISTÓRIA (ID = 2)
-- E QUE A NOTA 8 SEJA MAIOR QUE TODAS AS NOTAS DADAS EM ATIVIDADES
-- DESSA TURMA

SELECT nome, Notas.nota FROM Alunos 
INNER JOIN Turmas WHERE turma_id IN(2)
INNER JOIN Notas ON Notas.aluno_id = Alunos.aluno_id;

SELECT nome FROM Alunos
WHERE turma_id IN (2);




SELECT nome FROM alunos WHERE aluno_id = ANY (
	SELECT aluno_id
    FROM notas
    WHERE atividade_id IN (
		SELECT atividade_id
        FROM atividadees 
        WHERE turma_id = 2 -- Todas as atividades da turma 2
    )
)
AND 8.0 > ALL (
	SELECT nota
    FROM Notas
    WHERE atividade_id IN (
		SELECT atividade_id
        FROM atividades
        WHERE turma_id = 2
    )
)
