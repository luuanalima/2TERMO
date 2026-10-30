-- Active: 1788519232579@@127.0.0.1@3306@biblioteca_som2_luana
-- FASE 1 — DDL: CRIAÇÃO E ESTRUTURA

-- 1. Criação do banco — 3 pts
-- Crie o banco biblioteca_som2 e selecione-o.
CREATE DATABASE IF NOT EXISTS BIBLIOTECA_SOM2_LUANA;
USE BIBLIOTECA_SOM2_LUANA;

-- 2. Tabela USUARIO — 6 pts
-- Crie a tabela respeitando RN01, RN02 e RN03.
CREATE TABLE IF NOT EXISTS USUARIO (
    ID_USUARIO INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(100) NOT NULL,
    EMAIL VARCHAR(120) NOT NULL UNIQUE,
    TELEFONE VARCHAR(20),
    ATIVO BOOLEAN DEFAULT TRUE
);

CREATE TABLE IF NOT EXISTS FUNCIONARIO (
    ID_FUNCIONARIO INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(100) NOT NULL,
    CPF VARCHAR(14) NOT NULL,
    TELEFONE VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS PAGAMENTO (
    ID_PAGAMENTO INT PRIMARY KEY AUTO_INCREMENT,
    FORMA_PAGAMENTO VARCHAR(15) NOT NULL,
    STATUS_PAGAMENTO VARCHAR(20),
    DATA_PAGAMENTO DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- 3. Tabela LIVRO — 6 pts
-- Crie a tabela e utilize CHECK para impedir quantidade negativa.
CREATE TABLE IF NOT EXISTS LIVRO (
    ID_LIVRO INT PRIMARY KEY AUTO_INCREMENT,
    TITULO VARCHAR(150) NOT NULL,
    AUTOR VARCHAR(120) NOT NULL,
    ISBN CHAR(13) NOT NULL UNIQUE,
    ANO_PUBLICACAO INT,
    QUANTIDADE_DISPONIVEL INT DEFAULT 0,
    CONSTRAINT QUANTIDADE_DISPONIVEL 
    CHECK
    (QUANTIDADE_DISPONIVEL >= 0)
);


-- 4. Tabela EMPRESTIMO — 7 pts
-- Crie PK, duas FKs, DEFAULTs e CHECK de status. As FKs devem impedir
-- exclusão de usuário ou livro com histórico.
CREATE TABLE IF NOT EXISTS EMPRESTIMO (
    ID_EMPRESTIMO INT PRIMARY KEY AUTO_INCREMENT,
    DATA_EMPRESTIMO DATETIME DEFAULT CURRENT_TIMESTAMP,
    DATA_PREVISTA DATE NOT NULL,
    DATA_DEVOLUCAO DATE,
    STATUS_EMPRESTIMO VARCHAR(20) DEFAULT 'ABERTO'
        CHECK (STATUS_EMPRESTIMO IN ('ABERTO', 'DEVOLVIDO', 'ATRASADO')),
    ID_USUARIO INT,
    ID_LIVRO INT,

CONSTRAINT FOREIGN KEY (ID_USUARIO) REFERENCES USUARIO (ID_USUARIO),
CONSTRAINT FOREIGN KEY (ID_LIVRO) REFERENCES LIVRO (ID_LIVRO)
);

-- 5. ALTER TABLE — 3 pts
-- Adicione editora VARCHAR(100) à tabela LIVRO.
ALTER TABLE LIVRO ADD EDITORA VARCHAR(100);  

-- FASE 2 — DML: MANIPULAÇÃO DE DADOS

-- 6. INSERT de usuários — 4 pts
-- Cadastre pelo menos 4 usuários; um deles deve ter telefone NULL.
INSERT INTO USUARIO (NOME,EMAIL,TELEFONE,ATIVO) VALUES
('Carolina Maria','Carolina.maria@email.com','19980000001',TRUE),
('Luisa dos Reis','luisa.reis@email.com','19980000002',TRUE),
('Gustavo Matos', 'gustavo.matos@email.com','19980000003',TRUE),
('Maria Eduarda', 'maria.eduarda@email.com', NULL, TRUE);

-- 7. INSERT de livros — 5 pts
-- Cadastre pelo menos 6 livros com autores, ISBNs, anos e quantidades diferentes.
INSERT INTO LIVRO (TITULO,AUTOR,ISBN,ANO_PUBLICACAO,QUANTIDADE_DISPONIVEL) VALUES
('DIÁRIO DE UM BANANA','JEFF KINNEY','978-857683130','2007','15'),
('O PEQUENO PRÍNCIPE','ANTOINE DE SAINT-EXUPÉRY','978-859508151','1943','15'),
('O CORTIÇO','ALUÍSIO AZEVEDO','978-859431883','1890','15'),
('O ALQUIMISTA','PAULO COELHO','978-857542275','1988','15'),
('CORAÇÃO SEM MEDO','ITAMAR VIEIRA JUNIOR','978-655692878','2025','15'),
('É ASSIM QUE ACABA','COLLEN HOOVER','978-850111234','2018','15');

-- 8. INSERT de empréstimos — 4 pts
-- Cadastre pelo menos 3 empréstimos ABERTOS para usuários e livros existentes.
INSERT INTO EMPRESTIMO (DATA_PREVISTA,DATA_DEVOLUCAO,STATUS_EMPRESTIMO,ID_USUARIO,ID_LIVRO) VALUES
('2026-03-09','2026-03-20','ABERTO','1','3'),
('2026-02-08','2026-02-20','ABERTO','2','2'),
('2026-01-08','2026-01-20','ABERTO','3','1');

-- 9. UPDATE — 4 pts
-- Localize um usuário com SELECT e depois altere seu telefone com UPDATE.
SELECT ID_USUARIO, NOME, EMAIL, TELEFONE 
FROM USUARIO
WHERE ID_USUARIO = 2;

UPDATE USUARIO
SET TELEFONE = '19980000044'
WHERE ID_USUARIO = 2;

-- 10. Atualização em lote — 4 pts
-- Acrescente 2 exemplares a todos os livros publicados a partir de 2020.
UPDATE LIVRO 
SET QUANTIDADE_DISPONIVEL = QUANTIDADE_DISPONIVEL + 2
WHERE ANO_PUBLICACAO = 2020;

-- 11. DELETE e integridade — 4 pts
-- Crie e exclua um usuário sem empréstimos. Depois tente excluir um usuário que
-- possua empréstimo e explique o resultado.
INSERT INTO USUARIO (NOME,EMAIL,TELEFONE,ATIVO) VALUES
('Keynnan Fellipe','keynnan.fellipe@email.com','19980000033', TRUE);

DELETE FROM USUARIO 
WHERE EMAIL = 'keynnan.fellipe@email.com';
-- R: Não funciona por causa das fks.

DELETE FROM USUARIO
WHERE ID_USUARIO = 1;

-- FASE 3 — DQL: CONSULTAS E ANÁLISE

-- 12. SELECT básico — 2 pts
-- Liste título, autor e quantidade disponível de todos os livros.
SELECT TITULO, AUTOR, QUANTIDADE_DISPONIVEL
FROM LIVRO;

-- 13. WHERE + ORDER BY — 3 pts
-- Liste livros com quantidade maior que 2, do maior para o menor estoque.
SELECT TITULO, QUANTIDADE_DISPONIVEL
FROM LIVRO
WHERE QUANTIDADE_DISPONIVEL > 2
ORDER BY QUANTIDADE_DISPONIVEL DESC;
-- 20 pontos

-- 14. LIKE — 3 pts
-- Pesquise livros cujo título contenha uma palavra escolhida por você.
SELECT TITULO FROM LIVRO
WHERE TITULO LIKE '%banana%';

-- 15. BETWEEN — 3 pts
-- Liste livros publicados entre 2015 e 2025.
SELECT TITULO, AUTOR, ANO_PUBLICACAO FROM LIVRO
WHERE ANO_PUBLICACAO BETWEEN 2015 AND 2025
ORDER BY ANO_PUBLICACAO;

-- 16. Funções agregadas — 4 pts
-- Mostre COUNT, SUM, AVG, MIN e MAX sobre a quantidade disponível.
SELECT
    COUNT(*) AS TOTAL_LIVROS,
    SUM(QUANTIDADE_DISPONIVEL) AS SOMA_ESTOQUE,
    AVG(QUANTIDADE_DISPONIVEL) AS MEDIA_ESTOQUE,
    MIN(QUANTIDADE_DISPONIVEL) AS MENOR_ESTOQUE,
    MAX(QUANTIDADE_DISPONIVEL) AS MAIOR_ESTOQUE
FROM LIVRO;

-- 17. INNER JOIN — 4 pts
-- Liste ID do empréstimo, usuário, livro, data e status.
SELECT E.ID_EMPRESTIMO, E.ID_USUARIO, E.ID_LIVRO AS EMPRESTIMO , E.STATUS_EMPRESTIMO
FROM EMPRESTIMO AS E
INNER JOIN USUARIO AS U
ON U.ID_USUARIO = E.ID_USUARIO
INNER JOIN LIVRO AS L
ON L.ID_LIVRO = E.ID_LIVRO;

-- 18. JOIN + WHERE — 3 pts
-- Mostre apenas os empréstimos ABERTOS.
SELECT
    E.id_emprestimo,
    U.nome AS usuario,
    L.titulo AS livro,
    E.data_prevista,
    E.status_emprestimo
FROM EMPRESTIMO AS E
INNER JOIN USUARIO AS U
    ON E.id_usuario = U.id_usuario
INNER JOIN LIVRO AS L
    ON E.id_livro = L.id_livro
WHERE E.status_emprestimo = 'ABERTO';

-- 19. GROUP BY — 4 pts
-- Mostre cada usuário e sua quantidade de empréstimos, do maior para o menor.
SELECT
    U.id_usuario,
    U.nome,
    COUNT(E.id_emprestimo) AS quantidade_emprestimos
FROM USUARIO AS U
LEFT JOIN EMPRESTIMO AS E
    ON U.id_usuario = E.id_usuario
GROUP BY U.id_usuario, U.nome
ORDER BY quantidade_emprestimos DESC, U.nome ASC;

-- 20. LEFT JOIN — 4 pts
-- Liste todos os usuários, inclusive os que nunca fizeram empréstimo, com a
-- quantidade de empréstimos de cada um.
SELECT
    U.id_usuario,
    U.nome,
    COUNT(E.id_emprestimo) AS quantidade_emprestimos
FROM USUARIO AS U
LEFT JOIN EMPRESTIMO AS E
    ON U.id_usuario = E.id_usuario
GROUP BY U.id_usuario, U.nome
ORDER BY U.nome;

-- FASE 4 — TCL, TRANSAÇÕES E INTEGRIDADE

-- Contexto: registrar um empréstimo significa inserir o empréstimo e reduzir o
-- estoque. As duas operações devem ser tratadas como uma unidade.

-- 21. Transação de empréstimo — 7 pts
-- START TRANSACTION;
-- registre novo empréstimo;
-- reduza o estoque em 1;
-- consulte para conferir;
-- finalize com COMMIT.

START TRANSACTION;
INSERT INTO EMPRESTIMO (DATA_PREVISTA,DATA_DEVOLUCAO,STATUS_EMPRESTIMO,ID_USUARIO,ID_LIVRO) VALUES
('2026-12-07', '2026-12-20', 'ABERTO', 4, 6)

SELECT * FROM LIVRO;

UPDATE LIVRO
SET QUANTIDADE_DISPONIVEL = 1
WHERE ID_LIVRO = 1;

COMMIT;


-- 22. ROLLBACK — 5 pts
-- Altere propositalmente a quantidade de um livro dentro de uma transação, consulte,
-- execute ROLLBACK e comprove o retorno do valor anterior.
START TRANSACTION;
UPDATE LIVRO
SET QUANTIDADE_DISPONIVEL = 50
WHERE ID_LIVRO = 3;

ROLLBACK;

SELECT * FROM LIVRO;

-- 23. SAVEPOINT — 4 pts
-- Faça duas alterações em livros diferentes; após a primeira, crie um SAVEPOINT.
-- Desfaça apenas a segunda e confirme a primeira.
START TRANSACTION;
SELECT * FROM LIVRO;

UPDATE LIVRO 
SET QUANTIDADE_DISPONIVEL = 67
WHERE ID_LIVRO = 5

SAVEPOINT LIVROSALVO;

ROLLBACK TO SAVEPOINT LIVROSALVO;

COMMIT;

-- 24. Transação de devolução — 4 pts
-- Localize empréstimo ABERTO, marque DEVOLVIDO, registre data de devolução,
-- aumente estoque em 1 e execute COMMIT.

START TRANSACTION;
SELECT * FROM EMPRESTIMO;

UPDATE EMPRESTIMO
SET STATUS_EMPRESTIMO = 'DEVOLVIDO',
DATA_DEVOLUCAO = '2026-06-21'
WHERE ID_EMPRESTIMO = 6;

UPDATE LIVRO 
SET QUANTIDADE_DISPONIVEL = QUANTIDADE_DISPONIVEL + 1
WHERE ID_LIVRO = 1;

COMMIT;

-- 25:
-- 1- Para isso não acontecer utilizar a regra 'unique'
-- 2- O 'unique' é a melhor opção para não acontecer de dar erro
-- 3- Teremos que utilizar o check mas irá travar com a quantidade negativa
-- 4- O empréstimo precisa de um usuario para ser cadastrado, ou seja o empréstimo não sera criado
-- 5- Não será possivel pois esta usando o constraint junto com as references
-- 6- É uma transação que acontece, e se ocorrer uma transação errada, utiliza-se o ROLLBACK
-- 7- Não seria possivel realizar o emprestimo para ele ficar com quantidade negativa