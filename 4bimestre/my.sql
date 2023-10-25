CREATE DATABASE exercicios_trigger;
USE exercicios_trigger;

-- Criação das tabelas
CREATE TABLE Clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL
);

CREATE TABLE Auditoria (
    id INT AUTO_INCREMENT PRIMARY KEY,
    mensagem TEXT NOT NULL,
    data_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    estoque INT NOT NULL
);

CREATE TABLE Pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    produto_id INT,
    quantidade INT NOT NULL,
    FOREIGN KEY (produto_id) REFERENCES Produtos(id)
);


INSERT INTO Clientes (nome)
VALUES ('Joardson'), ('Nicolas') , ('Laura'), ('Levi'), ('Liz'), ('Evie');

INSERT INTO Auditoria (mensagem)
VALUES ('mensagens'), ('mensagens'), ('mensagens'), ('mensagens'), ('mensagens'), ('mensagens');

select * from auditoria;

CREATE TRIGGER depois_cliente
AFTER INSERT ON Clientes
FOR EACH ROW 
INSERT INTO Auditoria (mensagem) 
VALUES ('Novo cliente inserido: ', NEW.nome, ' - Data e hora: '  );

CREATE TRIGGER deletar_clientes
BEFORE DELETE ON Clientes
FOR EACH ROW
INSERT INTO Auditoria (mensagem) 
VALUES ('Tentativa de exclusão do cliente: ', OLD.nome) ;


CREATE TRIGGER nome_cliente
AFTER UPDATE ON Clientes
FOR EACH ROW
INSERT INTO Auditoria (mensagem) 
VALUES ('Nome do cliente atualizado: Antigo nome - ', OLD.nome, ', Novo nome - ', NEW.nome) ;


CREATE TRIGGER atualizar_nome
BEFORE UPDATE ON Clientes
FOR EACH ROW
INSERT INTO Auditoria (mensagem)
VALUES ("Não é permitido atualizar o nome do cliente");




CREATE TRIGGER inserir_pedidos
AFTER INSERT ON Pedidos
FOR EACH ROW
UPDATE Produtos
SET estoque = estoque - NEW.quantidade
WHERE id = NEW.produto_id;
    
INSERT INTO Auditoria (mensagem)
VALUES ('Estoque do produto com ID ', NEW.produto_id );

