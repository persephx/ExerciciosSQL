-- Criando as tabelas
CREATE TABLE Projeto (
    id_projeto INT PRIMARY KEY,
    nome VARCHAR(100),
    descricao TEXT
);

CREATE TABLE Funcionario (
    id_funcionario INT PRIMARY KEY,
    nome VARCHAR(100),
    data_admissao DATE
);

CREATE TABLE AssociaçãoProjetoFuncionario (
    id_projeto INT,
    id_funcionario INT,
    PRIMARY KEY (id_projeto, id_funcionario),
    FOREIGN KEY (id_projeto) REFERENCES Projeto(id_projeto),
    FOREIGN KEY (id_funcionario) REFERENCES Funcionario(id_funcionario)
);

-- Populando as tabelas com dados de exemplo
INSERT INTO Projeto (id_projeto, nome, descricao) VALUES
(1, 'Projeto A', 'Descrição do Projeto A'),
(2, 'Projeto B', 'Descrição do Projeto B'),
(3, 'Projeto C', 'Descrição do Projeto C');

INSERT INTO Funcionario (id_funcionario, nome, data_admissao) VALUES
(1, 'Funcionário 1', '2020-01-15'),
(2, 'Funcionário 2', '2019-05-20'),
(3, 'Funcionário 3', '2021-03-10'),
(4, 'Funcionário 4', '2018-11-25');

INSERT INTO AssociaçãoProjetoFuncionario (id_projeto, id_funcionario) VALUES
(1, 1),
(1, 2),
(2, 2),
(2, 3),
(3, 1),
(3, 3),
(3, 4);

SELECT Funcionario.*
FROM Funcionario
INNER JOIN AssociaçãoProjetoFuncionario ON Funcionario.id_funcionario = AssociaçãoProjetoFuncionario.id_funcionario
WHERE AssociaçãoProjetoFuncionario.id_projeto = '1';

SELECT Projeto.*
FROM Projeto
INNER JOIN AssociaçãoProjetoFuncionario ON Projeto.id_projeto = AssociaçãoProjetoFuncionario.id_projeto
WHERE AssociaçãoProjetoFuncionario.id_funcionario = '2';

SELECT AVG(cnt) AS media_funcionarios_por_projeto
FROM (
    SELECT COUNT(id_funcionario) AS cnt
    FROM AssociaçãoProjetoFuncionario
    GROUP BY id_projeto
) AS subquery;

