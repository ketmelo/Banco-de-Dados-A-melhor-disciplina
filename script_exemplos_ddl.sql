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

 
 /*1*/
 
 select * from livros;
 
 /*2*/
 
select nome from autores where nascimento < '1900-01-01';

/*3*/

SELECT * FROM livros WHERE autor_id = 1;

/*4*/

 SELECT alunos.nome FROM  alunos
 INNER JOIN matriculas ON alunos.id = matriculas.aluno_id
 WHERE matriculas.curso = 'Engenharia de Software';

/*5*/

SELECT produto, SUM(receita) AS receita_total FROM vendas GROUP BY produto;

/*6*/
SELECT autores.nome, COUNT(livros.id) AS total_livros
FROM autores
LEFT JOIN livros ON autores.id = livros.autor_id
GROUP BY autores.nome; 

/*7*/

SELECT curso, COUNT(*) AS total_alunos
FROM matriculas
GROUP BY curso;

/*8*/

SELECT produto, AVG(receita) AS media_receita
FROM vendas
GROUP BY produto;

/*9*/

SELECT produto, SUM(receita) AS receita_total
FROM vendas
GROUP BY produto
HAVING SUM(receita) > 10000.00;

/*10*/

SELECT autores.nome, COUNT(*) AS livros_total
FROM autores
INNER JOIN livros ON autores.id = livros.autor_id
GROUP BY autores.nome 
HAVING COUNT(*) > 2;

/*11*/

SELECT livros.titulo, autores.nome AS autor_nome 
FROM livros 
INNER JOIN autores ON livros.autor_id = autores.id;

/*12*/

SELECT alunos.nome, matriculas.curso AS nome_aluno
FROM alunos
INNER JOIN matriculas ON matriculas.aluno_id = alunos.id;

/*13*/

SELECT autores.nome, livros.titulo
FROM autores 
LEFT JOIN livros ON autores.id = livros.autor_id;

/*14*/

SELECT matriculas.curso, alunos.nome AS nome_do_aluno
FROM matriculas
RIGHT JOIN alunos ON matriculas.aluno_id = alunos.id;


/*15*/
 
SELECT alunos.nome, matriculas.curso AS nome_aluno
FROM alunos
INNER JOIN matriculas ON matriculas.aluno_id = alunos.id;

/*16*/
SELECT autores.nome, COUNT(livros.id) AS quantidade_de_livros
FROM autores
JOIN livros ON autores.id = livros.autor_id
GROUP BY autores.nome
HAVING quantidade_de_livros > 1;

/*17*/

SELECT produto
FROM vendas
WHERE receita = (SELECT MIN(receita) FROM vendas);

/*19*/
 SELECT alunos.nome, COUNT(matriculas.id) AS numero_de_matriculas
FROM alunos
LEFT JOIN matriculas ON alunos.id = matriculas.aluno_id
GROUP BY alunos.nome;

/*20*/

SELECT produto, COUNT(*) AS quantidade_transacoes
FROM vendas
GROUP BY produto;



