CREATE DATABASE EstiloMusical;

USE EstiloMusical;

CREATE TABLE EstilosMusicais (
	IdEstiloMusical INT PRIMARY KEY IDENTITY,
	Nome			VARCHAR (200) NOT NULL
);

CREATE TABLE Artistas (
	IdArtista INT PRIMARY KEY IDENTITY,
	Nome	  VARCHAR (200) NOT NULL,

	IdEstiloMusical INT FOREIGN KEY REFERENCES EstilosMusicais (IdEstiloMusical)
);


SELECT * FROM EstilosMusicais;
SELECT * FROM Artistas;


-- adicionar nova coluna
ALTER TABLE EstilosMusicais
ADD Descricao VARCHAR (200);

-- DML LINGUAGEM DE MANIPULACAO DE DADOS

-- COMANDO DE INSERIR DADOS

INSERT INTO EstilosMusicais (Nome, Descricao)
VALUES ('SAMBA','Musica Raiz'),
	   ('FUNK','Musica Popular da Periferia'),
	   ('Rap','Música de expressão da sociedade');

-- ADICIONAR DADOS NA TABELA COM CHAVE ESTRANGEIRA
INSERT INTO Artistas (Nome,IdEstiloMusical)
VALUES ('ZECA PAGODINHO',1),
	   ('FUNDO DE QUINTAL',2),
	   ('MC WM',3),
	   ('RACIONAIS MCS',4);

-- UPDATE ALTERAR DADOS DENTRO DA TABELA
UPDATE Artistas
SET Nome = 'CONECREW'
WHERE IdArtista = 8;

UPDATE Artistas
SET IdEstiloMusical = 3
WHERE IdArtista = 3;

-- DELETAR DADOS DA TABELA
DELETE FROM Artistas
WHERE IdArtista = 8;

-- APAGAR TODOS OS DADOS DA TABELA
TRUNCATE TABLE Artistas
