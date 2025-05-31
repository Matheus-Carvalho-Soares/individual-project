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
nome VARCHAR(100) not null,
genero VARCHAR(9) not null,
email VARCHAR(100) UNIQUE not null,
senha VARCHAR(100) not null,
dtRegistro DATETIME DEFAULT CURRENT_TIMESTAMP);

INSERT INTO usuario (nome, genero, email, senha) VALUES
('Matheuszinho', 'Feminino', 'Teteu@gmail.com', 'Teteu123.'),
('Fuzimoto', 'Masculino', 'Rnofuzil@gmail.com', 'Erick123.'),
('Vini Fusca', 'Masculino', 'fuscaopreto@gmail.com', 'Vinisilva123.'),
('Marilia Boss', 'Feminino', 'Chefa@gmail.com', 'Marilia123.'),
('Rodrigao Sojas', 'Feminino', 'ReiDaSoja@gmail.com', 'Rodrigao123.');

CREATE TABLE personalidade(
idClasse INT PRIMARY KEY AUTO_INCREMENT,
classe VARCHAR(10) not null,
descricao VARCHAR(500));

INSERT INTO personalidade (classe, descricao) VALUES
('Summoner', 'Você não gosta de tomar riscos, e por isso prefere uma classe mais consistente, que depende apenas de você, sua habilidade de desviar e suas invocações te obedecerem. É uma classe com uma defesa pequena, mas em compensação, suas invocações causam um dano excepcional, que acaba equilibrando.'),
('Ranged', 'Você prefere a consistência de dano junto de uma defesa razoavel ao invés de um dano mais explosivo sem defesa nenhum. Com ataques a distância e mais estratégicos, é possível notar que toda sua jogatina se baseia mais no pensamento do que na impulsividade.'),
('Melee','Você gosta de uma zona de conforto, onde alguns ataques não vão te fazer tão mal, com uma gama diversificada de formas de atacar seu inimigo. O dano não é sua prioridade, e sim a sobrevivência ao longo da batalha, não importa o tempo que levar, a vitória é garantida.'),
('Mago', 'Você valoriza o poder bruto e a versatilidade, mesmo que isso signifique ter que lidar com uma defesa frágil. Seus feitiços poderosos e variados são capazes de mudar o rumo de uma batalha em instantes. Sua jogabilidade exige atenção e planejamento, pois um erro pode ser fatal — mas o acerto certo pode ser devastador.');

CREATE TABLE res_quiz(
id INT AUTO_INCREMENT,
fkUsuario INT UNIQUE not null,
fkPersonalidade INT not null,
CONSTRAINT fk_usuario FOREIGN KEY (fkUsuario) REFERENCES usuario(idUsuario),
CONSTRAINT fk_classe FOREIGN KEY (fkPersonalidade) REFERENCES personalidade(idClasse),
PRIMARY KEY (id, fkUsuario, fkPersonalidade),
dtRegistro DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL);

INSERT INTO res_quiz (fkUsuario, fkPersonalidade) VALUES
('1', '1'),
('2', '2'),
('4', '3'),
('5', '3');

select * from res_quiz;
select * from usuario;


select count(fkUsuario) from res_quiz;

select count(idUsuario) from usuario where idUsuario NOT IN (select fkUsuario from res_quiz); 

select count(fkUsuario) as FezQuiz, (select count(idUsuario) from usuario)-(count(fkUsuario)) as 'Diferença' from res_quiz;

select count(fkUsuario) Fezquiz, t.Total - count(fkUsuario) as Diferença from (select count(idUsuario) as Total from usuario) as t join res_quiz;