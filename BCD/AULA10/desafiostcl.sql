-- Active: 1788519232579@@127.0.0.1@3306@smartcoffee_dml_luana
USE SMARTCOFFEE_DML_LUANA;
-- 01. Consulte produto 2 e seu preço.
SELECT nome, preco FROM Produto Where ID_PRODUTO = 2;

-- 02. START TRANSACTION e aumente produto 2 em R$3,00.
START TRANSACTION;
UPDATE PRODUTO SET PRECO = PRECO + 3.00 WHERE ID_PRODUTO = 2;

-- 03. Consulte dentro da transação.
SELECT nome, preco FROM Produto Where ID_PRODUTO = 2;

-- 04. ROLLBACK.
ROLLBACK;

-- 05. Consulte e comprove retorno.
SELECT nome, preco FROM Produto Where ID_PRODUTO = 2; -- Funcionou o valor saiu de 8.69 para 11.69.

-- 06. Repita a alteração e finalize com COMMIT.
START TRANSACTION;

UPDATE PRODUTO SET PRECO = PRECO + 3.00 WHERE ID_PRODUTO = 2;

SELECT nome, preco FROM Produto Where ID_PRODUTO = 2;

COMMIT;

-- 07. START TRANSACTION e aumente produto 3 em 10%.
START TRANSACTION;

UPDATE PRODUTO SET PRECO = PRECO * 1.10 WHERE ID_PRODUTO = 3;

-- 08. SAVEPOINT ajuste_produto3.
SAVEPOINT ajuste_produto3;

-- 09. Aumente produto 4 em 50%.
UPDATE PRODUTO SET PRECO = PRECO * 1.50 WHERE ID_PRODUTO = 4;

-- 10. Consulte os dois.
SELECT nome, preco FROM Produto Where ID_PRODUTO = 3;
SELECT nome, preco FROM Produto Where ID_PRODUTO = 4;

-- 11. ROLLBACK TO SAVEPOINT ajuste_produto3.
ROLLBACK TO SAVEPOINT ajuste_produto3;

-- 12. COMMIT e explique em comentário qual alteração permaneceu.
COMMIT;

-- A alteração que permaneceu foi a do produto 3 já que o SavePoint foi efetuado após a alteração do produto 3, permitindo que aquilo continue.

-- 13. START TRANSACTION.
START TRANSACTION;

-- 14. Crie pedido para cliente 1 e salve o id em @novo_pedido.
INSERT INTO PEDIDO (DATA_PEDIDO, STATUS, VALOR_TOTAL, ID_CLIENTE) VALUES (NOW(), 'ABERTO', 0.00, 17); -- O meu não existe cliente 1, ele começa no 17

SELECT * FROM CLIENTE;

SET @novo_pedido = LAST_INSERT_ID();

-- 15. Insira dois itens válidos.
INSERT INTO ITEM_PEDIDO (ID_PEDIDO, ID_PRODUTO, QUANTIDADE, PRECO_UNITARIO, observacao) VALUES (@novo_pedido, 3,2, 15.02, ''), (@novo_pedido, 1,5, 8.50, '');
SELECT * FROM ITEM_PEDIDO;

-- 16. Registre pagamento válido.
INSERT INTO PAGAMENTO (ID_PEDIDO, VALOR, ID_FORMA_PAGAMENTO) VALUES (@novo_pedido, 47.50, 2);


-- 17. Consulte pedido, itens e pagamento.
SELECT * FROM PEDIDO WHERE ID_PEDIDO = @novo_pedido;
SELECT * FROM ITEM_PEDIDO WHERE ID_PEDIDO = @novo_pedido;
SELECT * FROM PAGAMENTO WHERE ID_PEDIDO = @novo_pedido;

-- 18. COMMIT.
COMMIT;

-- 19. START TRANSACTION e crie pedido para cliente 2.
START TRANSACTION;

INSERT INTO PEDIDO (DATA_PEDIDO, STATUS, VALOR_TOTAL, ID_CLIENTE) VALUES (NOW(), 'ABERTO', 0.00, 18); -- O meu não existe cliente 2, ele começa no 17 ou seja 18

-- 20. Salve o id em @pedido_com_erro.
SET @pedido_com_erro = LAST_INSERT_ID();

-- 21. Tente inserir item com id_produto inexistente.
INSERT INTO ITEM_PEDIDO (ID_PEDIDO, ID_PRODUTO, QUANTIDADE, PRECO_UNITARIO, observacao) VALUES (@pedido_com_erro, 39,2, 15.02, '');

-- 22. Após observar a FK, ROLLBACK.
ROLLBACK

-- 23. Consulte @pedido_com_erro e comprove que não permaneceu.
SELECT * FROM ITEM_PEDIDO WHERE ID_PEDIDO = @pedido_com_erro

-- 24. Tente excluir uma categoria que possui produtos.
START TRANSACTION;

DELETE FROM CATEGORIA WHERE ID_CATEGORIA = 1;

ROLLBACK;

-- Explique em comentário por que foi bloqueado.
-- Ele foi bloqueado porque possuí FKs em uso, ou seja ele possuí itens que estão sendo utilizados com base em sua tabela.

-- 25. Crie em uma transação um pedido temporário com dois itens,
-- exclua o pedido e observe ON DELETE CASCADE.
-- Finalize com ROLLBACK para preservar a base.
START TRANSACTION;

INSERT INTO PEDIDO (DATA_PEDIDO, STATUS, VALOR_TOTAL, ID_CLIENTE) VALUES (NOW(), 'ABERTO', 0.00, 18); -- O meu não existe cliente 2, ele começa no 17 ou seja 18

SET @pedido_ultimo = LAST_INSERT_ID();

INSERT INTO ITEM_PEDIDO (ID_PEDIDO, ID_PRODUTO, QUANTIDADE, PRECO_UNITARIO, observacao) VALUES (@pedido_ultimo, 2,2, 15.02, ''), (@pedido_ultimo, 1,2, 24.0, '');

SELECT * FROM PEDIDO WHERE ID_PEDIDO = @pedido_ultimo;

DELETE FROM PEDIDO WHERE ID_PEDIDO = @pedido_ultimo;

ROLLBACK;