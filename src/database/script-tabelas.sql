-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/*
comandos para mysql server
*/

CREATE DATABASE hydrogen;
USE hydrogen;

CREATE TABLE usuario(
idUsuario INT PRIMARY KEY AUTO_INCREMENT,
conhecimento TINYINT,
email VARCHAR(100),
senha VARCHAR(100),
dtRegistro DATETIME DEFAULT CURRENT_TIMESTAMP);

CREATE TABLE pontuacao(
idPontuacao INT AUTO_INCREMENT,
fkUsuario INT,
CONSTRAINT fkDep PRIMARY KEY (idPontuacao, fkUsuario),
CONSTRAINT fk_Usuario FOREIGN KEY (fkUsuario) REFERENCES usuario(idUsuario),
pontos INT,
dtPontuacao DATETIME DEFAULT CURRENT_TIMESTAMP);

CREATE TABLE dadosHidrogenio(
idDados INT PRIMARY KEY AUTO_INCREMENT,
preco INT,
autonomia INT,
dtDados DATETIME DEFAULT CURRENT_TIMESTAMP);

INSERT INTO usuario VALUES
(1, 1, 'usuario123@usuario.com', 'usuario123', DEFAULT);

INSERT INTO pontuacao VALUES
(1, 1, 50, DEFAULT);

INSERT INTO dadosHidrogenio VALUES
(1, 6.20, 1200, DEFAULT);

SELECT * from dadosHidrogenio;