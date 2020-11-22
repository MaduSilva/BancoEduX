/* 
DML - Data Manipulation Language
*/
USE EduX;

-- Inserindo valores a tabela Instituicao
INSERT INTO Instituicao (IdInstituicao ,Nome, Logradouro, Numero, Bairro, Cidade, Complemento, CEP, UF) VALUES
	(NEWID(), 'SENAI de Informatica', 'Alameda Barão de Limeira', '539', 'Santa Cecilia', 'São Paulo', '', '01202001', 'SP');

-- Inserindo valores a tabela Curso
INSERT INTO Curso (IdCurso, Titulo, IdInstituicao) VALUES
	(NEWID(),'Multímidia', '8D4B9D7D-5655-438C-A9A8-3E78D1C1A5DB')
	
-- Inserindo valores a tabela Turma
INSERT INTO Turma (IdTurma, Descricao, IdCurso) VALUES
	(NEWID(), '2S2020S3', '2D7B901F-DD0A-4AD3-9CF7-13FBB4B8B100');

-- Inserindo valores a tabela Categoria
INSERT INTO Categoria (IdCategoria, Tipo) VALUES
	(NEWID(), 'Critico'),
	(NEWID(), 'Desejavel'),
	(NEWID(), 'Oculto');

-- Inserindo valores a tabela Objetivo
INSERT INTO Objetivo (IdObjetivo, Descricao, IdCategoria) VALUES
	(NEWID(), 'Identificar as características de banco de dados relacionais e não-relacionais', '3F67FE43-59E0-4B7D-84F1-AF1F5AA184E9');

-- Inserindo valores a tabela Perfil
INSERT INTO Perfil (IdPerfil, Permissao) VALUES
	(NEWID(), 'Admin'),
	(NEWID(), 'Padrao');
	
-- Inserindo valores a tabela Usuario
-- Criando Usuario Admin
INSERT INTO Usuario (IdUsuario, Nome, Email, Senha, Pontuacao, DataCadastro, DataUltimoAcesso, IdPerfil) VALUES
    (NEWID(), 'Gustavo Carvalho', 'Gustavo@Email.com', '19042003', '100', GETDATE(), GETDATE(), 'BB4B7577-C59F-4F92-ABAC-59BE6076C4BA');

-- Criando Usuario Padrao
INSERT INTO Usuario (IdUsuario, Nome, Email, Senha, Pontuacao, DataCadastro, DataUltimoAcesso, IdPerfil) VALUES
    (NEWID(), 'Maria Eduarda', 'Maria@Email.com', '19042003', '80', GETDATE(), GETDATE(), '9611524C-7422-4FBE-8B7A-42AD37FA9E7D');


-- Inserindo valores a tabela AlunoTurma
INSERT INTO AlunoTurma (IdAlunoTurma, Matricula, IdUsuario, IdTurma) VALUES
	(NEWID(), '48941897', 'E4D3AA70-2974-4295-B1D7-AACC68F7AD73', 'ECB8B8FE-49E0-42C3-856E-53F200BEAF8D');

-- Inserindo valores a tabela ObjetivoAluno
INSERT INTO ObjetivoAluno(IdObjetivoAluno, Nota, DataAlcancado, IdAlunoTurma, IdObjetivo)
VALUES (NEWID(),'100', GETDATE(), '84193C70-0F1D-4B12-999F-81108C2FEC71', '8FEE7967-267B-4FF4-AA77-5F7602BA09D2');

-- Inserindo valores a tabela ProfessorTurma
INSERT INTO ProfessorTurma (IdProfessorUsuario ,Descricao, IdUsuario, IdTurma) VALUES
	(NEWID(),'Professor responsável pela turma A', 'BEE78295-A683-43BF-BC9E-2F8A69C53603', 'ECB8B8FE-49E0-42C3-856E-53F200BEAF8D');

-- Inserindo valores a tabela Dica
INSERT INTO Dica(IdDica, Titulo, Texto, Imagem, IdUsuario)
VALUES (NEWID(),'Titulo da Dica', 'Texto da Dica', 'DicaImagem.png', 'E4D3AA70-2974-4295-B1D7-AACC68F7AD73');

-- Inserindo valores a tabela Curtida
INSERT INTO Curtida(IdCurtida, Numero)
VALUES (NEWID(), '');


-- Inserindo valores a tabela Postagem
INSERT INTO Postagem(IdPostagem, Titulo, Texto, Imagem, IdUsuario, IdCurtida)
VALUES (NEWID(), 'Titulo da Postagem','Texto da Postagem', 'PostagemImagem.png', 'E4D3AA70-2974-4295-B1D7-AACC68F7AD73', '46E610CF-BD83-4604-84DF-A632993E8099');

INSERT INTO Ranking(IdRanking, Posicao, QuantidadeTotal, Descricao, IdUsuario)
VALUES (NEWID(), '3', '', 'Descrição do Ranking', 'E4D3AA70-2974-4295-B1D7-AACC68F7AD73')

