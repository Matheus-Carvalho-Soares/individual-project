-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/*
comandos para mysql server
*/

CREATE DATABASE Matherraria;
USE Matherraria;

CREATE TABLE usuario(
idUsuario INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100),
genero VARCHAR(9),
email VARCHAR(100) UNIQUE,
senha VARCHAR(100),
dtRegistro DATETIME DEFAULT CURRENT_TIMESTAMP);

CREATE TABLE personalidade(
idClasse INT PRIMARY KEY AUTO_INCREMENT,
classe VARCHAR(10));

CREATE TABLE res_quiz(
id INT PRIMARY KEY AUTO_INCREMENT,
fkUsuario INT UNIQUE AUTO_INCREMENT,
fkPersonalidade INT,
CONSTRAINT fk_usuario FOREIGN KEY (fkUsuario) REFERENCES usuario(idUsuario),
CONSTRAINT fk_classe FOREIGN KEY (fkPersonalidade) REFERENCES personalidade(idClasse),
dtRegistro DATETIME DEFAULT CURRENT_TIMESTAMP);

INSERT INTO personalidade (classe) VALUES
('Summoner'),
('Ranged'),
('Melee'),
('Mago');

select * from res_quiz;
select * from usuario;

select u.idUsuario, u.nome, p.classe, r.dtRegistro FROM usuario u
JOIN res_quiz r ON r.fkUsuario = u.idUsuario
JOIN personalidade p ON p.idClasse = r.fkPersonalide; 

