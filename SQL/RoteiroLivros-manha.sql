-- comando para criar banco de dados
-- DDL Linguagem de DEFINICAO de dados
CREATE DATABASE RoteiroLivros;

USE RoteiroLivros;

-- comando para criar tabela
CREATE TABLE Generos (
	IdGenero INT PRIMARY KEY IDENTITY, -- auto incremento, para que seja sequencial
	Nome	 VARCHAR(200) NOT NULL -- para que o campo nunca fique sem nenhuma informação
);

CREATE TABLE Autores (
	IdAutor INT PRIMARY KEY IDENTITY,
	NomeAutor VARCHAR (200) NOT NULL
);

CREATE TABLE Livros (
	IdLivro INT PRIMARY KEY IDENTITY,
	Titulo VARCHAR (255),
	-- as chaves estrangeiras devem aparecer por último na tabela
	IdGenero INT FOREIGN KEY REFERENCES Generos (IdGenero),
	IdAutor  INT FOREIGN KEY REFERENCES Autores (IdAutor)
);

-- ALTERACAO ADICIONAR COLUNA NOVA
ALTER TABLE Artistas
ADD DataNascimento DATE;

-- ALTERACAO PARA MODIFICAR O TIPO DO ATRIBUTO
ALTER TABLE Artistas
ALTER COLUMN NomeArtista CHAR;

-- APAGAR COLUNA
ALTER TABLE Artistas
DROP COLUMN NomeArtista;

-- APAGAR TABELA
DROP TABLE Artistas;

-- APAGAR BANCO
DROP DATABASE EstiloMusical;

--comando para selecionar todos os dados da tabela, usado para visualização / comando DQL - consulta
SELECT * FROM Autores;
SELECT * FROM Generos;
SELECT * FROM Livros;

--INSERIR DADOS NA TABELA
INSERT INTO Generos (Nome)
VALUES ('EDUCAÇÃO'),
	   ('ESTRATÉGIA'),
	   ('FICÇÃO'),
	   ('ROMANCE'),
	   ('BIOGRAFIA');

INSERT INTO Autores (NomeAutor)
VALUES ('Robert C. Martin'),
	   ('Sun Tzu'),
	   ('Bram Stoker'),
	   ('Miguel de Cervantes'),
	   ('Walter Isaacson');

INSERT INTO Livros (Titulo, IdGenero, IdAutor)
VALUES ('Steve Jobs',5,5),
	   ('Dom Quixote',4,4),
	   ('A Arte da Guerra',2,2),
	   ('Drácula',3,3),
	   ('Código Limpo',1,1);

UPDATE Generos
SET Nome = 'Suspense'
WHERE IdGenero = 4;

UPDATE Livros
SET IdGenero = 2
WHERE IdLivro = 5;

DELETE FROM Livros
WHERE IdLivro = 5;

DELETE FROM Autores
WHERE IdAutor = 1;
