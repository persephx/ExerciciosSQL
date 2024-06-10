-- Criação das tabelas
CREATE TABLE Escola (
    id_escola INT PRIMARY KEY,
    nome VARCHAR(50)
);

CREATE TABLE Turma (
    id_turma INT PRIMARY KEY,
    id_professor INT,
    id_escola INT,
    FOREIGN KEY (id_professor) REFERENCES Professor(id_professor),
    FOREIGN KEY (id_escola) REFERENCES Escola(id_escola)
);

CREATE TABLE Aluno (
    id_aluno INT PRIMARY KEY,
    nome VARCHAR(50),
    data_nasc DATE
);

CREATE TABLE Professor (
    id_professor INT PRIMARY KEY,
    nome VARCHAR(50)
);

CREATE TABLE Curso (
    id_curso INT PRIMARY KEY,
    nome VARCHAR(50)
);

-- Tabelas de associação
CREATE TABLE Turma_Aluno (
    id_turma INT,
    id_aluno INT,
    PRIMARY KEY (id_turma, id_aluno),
    FOREIGN KEY (id_turma) REFERENCES Turma(id_turma),
    FOREIGN KEY (id_aluno) REFERENCES Aluno(id_aluno)
);

CREATE TABLE Turma_Curso (
    id_turma INT,
    id_curso INT,
    PRIMARY KEY (id_turma, id_curso),
    FOREIGN KEY (id_turma) REFERENCES Turma(id_turma),
    FOREIGN KEY (id_curso) REFERENCES Curso(id_curso)
);

-- Populando as tabelas com dados de exemplo
INSERT INTO Escola (id_escola, nome) VALUES (1, 'Escola A');

INSERT INTO Professor (id_professor, nome) VALUES (1, 'Professor A'), (2, 'Professor B');

INSERT INTO Turma (id_turma, id_professor, id_escola) VALUES (1, 1, 1), (2, 2, 1);

INSERT INTO Aluno (id_aluno, nome, data_nasc) VALUES
(1, 'Aluno 1', '2000-01-01'),
(2, 'Aluno 2', '2001-02-02'),
(3, 'Aluno 3', '2002-03-03');

INSERT INTO Curso (id_curso, nome) VALUES (1, 'Matemática'), (2, 'História');

INSERT INTO Turma_Aluno (id_turma, id_aluno) VALUES
(1, 1), (1, 2),
(2, 2), (2, 3);

INSERT INTO Turma_Curso (id_turma, id_curso) VALUES
(1, 1), (1, 2),
(2, 2);

SELECT Aluno.*
FROM Aluno
JOIN Turma_Aluno ON Aluno.id_aluno = Turma_Aluno.id_aluno
WHERE Turma_Aluno.id_turma = 1;

SELECT Curso.*
FROM Curso
JOIN Turma_Curso ON Curso.id_curso = Turma_Curso.id_curso
WHERE Turma_Curso.id_turma = 1;

SELECT id_turma, COUNT(*) AS numero_alunos
FROM Turma_Aluno
GROUP BY id_turma;

