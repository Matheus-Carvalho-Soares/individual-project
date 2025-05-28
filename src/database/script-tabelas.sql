-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/*
comandos para mysql server
*/
DROP DATABASE Matherraria;
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
fkUsuario INT UNIQUE,
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


select count(fkUsuario) from res_quiz;

select count(idUsuario) from usuario where idUsuario NOT IN (select fkUsuario from res_quiz); 

select count(fkUsuario) as FezQuiz, (select count(idUsuario) from usuario)-(count(fkUsuario)) as 'Diferença' from res_quiz;

select count(fkUsuario) Fezquiz, t.Total - count(fkUsuario) as Diferença from (select count(idUsuario) as Total from usuario) as t join res_quiz;