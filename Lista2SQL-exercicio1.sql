CREATE TABLE Editora (
    IDEditora INT PRIMARY KEY,
    Nome VARCHAR(100)
);

CREATE TABLE Autor (
    IDAutor INT PRIMARY KEY,
    Nome VARCHAR(100)
);

CREATE TABLE Livro (
    ISBN VARCHAR(20) PRIMARY KEY,
    Titulo VARCHAR(100),
    AnoPublic INT,
    IDEditora INT,
    FOREIGN KEY (IDEditora) REFERENCES Editora(IDEditora)
);

CREATE TABLE LivroAutor (
    ISBN VARCHAR(20),
    IDAutor INT,
    PRIMARY KEY (ISBN, IDAutor),
    FOREIGN KEY (ISBN) REFERENCES Livro(ISBN),
    FOREIGN KEY (IDAutor) REFERENCES Autor(IDAutor)
);

INSERT INTO Editora (IDEditora, Nome) VALUES
(1, 'Editora A'),
(2, 'Editora B');

INSERT INTO Autor (IDAutor, Nome) VALUES
(1, 'Autor 1'),
(2, 'Autor 2'),
(3, 'Autor 3');

INSERT INTO Livro (ISBN, Titulo, AnoPublic, IDEditora) VALUES
('ISBN1', 'Livro 1', 2000, 1),
('ISBN2', 'Livro 2', 2010, 2),
('ISBN3', 'Livro 3', 2020, 1);

INSERT INTO LivroAutor (ISBN, IDAutor) VALUES
('ISBN1', 1),
('ISBN1', 2),
('ISBN2', 2),
('ISBN3', 1),
('ISBN3', 3);

SELECT Livro.Titulo, Autor.Nome
FROM Livro
INNER JOIN LivroAutor ON Livro.ISBN = LivroAutor.ISBN
INNER JOIN Autor ON LivroAutor.IDAutor = Autor.IDAutor;

SELECT Livro.Titulo
FROM Livro
INNER JOIN LivroAutor ON Livro.ISBN = LivroAutor.ISBN
INNER JOIN Autor ON LivroAutor.IDAutor = Autor.IDAutor
WHERE Autor.Nome = 'Nome do Autor';

SELECT Autor.Nome
FROM Autor
INNER JOIN LivroAutor ON Autor.IDAutor = LivroAutor.IDAutor
INNER JOIN Livro ON LivroAutor.ISBN = Livro.ISBN
WHERE Livro.Titulo = 'Título do Livro';

