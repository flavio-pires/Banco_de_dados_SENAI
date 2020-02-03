CREATE DATABASE OPTUS_manha;

USE OPTUS_manha;

CREATE TABLE Artistas (
	IdArtista INT PRIMARY KEY IDENTITY,
	Nome	  VARCHAR (200) NOT NULL
);

CREATE TABLE Estilos (
	IdEstilo INT PRIMARY KEY IDENTITY,
	Nome	 VARCHAR (200) NOT NULL
);

CREATE TABLE Albuns (
	IdAlbum			INT PRIMARY KEY IDENTITY,
	Nome			VARCHAR (200),
	DataLancamento  DATE,
	QtdMinutos		INT,
	Visualizacao	INT,

	IdArtista		INT FOREIGN KEY REFERENCES Artistas (IdArtista),
	IdEstilo		INT FOREIGN KEY REFERENCES Estilos (IdEstilo)
);

CREATE TABLE TiposUsuario (
	IdTipoUsuario	INT PRIMARY KEY IDENTITY,
	Titulo			VARCHAR (200),
);

CREATE TABLE Usuarios (
	IdUsuario		INT PRIMARY KEY IDENTITY,
	Nome			VARCHAR (200),

	IdTipoUsuario	INT FOREIGN KEY REFERENCES TiposUsuario (IdTipoUsuario)
);

ALTER TABLE Albuns
ADD IdEstilo		INT FOREIGN KEY REFERENCES Estilos (IdEstilo);

SELECT * FROM Artistas;
SELECT * FROM Estilos;
SELECT * FROM Albuns;
SELECT * FROM TiposUsuario;
SELECT * FROM Usuarios;

--INSERIR DADOS NA TABELA
INSERT INTO Artistas (Nome)
VALUES ('Racionais Mcs'),
	   ('Revela��o'),
	   ('Natiruts'),
	   ('Parangole'),
	   ('Iron Maiden');

INSERT INTO Estilos (Nome)
VALUES ('Reggae'),
	   ('Rap'),
	   ('Ax�'),
	   ('Rock'),
	   ('Pagode');

INSERT INTO Albuns (Nome, DataLancamento, QtdMinutos, Visualizacao, IdArtista, IdEstilo)
VALUES ('The Book of Souls', '12-04-2015', 92, 38740, 5, 4),
	   ('Open Bar', '03-11-2018', 83, 23745, 4, 3),
	   ('Natiruts Reggae Brasil', '05-07-2015', 85, 30468, 3, 1),
	   ('Nada como um dia ap�s o outro dia', '15-12-2002', 110, 12864930, 1, 2),
	   ('Ao vivo no Morro', '25-04-2009', 97, 86432, 2, 5);

INSERT INTO TiposUsuario (Titulo)
VALUES ('Administrador'),
	   ('Comum'),
	   ('Premium'),
	   ('VIP'),
	   ('Platinum');

INSERT INTO Usuarios (Nome, IdTipoUsuario)
VALUES ('Flavio',1),
	   ('Henrique',2),
	   ('Lucas',3),
	   ('Matheus',4),
	   ('Alexandre',5);

--alterar nome de um artista
UPDATE Artistas
SET Nome = 'Poesia Ac�stica'
WHERE IdArtista = 1;

--alterar um tipo de usuario
UPDATE TiposUsuario
SET Titulo = 'Ouro'
WHERE IdTipoUsuario = 5;

--Alterar a Quantidade de visualiza��o de um �lbum
UPDATE Albuns
SET Visualizacao = 125000
WHERE IdAlbum = 3;

--apagar album
DELETE Albuns
WHERE IdAlbum = 2;

--selecionar albuns do mesmo artista
SELECT * FROM Albuns WHERE IdArtista = 1;

--selecionar os albuns lan�ados na mesma data
SELECT * FROM Albuns WHERE DataLancamento = '05-07-2015';

--selecionar os artistas do mesmo estilo musical
SELECT * FROM Albuns WHERE IdEstilo = 5;

--selecionar albuns e artistas e ordenar a data de lan�amento das mais recentes para o mais antigo
SELECT Nome, IdArtista, DataLancamento FROM Albuns
ORDER BY DataLancamento DESC;

====================================================================================

--seleciona somente a coluna nome 
SELECT Nome FROM Artistas 

--localicar na tabela um item espec�fico
SELECT * FROM Albuns WHERE IdAlbum = 1;

SELECT * FROM Albuns WHERE IdAlbum > 1;

--OR OU
SELECT Nome, QtdMinutos FROM Albuns
WHERE (DataLancamento IS NULL) or (Visualizacao IS NULL);

--Filtro de texto
SELECT IdArtista, Nome FROM Artistas
WHERE Nome LIKE 'Revela��o%'; --porcentagem serve para procurar a palavra que esteja no come�o da frase

--Ordena��o
SELECT IdAlbum, Nome, Visualizacao FROM Albuns
ORDER BY QtdMinutos;

--Ordena��o DECRESCENTE
SELECT IdAlbum, Nome, Visualizacao FROM Albuns
ORDER BY QtdMinutos DESC;

--count
SELECT COUNT (IdAlbum) FROM Albuns;

==========================================================

-- INNER JOIN = mesclar informa��es das tabelas / ON serve para indicar qual coluna eu quero relacionar
SELECT * FROM Artistas INNER JOIN Albuns ON Artistas.IdArtista = Albuns.IdArtista
WHERE Albuns.IdArtista = 2; --seleciona albuns do mesmo artista
GO --serve para pausar a execu��o dos blocos

--INNER JOIN
SELECT Artistas.Nome AS NomeArtista, Albuns.Nome AS NomeAlbum, Albuns.DataLancamento FROM Artistas INNER JOIN Albuns ON Artistas.IdArtista = Albuns.IdArtista
WHERE DataLancamento = '05-07-2015';

--SELECIONAR ALBUNS E ARTISTAS E ORDENAR POR DATA DE LANCAMENTO COM INNER JOIN
SELECT * FROM Albuns INNER JOIN Artistas ON Albuns.IdArtista = Artistas.IdArtista
ORDER BY DataLancamento DESC;

--SELECIONAR OS ARTISTAS DO MESMO ESTILO MUSICAL, MOSTRANDO O NOME DELES
SELECT Albuns.Nome as NomeAlbuns, Artistas.Nome as NomeArtistas, Estilos.Nome as NomeEstilos, Estilos.IdEstilo, DataLancamento FROM Albuns 
INNER JOIN Artistas ON Albuns.IdArtista = Artistas.IdArtista
INNER JOIN Estilos ON Albuns.IdEstilo = Estilos.IdEstilo
WHERE Estilos.IdEstilo = 2;

INSERT INTO Artistas (Nome)
VALUES ('Racionais MCs')

INSERT INTO Albuns (Nome, DataLancamento, QtdMinutos, Visualizacao, IdArtista, IdEstilo)
VALUES ('Nada como um dia ap�s o outro dia', '15-12-2002', 110, 12864930, 6, 2)

UPDATE Albuns
SET Nome = 'C�u Azul'
WHERE IdAlbum = 4;