/*
 Esse é um texto de exemplo
 Você pode fazer um arquivo para cada lista, identificando nos comentário o exercício demonstrado.
 Por exemplo:
 Você pode apagar esse texto
++++++++++++++++++++++++++++++++++++++++++++++++++++++
*/
-- Nome: Fulano de Tal
-- Matrícula: 20101011202
-- Lista 1


-- Exercício 1.1-b
-- Query que .....

SELECT nome_cd, preco_venda, CASE
	WHEN preco_venda < 10 THEN
	preco_venda * 0.9
	WHEN preco_venda >=10 AND preco_venda < 13 THEN
	preco_venda * .8
	ELSE
	preco_venda * .7
	END venda
FROM cd ;


-- Exercícios da Lista 1
-- Exercício 1.1-d
-- Query que .....

CREATE VIEW salario_por_departamento
	AS SELECT nome_depto, sum (salario) AS
		salario total
	FROM funcionario f JOIN departamento d ON (f.
	cod_depto = d.cod_depto )
	GROUP by nome_depto ;


	-- Exercício 1.1-b
	-- Query que .....

	SELECT nome_cd, preco_venda, CASE
		WHEN preco_venda < 10 THEN
		preco_venda * 0.9
		WHEN preco_venda >=10 AND preco_venda < 13 THEN
		preco_venda * .8
		ELSE
		preco_venda * .7
		END venda
	FROM cd ;
