CREATE DATABASE Locadora_manha;

USE Locadora_manha;

CREATE TABLE Empresa (
	IdEmpresa INT PRIMARY KEY IDENTITY,
	Nome VARCHAR (200) NOT NULL
);
GO

CREATE TABLE Cliente (
	IdCliente INT PRIMARY KEY IDENTITY,
	Nome VARCHAR (200) NOT NULL,
	CPF  INT
);
GO

CREATE TABLE Marca (
	IdMarca INT PRIMARY KEY IDENTITY,
	Nome	VARCHAR (200)
);
GO

CREATE TABLE Modelo (
	IdModelo INT PRIMARY KEY IDENTITY,
	Nome	 VARCHAR (200),

	IdMarca  INT FOREIGN KEY REFERENCES Marca (IdMarca)
);
GO

CREATE TABLE Veiculo (
	IdVeiculo  INT PRIMARY KEY IDENTITY,
	Placa	   VARCHAR (8),

	IdEmpresa INT FOREIGN KEY REFERENCES Empresa (IDEmpresa),
	IdModelo  INT FOREIGN KEY REFERENCES Modelo (IdModelo)
);
GO

CREATE TABLE Aluguel (
	IdAluguel  INT PRIMARY KEY IDENTITY,
	DataInicio DATE,
	DataFim	   DATE,

	IdCliente  INT FOREIGN KEY REFERENCES Cliente (IdCliente),
	IdVeiculo  INT FOREIGN KEY REFERENCES Veiculo (IdVeiculo)
);
GO

ALTER TABLE Cliente
ALTER COLUMN CPF VARCHAR(50);

INSERT INTO Empresa (Nome)
VALUES ('Unidas'),
	   ('Localiza');

INSERT INTO Cliente (Nome, CPF)
VALUES ('Fernando', '23324442444'),
	   ('Helena', '32434554333');

INSERT INTO Marca (Nome)
VALUES ('Ford'),
	   ('GM'),
	   ('Fiat');

INSERT INTO Modelo (Nome, IdMarca)
VALUES ('Fiesta', 1),
	   ('Onix', 2),
	   ('Argo', 3);

INSERT INTO Veiculo (Placa, IdEmpresa, IdModelo)
VALUES ('HEL1805', 1, 1),
	   ('FER1010', 1, 2),
	   ('POR1978', 2, 3),
	   ('LEM9876', 2, 1);

INSERT INTO Aluguel (DataInicio, DataFim, IdCliente, IdVeiculo)
VALUES ('19/01/2019', '20/01/2019', 5, 1),
	   ('20/01/2019', '21/01/2019', 5, 2),
	   ('21/01/2019', '21/01/2019', 6, 3),
	   ('22/01/2019', '22/01/2019', 6, 2);


SELECT * FROM Empresa;
SELECT * FROM Cliente;
SELECT * FROM Marca;
SELECT * FROM Modelo;
SELECT * FROM Veiculo;
SELECT * FROM Aluguel;