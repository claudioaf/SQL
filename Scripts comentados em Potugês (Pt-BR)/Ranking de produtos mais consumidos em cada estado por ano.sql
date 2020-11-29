-- 14 - Qual o produto mais consumido em cada estado por ano?

-- Schema que iremos utilizar
use mba;

-- Verificar tabelas 
show tables;

-- Utilizaremos no exemplo:
-- basecliente
-- basevenda
-- cervejasbase 

-- Verificando os campos das tabelas

desc basecliente;
/*
idCliente		int(11)	
nome			text	
cpf				bigint(20)	
dataNascimento	datetime	
cidade			text	
estado			text	
cep				text	
*/

desc basevenda;
/*
idVenda			int(11)
loja			int(11)
dataVenda		datetime
ValorVendas		double
quantidadeItem	int(11)
idCliente		int(11)
IdProduto		int(11)
*/

desc cervejasbase;
/*
idproduto	int(11)
nome		text
malt		text
*/


-- RESPOTA !!

-- 1º Criar uma view com a soma dos produtos vendidos

CREATE VIEW T3 AS
SELECT 
	v.IdProduto id,
    	SUM(v.quantidadeItem) as qtd,
    	YEAR(v.dataVenda) as ano,
    	v.idCliente 
FROM basevenda as v
GROUP BY id, ano
ORDER BY id, qtd desc, ano;

-- 2º Select na view com o máximo dos produtos vendidos

SELECT
	CONCAT(c.estado,"/",ano) as estado_ano, 
    	c.estado as estado,
	p.nome as cerveja,
    	MAX(qtd) as maxqtd,
    	ano
from T3, basecliente as c, cervejasbase as p
where T3.idCliente = c.idCliente
and T3.id = p.idproduto
group by estado_ano
order by estado_ano;



    









