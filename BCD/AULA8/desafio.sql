USE smartcoffee_dml_luana;

-- IMPORTANTE:
-- Para toda questão de UPDATE ou DELETE, escreva primeiro um SELECT
-- com o mesmo WHERE para validar os registros afetados.

-- PARTE A - INSERT

-- 1. Cadastre dois novos clientes com dados diferentes.
INSERT INTO cliente (nome,email,telefone,cidade) VALUES
('Iara Lima','iara.lima@email.com','19980000001','Limeira'),
('Luisa dos Reis','luisa.reis@email.com','19980000002','Cordeirópolis');


-- 2. Cadastre a categoria 'Especiais da Casa'.
INSERT INTO categoria (nome) VALUES
('Especiais da Casa');

-- 3. Localize o id da categoria criada e cadastre três produtos nela.
SELECT * FROM categoria;

INSERT INTO produto (nome,preco,ativo,id_categoria) VALUES
('Cupcake',8.00,TRUE,19),
('Mousse de Chocolate', 25.00, TRUE, 19),
('Fondue', 15.00, TRUE, 19);


-- 4. Cadastre um terceiro cliente sem telefone.
INSERT INTO cliente (nome,email,telefone,cidade)
VALUES ('Gustavo Matos','gustavo.matos@email.com',NULL,'Minas Gerais');

-- 5. Crie um novo pedido para um dos clientes cadastrados.
INSERT INTO pedido (data_pedido, status, valor_total, id_cliente) VALUES
(NOW(),'ABERTO',0.00,@peidido_compra);

-- 6. Use LAST_INSERT_ID() para guardar o id do pedido em @pedido_atividade
--    e insira pelo menos dois itens nesse pedido.
SET @pedido_atividade = LAST_INSERT_ID();
INSERT INTO item_pedido (id_pedido,id_produto,quantidade,preco_unitario) VALUES (@pedido_atividade,4,1,13.00), (@pedido_atividade,9,2,9.00);


-- PARTE B - UPDATE

-- 7. Corrija o telefone de um dos clientes criados.
-- SELECT de validação:
SELECT * FROM cLIENTE where email = 'iara.lima@email.com';
-- UPDATE:
UPDATE cliente
SET telefone = '112512345789'
WHERE id_cliente = 16;
-- SELECT final:
SELECT * FROM cliente WHERE email = 'iara.lima@email.com';

-- 8. Altere cidade e telefone de outro cliente em um único UPDATE.
UPDATE cliente
SET telefone = '11111213145',
    cidade = 'Limeira'
WHERE id_cliente = 16;

-- 9. Aumente em 8% o preço dos produtos da categoria 'Especiais da Casa'.
UPDATE produto
SET preco = preco * 1.08
WHERE id_categoria = @categoria_especial_casa;

-- 10. Altere o status do pedido criado para 'PREPARANDO'.
UPDATE pedido
SET status = 'PREPARANDO'
WHERE id_pedido = @pedido_atividade;

-- 11. Atualize valor_total do pedido de acordo com os itens cadastrados.
--     Você pode calcular previamente com SELECT SUM(quantidade * preco_unitario).
SELECT SUM(quantidade*preco_unitario) AS total
FROM item_pedido
WHERE id_pedido = @pedido_atividade;

-- 12. Escolha um dos produtos criados e faça uma exclusão lógica (ativo = FALSE).
SELECT * FROM produto WHERE nome='Croissant Especial';
UPDATE produto SET ativo=FALSE WHERE nome='Croissant Especial';
SELECT * FROM produto WHERE nome='Croissant Especial';

-- PARTE C - DELETE

-- 13. Crie um cliente de teste sem pedidos.
--     Depois localize e exclua apenas esse cliente.
INSERT INTO cliente (nome,email,cidade)
VALUES ('Cliente Temporário','temporario.a09@email.com','Limeira');
SELECT * FROM cliente WHERE email='temporario.a09@email.com';
DELETE FROM cliente WHERE email='temporario.a09@email.com';
SELECT * FROM cliente WHERE email='temporario.a09@email.com';

-- 14. Tente excluir um cliente da base original que possua pedidos.
--     Deixe o DELETE comentado após o teste e descreva o erro abaixo.
-- Resultado observado:
DELETE FROM cliente WHERE id_cliente = @cliente_atividade;

-- 15. Explique em comentário por que a FK bloqueou a exclusão.
-- Resposta:


-- 16. Crie uma categoria temporária chamada 'Excluir Depois' e remova-a.
INSERT INTO categoria (nome) VALUES
('Excluir Depois');
DELETE from categoria
WHERE nome = 'Excluir Depois';

