USE smartcoffee_procedures_luana;

-- AULA 14 - ATIVIDADE STORED PROCEDURES


-- 1. listar_clientes_ativos()

DELIMITER $$
create procedure listar_clientes_ativos()
begin
    SELECT id_cliente as código, nome
    FROM cliente
    WHERE ativo = TRUE
    ORDER BY nome; 
END
DELIMITER;
CALL listar_clientes_ativos();

-- 2. buscar_produto_por_nome(IN p_busca VARCHAR(100))

delimiter $$
create Procedure buscar_produtos_nome (IN P_ID_produto INT)
begin
    SELECT id_produto as código, nome
    FROM produto
    WHERE id_produto = p_id_produto
    AND ativo = true
    ORDER BY nome;
END
DELIMITER;
call buscar_produtos_nome(2);

-- 3. produtos_por_categoria(IN p_id_categoria INT)

delimiter $$
create Procedure produtos_por_categoria (IN P_ID_CATEGORIA INT)
begin
    SELECT id_produto as código, nome
    FROM produto
    WHERE id_categoria = p_id_categoria
    AND ativo = true
    ORDER BY nome;
END
DELIMITER;
call produtos_por_categoria(3);

-- 4. total_clientes(OUT p_total INT)

DELIMITER $$
create procedure total_clientes ( out p_total int)
begin
    SELECT count(*)
    INTO p_total
    FROM cliente
    WHERE ativo = true;
end $$
delimiter;

call total_clientes(@total);
SELECT@total

-- 5. consultar_estoque(IN p_id_produto INT) usando variável local

delimiter $$
create procedure consultar_estoque (in p_id_produto int)
begin
    declare v_quantidade int;

    SELECT quantidade
    INTO v_quantidade
    FROM estoque
    WHERE id_produto = p_id_produto;

    SELECT v_quantidade as estoque_produtos;
end $$
delimiter;
CALL consultar_estoque(1);

-- 6. classificar estoque: 0 SEM ESTOQUE / <=5 BAIXO / >5 NORMAL

DELIMITER $$
create Procedure classificar_estoque2 (in p_id_produto int)
begin
    DECLARE v_quantidade int;

    SELECT quantidade
    INTO v_quantidade
    FROM estoque
    WHERE id_produto = p_id_produto;

    if v_quantidade = 0 THEN
        SELECT 'SEM ESTOQUE' as situação;
    elseif v_quantidade <= 5 THEN
        SELECT 'ESTOQUE BAIXO' as situção;
    ELSE
        select 'ESTOQUE NORMAL' as situação;
    end if;
end $$
DELIMITER;
call classificar_estoque2(2);

-- 7. cadastrar_cliente(...) com três parâmetros IN

DELIMITER $$
create Procedure cadastro_clientes (
    in p_nome varchar(100),
    in p_email varchar(120),
    in p_telefone varchar(20)
)
begin
    insert into cliente(nome, email, telefone, ativo)
    values(p_nome, p_email, p_telefone, true);
end $$
delimiter;
call cadastro_clientes ('Luana', 'luana@email', '199933333');

select * from cliente;


-- 8. alterar_preco(...) impedindo valor <= 0

delimiter $$
create procedure alterar_preco (
    in p_id_produto int,
    in p_novo_preco decimal(10,2)
)
begin
    if p_novo_preco > 0 THEN
        update produto
        set preco = p_novo_preco
        WHERE id_produto = p_id_produto;

        select 'PREÇO ATUALIZADO' as mensagem;
    ELSE
        select 'PREÇO INVALIDO' as mensagem;
    end if;
end $$
DELIMITER;
call alterar_preco(2,14);
SELECT * from produto;

-- 9. criar_pedido(IN p_id_cliente INT, OUT p_id_pedido INT)

delimiter $$
CREATE Procedure criar_pedido(
    in p_id_cliente int,
    out p_id_pedido int
)
begin
    start transaction;
    insert into pedido(
        id_cliente,
        data_pedido,
        status_pedido
    )
values(
    p_id_cliente, now(), 'ABERTO'
);

set p_id_pedido = LAST_INSERT_ID();
COMMIT;
end$$
DELIMITER;

-- 10. devolver ID com LAST_INSERT_ID()

call criar_pedido(1,@pedido);
select@pedido;

-- 11. adicionar_item_pedido(...) buscando o preço atual

delimiter $$
create procedure adicionar_item_pedido2(
    in p_id_pedido int,
    in p_id_produto int,
    in p_quantidade int
)
begin
    declare v_preco decimal(10,2);
    if p_quantidade <= 0 THEN
        select 'QUANTIDADE INVALIDA' as mensagem;
    ELSE
        SELECT preco
        into v_preco
        from produto
        where id_produto = p_id_produto
            and ativo = true;
        
        insert into item_pedido(
            id_pedido, id_produto, quantidade, preco_unitario
        )
        values (
            p_id_pedido, p_id_produto, p_quantidade, v_preco
        );
        select 'ITEM ADICIONADO' as mensagem;
    end if;
end $$
DELIMITER;
call adicionar_item_pedido2(1,2);
SELECT * from pedido;

-- 12. Faça uma chamada inválida e explique o resultado.

call adicionar_item_pedido(2);
-- Error: Incorrect number of arguments for PROCEDURE smartcoffee_procedures_luana.adicionar_item_pedido; expected 3, got 1
-- Esse erro ocorreu pois precisa conferir os IDs corretos para chama-los

-- 13. Use SHOW CREATE PROCEDURE.

show create PROCEDURE cadastro_clientes ;

-- 14. Remova uma procedure com DROP PROCEDURE IF EXISTS e recrie-a.

drop procedure if exists adicionar_item_pedido2;

-- DESAFIO FINAL:
-- Crie uma procedure de negócio com:
-- - pelo menos 2 parâmetros;
-- - variável local;
-- - IF;
-- - pelo menos uma alteração no banco.

DELIMITER $$
CREATE PROCEDURE adicionar_pontos_cliente(
    IN p_id_cliente INT,
    IN p_pontos INT
)
BEGIN
    DECLARE v_pontos INT;

    IF p_pontos > 0 THEN
        SET v_pontos = p_pontos;
        UPDATE cliente
        SET pontos_fidelidade = pontos_fidelidade + v_pontos
        WHERE id_cliente = p_id_cliente;
    ELSE
        SELECT 'PONTOS INVALIDOS' AS mensagem;
    END IF;
END $$
DELIMITER ;

CALL adicionar_pontos_cliente(1, 10);

SELECT * from cliente;