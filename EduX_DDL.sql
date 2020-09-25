/*
	DDL - Data Definition Language
*/
--Criando DATABASE

CREATE DATABASE EduX;

USE EduX;

--Criando as tabelas DDL

CREATE TABLE Instituicao(
	IdInstituicao UNIQUEIDENTIFIER PRIMARY KEY  NOT NULL DEFAULT NEWID(),
	Nome          VARCHAR(255)NOT NULL,
	Logradouro    VARCHAR(255)NOT NULL,
	Numero        VARCHAR(255),
	Bairro        VARCHAR(255),
	Cidade		  VARCHAR(255),
	Complemento   VARCHAR(255),
	CEP           VARCHAR(15)NOT NULL,
	UF            VARCHAR(2)
);

CREATE TABLE Curso(
	IdCurso  UNIQUEIDENTIFIER PRIMARY KEY NOT NULL DEFAULT NEWID(),
	Titulo     VARCHAR(255),
	--Fk
	IdInstituicao  UNIQUEIDENTIFIER FOREIGN KEY REFERENCES Instituicao (IdInstituicao)
);


CREATE TABLE Perfil (
	IdPerfil UNIQUEIDENTIFIER PRIMARY KEY NOT NULL DEFAULT NEWID(),
	Permissao        VARCHAR(50)
);

CREATE TABLE Categoria (
	IdCategoria UNIQUEIDENTIFIER  PRIMARY KEY NOT NULL DEFAULT NEWID(),
	Tipo        VARCHAR(255)
);

CREATE TABLE Objetivo(
	IdObjetivo UNIQUEIDENTIFIER  PRIMARY KEY NOT NULL DEFAULT NEWID(),
	Descricao  VARCHAR(255),
	--Fk
	IdCategoria UNIQUEIDENTIFIER  FOREIGN KEY REFERENCES Categoria        (IdCategoria),
);

CREATE TABLE Turma(
	IdTurma UNIQUEIDENTIFIER  PRIMARY KEY NOT NULL DEFAULT NEWID(),
	Descricao    VARCHAR(255),
	--Fk
	IdCurso            UNIQUEIDENTIFIER  FOREIGN KEY REFERENCES Curso (IdCurso)
);

CREATE TABLE Usuario(
	IdUsuario UNIQUEIDENTIFIER  PRIMARY KEY NOT NULL DEFAULT NEWID(),
	Nome     VARCHAR(255),
	Email    VARCHAR(100),
	Senha    VARCHAR(255),
	DataCadastro DATETIME,
	DataUltimoAcesso DATETIME,

	--Fk
	IdPerfil  UNIQUEIDENTIFIER  FOREIGN KEY REFERENCES Perfil (IdPerfil)
);

CREATE TABLE AlunoTurma(
	IdAlunoTurma UNIQUEIDENTIFIER  PRIMARY KEY NOT NULL DEFAULT NEWID(),
	Matricula  VARCHAR(50),

	--Fk
	IdTurma    UNIQUEIDENTIFIER  FOREIGN KEY REFERENCES Turma (IdTurma),
	IdUsuario  UNIQUEIDENTIFIER  FOREIGN KEY REFERENCES Usuario (IdUsuario),
);

CREATE TABLE ObjetivoAluno(
	IdObjetivoAluno UNIQUEIDENTIFIER  PRIMARY KEY NOT NULL DEFAULT NEWID(),
	Nota DECIMAL(10,2) DEFAULT NULL,
	DataAlcancado DATETIME,
	--Fk
	IdAlunoTurma  UNIQUEIDENTIFIER  FOREIGN KEY REFERENCES AlunoTurma (IdAlunoTurma),
	IdObjetivo		UNIQUEIDENTIFIER  FOREIGN KEY REFERENCES Objetivo (IdObjetivo)
);

CREATE TABLE ProfessorTurma(
	IdProfessorUsuario UNIQUEIDENTIFIER  PRIMARY KEY NOT NULL DEFAULT NEWID(),
	Descricao    VARCHAR(255),
	--Fk
	IdUsuario  UNIQUEIDENTIFIER  FOREIGN KEY REFERENCES Usuario (IdUsuario),
	IdTurma    UNIQUEIDENTIFIER  FOREIGN KEY REFERENCES Turma (IdTurma),
);

CREATE TABLE Dica(
	IdDica UNIQUEIDENTIFIER  PRIMARY KEY NOT NULL DEFAULT NEWID(),
	Texto  VARCHAR(255),
	Imagem  VARCHAR(255),

	--Fk
	IdUsuario  UNIQUEIDENTIFIER  FOREIGN KEY REFERENCES Usuario (IdUsuario),
);

CREATE TABLE Curtida(
	IdCurtida UNIQUEIDENTIFIER  PRIMARY KEY NOT NULL DEFAULT NEWID(),

	--Fk
	IdUsuario  UNIQUEIDENTIFIER  FOREIGN KEY REFERENCES Usuario (IdUsuario),
	IdDica  UNIQUEIDENTIFIER  FOREIGN KEY REFERENCES Dica (IdDica)
);