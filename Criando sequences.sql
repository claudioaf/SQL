/* As Sequences são objetos para gerar valores de auto numeração.
Podemos definir os valores iniciais e seu incremento
 */

 /* Também são aplicados as Sequences:
 CREATE, ALTER e DROP
 */

-- Criando a Sequence

CREATE SEQUENCE SEQ_GERAL 	-- Sequence chamada SEQ_G
START WITH 100 				-- A Sequence irá iniciar em 100
INCREMENT BY 10;			-- Com incremento de 10 em relação ao ultimo valor

-- Criando uma tabela na Tablespace RECURSOS_HUMANOS
CREATE TABLE FUNCIONARIOS (
	IDFUNCIONARIO INT PRIMARY KEY,
	NOME VARCHAR2(30)
)TABLESPACE RECURSOS_HUMANOS;

-- Povoando a tabela
-- VALUES(SEQ_GREAL.NEXTVAL): Iremos buscar o valor para o IDFUNCIONARIO na Sequence criada a pouco
INSERT INTO FUNCIONARIOS VALUES(SEQ_GERAL.NEXTVAL,'João');
INSERT INTO FUNCIONARIOS VALUES(SEQ_GERAL.NEXTVAL,'Clara');
INSERT INTO FUNCIONARIOS VALUES(SEQ_GERAL.NEXTVAL,'Lilian');

-- Verificando a aplicação da Sequence no insert acima
SELECT * FROM FUNCIONARIOS;

-- Como mostrar todas as sequences do Banco de dados?
SELECT * FROM all_objects WHERE object_type = 'SEQUENCE';

-- Selecionando uma Sequence na tabela de Objetos = Sequences?
SELECT * FROM all_objects 
WHERE object_type = 'SEQUENCE'
AND OBJECT_NAME = 'SEQ_GERAL'