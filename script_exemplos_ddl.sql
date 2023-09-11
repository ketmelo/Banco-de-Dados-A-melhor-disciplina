CREATE DATABASE aula_db_exemplos;
USE aula_db_exemplos;

CREATE TABLE vendas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    produto VARCHAR(255) NOT NULL,
    receita DECIMAL(10, 2) NOT NULL
);

CREATE TABLE autores (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    nascimento DATE
);

CREATE TABLE livros (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(255) NOT NULL,
    autor_id INT,
    FOREIGN KEY (autor_id) REFERENCES autores(id)
);

CREATE TABLE alunos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL
);

CREATE TABLE matriculas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    aluno_id INT,
    curso VARCHAR(255) NOT NULL,
    FOREIGN KEY (aluno_id) REFERENCES alunos(id)
);

 
 select * from livros;

 select nome from autores where nascimento < '1900-01-01';

 SELECT * FROM livros WHERE autor_id = 1;

SELECT alunos.nome FROM  alunos
 INNER JOIN matriculas ON alunos.id = matriculas.aluno_id
 WHERE matriculas.curso = 'Engenharia de Software';

 SELECT produto, SUM(receita) AS receita_total FROM vendas GROUP BY produto;

 SELECT autores.nome, COUNT(livros.id) AS total_livros
FROM autores
LEFT JOIN livros ON autores.id = livros.autor_id
GROUP BY autores.nome; 