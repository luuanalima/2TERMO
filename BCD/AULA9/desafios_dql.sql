-- Active: 1788519232579@@127.0.0.1@3306@smartcoffee_dml_luana
USE smartcoffee_dml_luana;

-- PARTE A - AQUECIMENTO

-- 1. Liste todos os clientes cadastrados.
SELECT * FROM cliente;

-- 2. Exiba apenas nome, cidade e e-mail dos clientes.
SELECT nome, cidade, email FROM cliente;

-- 3. Liste os nomes das cidades sem repetir valores.
SELECT DISTINCT cidade 
FROM cliente;

-- 4. Liste todos os produtos em ordem crescente de preço.
SELECT nome, preco FROM produto
ORDER BY preco ASC;

-- 5. Mostre apenas os 5 produtos mais caros.
SELECT preco FROM produto
ORDER BY preco DESC LIMIT 5;

-- PARTE B - FILTROS

-- 6. Liste os produtos com preço entre R$ 8,00 e R$ 15,00.
SELECT nome, preco FROM produto WHERE preco BETWEEN 8.00 AND 15.00;

-- 7. Liste os clientes das cidades Limeira ou Americana.
SELECT nome, cidade FROM cliente 
WHERE cidade IN ('Limeira', 'Americana');

-- 8. Localize os produtos cujo nome contém a palavra “Café”.
SELECT nome FROM produto
WHERE nome LIKE '%Café%';

-- 9. Liste os clientes que não informaram telefone.
SELECT nome, telefone FROM cliente
Where telefone IS NULL;

-- 10. Mostre os pedidos FINALIZADOS com valor acima de R$ 20,00,
--     do maior para o menor valor.
SELECT * FROM pedido 
WHERE status_pedido = 'Finalizando' AND valor_total > 20
ORDER BY valor_total DESC;
-- PARTE C - CÁLCULOS E AGRUPAMENTOS

-- 11. Informe quantos produtos estão cadastrados.
SELECT COUNT(*) AS produtos_cadastrados
FROM produto;

-- 12. Mostre menor preço, maior preço e preço médio dos produtos.
SELECT ROUND(MIN(preco),2)  AS Menor_preco,
    ROUND(MAX(preco),2) AS Maior_preco,
    ROUND(AVG(preco),2) AS Média_Preço
FROM produto;

-- 13. Informe quantos clientes existem em cada cidade.
SELECT cidade, COUNT(*) AS QTDE_CLIENTES
FROM cliente
GROUP BY cidade;

-- 14. Mostre somente as cidades que possuem dois ou mais clientes.
SELECT cidade, COUNT(*) AS QTDE_CLIENTES
FROM cliente
GROUP BY cidade
HAVING COUNT(*) >= 2;

-- 15. Calcule o faturamento total considerando apenas pedidos FINALIZADOS.
SELECT SUM(valor_total) AS Faturamento
FROM pedido
WHERE status_pedido = 'Finalizando';