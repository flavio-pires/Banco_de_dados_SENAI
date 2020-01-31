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
	   ('Revelação'),
	   ('Natiruts'),
	   ('Parangole'),
	   ('Iron Maiden');

INSERT INTO Estilos (Nome)
VALUES ('Reggae'),
	   ('Rap'),
	   ('Axé'),
	   ('Rock'),
	   ('Pagode');

INSERT INTO Albuns (Nome, DataLancamento, QtdMinutos, Visualizacao, IdArtista, IdEstilo)
VALUES ('The Book of Souls', '12-04-2015', 92, 38740, 5, 4),
	   ('Open Bar', '03-11-2018', 83, 23745, 4, 3),
	   ('Natiruts Reggae Brasil', '05-07-2015', 85, 30468, 3, 1),
	   ('Nada como um dia após o outro dia', '15-12-2002', 110, 12864930, 1, 2),
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
SET Nome = 'Poesia Acústica'
WHERE IdArtista = 1;

--alterar um tipo de usuario
UPDATE TiposUsuario
SET Titulo = 'Ouro'
WHERE IdTipoUsuario = 5;

--Alterar a Quantidade de visualização de um Álbum
UPDATE Albuns
SET Visualizacao = 125000
WHERE IdAlbum = 3;

--apagar album
DELETE Albuns
WHERE IdAlbum = 2;

--selecionar albuns do mesmo artista
SELECT * FROM Albuns WHERE IdArtista = 1;

--selecionar os albuns lançados na mesma data
SELECT * FROM Albuns WHERE DataLancamento = '05-07-2015';

--selecionar os artistas do mesmo estilo musical
SELECT * FROM Albuns WHERE IdEstilo = 5;

--selecionar albuns e artistas e ordenar a data de lançamento das mais recentes para o mais antigo
SELECT Nome, IdArtista, DataLancamento FROM Albuns
ORDER BY DataLancamento DESC;




