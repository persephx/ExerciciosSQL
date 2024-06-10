CREATE TABLE Paciente (
    ID_Paciente INT PRIMARY KEY,
    Nome VARCHAR(100),
    Data_Nascimento DATE
);

CREATE TABLE Médico (
    ID_Médico INT PRIMARY KEY,
    Nome VARCHAR(100),
    Especialização VARCHAR(100)
);

CREATE TABLE Registro_Médico (
    ID_Registro INT PRIMARY KEY,
    ID_Paciente INT,
    ID_Médico INT,
    Detalhes TEXT,
    FOREIGN KEY (ID_Paciente) REFERENCES Paciente(ID_Paciente),
    FOREIGN KEY (ID_Médico) REFERENCES Médico(ID_Médico)
);

-- Exemplo de dados de pacientes
INSERT INTO Paciente (ID_Paciente, Nome, Data_Nascimento)
VALUES
    (1, 'João', '1990-05-15'),
    (2, 'Maria', '1985-09-20'),
    (3, 'Pedro', '1978-03-10');

-- Exemplo de dados de médicos
INSERT INTO médico (ID_Médico, Nome, Especialização)
VALUES
    (101, 'Dr. Silva', 'Cardiologia'),
    (102, 'Dra. Souza', 'Ortopedia'),
    (103, 'Dr. Santos', 'Pediatria');

-- Exemplo de registros médicos
INSERT INTO Registro_Médico (ID_Registro, ID_Paciente, ID_Médico, Detalhes)
VALUES
    (1, 1, 101, 'Check-up anual'),
    (2, 2, 102, 'Consulta por lesão no joelho'),
    (3, 1, 103, 'Vacinação infantil');

SELECT Paciente.*
FROM Paciente
INNER JOIN Registro_Médico ON Paciente.ID_Paciente = Registro_Médico.ID_Paciente
INNER JOIN Médico ON Registro_Médico.ID_Médico = Médico.ID_Médico
WHERE Médico.Nome = 'Dr. Silva';

SELECT Médico.*
FROM Médico
INNER JOIN Registro_Médico ON Médico.ID_Médico = Registro_Médico.ID_Médico
INNER JOIN Paciente ON Registro_Médico.ID_Paciente = Paciente.ID_Paciente
WHERE Paciente.Nome = 'João';

SELECT AVG(cnt) AS Avg_Pacientes_Por_Médico
FROM (
    SELECT COUNT(ID_Paciente) AS cnt
    FROM Registro_Médico
    GROUP BY ID_Médico
) AS subquery;

