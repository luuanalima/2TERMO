-- Active: 1788519232579@@127.0.0.1@3306@smartcoffee_dml_luana
DROP DATABASE IF EXISTS SMARTCOFFEE_DML_LUANA;

CREATE DATABASE IF NOT EXISTS SMARTCOFFEE_DML_LUANA;

USE SMARTCOFFEE_DML_LUANA;

CREATE TABLE CLIENTE (
    ID_CLIENTE INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(100) NOT NULL,
    EMAIL VARCHAR(120) UNIQUE,
    TELEFONE VARCHAR(15),
    CIDADE VARCHAR(60) NOT NULL,
    ATIVO BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE CATEGORIA (
    ID_CATEGORIA INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(60) NOT NULL UNIQUE
);

-- INSERINDO DADOS NO BD
INSERT INTO cliente (nome,email,telefone,cidade,ativo) VALUES
('Livia Stein', 'livia@email.com','1999999000','Limeira',TRUE),
('Arthur Nunes','arthur@email.com','1999999901','Rondonia',TRUE),
('Beatriz Raissa','beatriz@email.com','1999999902','Limeira',TRUE),
('Dandara Dias', 'dandara@email.com','1998230450','Limeira',TRUE),
('Davi Ferreira','davi@email.com',NULL,'Limeira',TRUE),
('Felipe Rodrigues','felipe@email.com',NULL,'Limeira',TRUE),
('Francisco Magri','chico@email.com','1999999903','Limeira',TRUE),
('Franz Kramer','franz@email.com','1999999904','Limeira',TRUE),
('Gabriel Nogueira','gabriel@email.com','1999999905','Limeira',TRUE),
('Gabrielli Araujo','gabrielli@email.com','1999999906','Americana',TRUE),
('Isabella Alves','isabella@email.com',NULL,'Limeira',TRUE),
('Keynan Santos','keynan@email.com','1999999907','Santos',TRUE),
('Larissa Ramires','larissa@email.com','1999999908','Limeira',TRUE),
('Leonardo Dias','leonardo@email.com','1999999909','Valinhos',TRUE),
('Luana Lima','luana@email.com','1999999910','Limeira',TRUE),
('Luccas Manfredi','lucas@email.com','1999999911','Campinas',TRUE);

INSERT INTO CATEGORIA (NOME) VALUES('Cafés'),('Bebidas Geladas'),('Bebidas Quentes'),('Salgados'),('Sobremesas'),('Combo');

INSERT INTO CATEGORIA (NOME) VALUES
('DOCES');
SET @CATEGORIA = LAST_INSERT_ID();
SELECT @CATEGORIA;
-----------------------------------------

-- ATUALIZANDO OU MODIFICANDO DADOS NO BD
-- LEMBRAR DE SEMPRE EXECUTAR O SELECT PARA ATUALIZAR (UPDATE)
-- E NUNCA JAMAIS NEVER FAÇA UM UPDATE SEM WHERE 
-- EX 1: MODIFICANDO VALORES INDIVIDUAIS
UPDATE cliente
SET TELEFONE = '1988880001'
WHERE ID_CLIENTE = 9

UPDATE cliente
SET TELEFONE = '0000000000'


-- EX 2: MODIFICANDO VÁRIOS VALORES
UPDATE CLIENTE
SET TELEFONE = '1999999901',
    CIDADE = 'PIRACICABA'
WHERE ID_CLIENTE = 9;


--APAGAR DADOS DA TABELA NO BD
DELETE FROM cliente
WHERE ID_CLIENTE = 9;


-- CONSULTAR DADOS NO BD
SELECT * FROM CLIENTE
WHERE ID_CLIENTE = 9;

SELECT * FROM CATEGORIA;
