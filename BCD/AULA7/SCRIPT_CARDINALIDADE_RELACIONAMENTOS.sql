-- Active: 1788519232579@@127.0.0.1@3306@sesi_cr_ta

-- Sql ANSI 2003 - brModelo.
-- Relacionamento e Cardinalidade - Banco de dados Exemplo

CREATE DATABASE IF NOT EXISTS SESI_CR_TA;

USE SESI_CR_TA;




CREATE TABLE CLIENTE (
id_cliente int auto_increment primary key PRIMARY KEY,
nome_cliente varchar(60)
)

CREATE TABLE PEDIDO (
id_pedido int auto_increment primary key PRIMARY KEY,
data_pedido date,
id_cliente int not null,
FOREIGN KEY(id_cliente) REFERENCES CLIENTE (id_cliente)
)

CREATE TABLE ESTOQUE (
id_produto int not null unique,
nome_produto varchar(60) not null,
id_estoque int auto_increment primary key,
quantidade int not null
-- PRIMARY KEY(id_produto,id_estoque)
)

CREATE TABLE FORNECEDOR (
id_fornecedor int auto_increment primary key PRIMARY KEY,
razao_social varchar(100) not null
)

CREATE TABLE PRODUTO (
id_produto int auto_increment primary key PRIMARY KEY,
nome_produto varchar(60) not null
)


CREATE TABLE item_produto (
id_produto int not null,
id_fornecedor int not null,
id_item int auto_increment primary key PRIMARY KEY,
valor decimal(10,2),
observacao text(300),
FOREIGN KEY(id_produto) REFERENCES PRODUTO (id_produto),
FOREIGN KEY(id_fornecedor) REFERENCES FORNECEDOR (id_fornecedor)
)

-- DESAFIOS
-- QUESTAO 1
-- CATEGORIA --- POSSUI --- PRODUTO
-- (1,N), (1,1)

-- QUESTAO 2
-- FUNCIONARIO --- REGISTRA --- PEDIDO
-- (1,N), (1,1)

-- QUESTAO 3
-- FORNCEDOR --- COMERCIALIZA --- PRODUTO
-- (1,N), (1,N)

-- QUESTAO 4
-- CLIENTE --- RESERVA --- MESA
--(0,N), (1,1)

-- QUESTAO 5
-- PEDIDO --- POSSUI --- ITEM_PEDIDO
-- (1,N), (1,1)