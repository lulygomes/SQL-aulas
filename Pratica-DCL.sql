--Parte 1 CONCEDE-GRANT
--Cria um login e dá permissões no banco

EXEC master.dbo.sp_addlogin 'UsrTeste', 'SenhaTeste';

use curso;
go

--Adicionar a permissão do user no baco de dados curso
EXEC sp_grantdbaccess 'UserTeste';

--Removendo a permissão 
--EXEC sp_revokedbaccess  'UserTest';


--Concedendo acesso de ATUALIZAÇAO PARA UserTeste.
GRANT UPDATE ON funcionarios TO UserTeste;

--Concedendo acesso de INTERT para UserTeste.
GRANT INSERT ON funcionarios TO UserTeste;

--Conceder acesso de Leitura 
GRANT SELECT ON funcionarios TO UserTeste;

--criando procedure
CREATE PROCEDURE testproc
AS
SELECT * FROM senso

--executando procedure
EXEC testproc

--Concedendo acesso para EXECUTAR A PROCEDURE
GRANT EXECUTE ON testproc TO UsrTeste

--Concedendo Acesso para executar proc teste_proc para UserTreste.
GRANT EXECUTE ON testproc TO UsrTeste


--Verificando usuario logado
select CURRENT_USER


--alterando usuario logado
SETUSER 'UsrTeste'

--PARTE 2 REVOGA-REVOKE

select  CURRENT_USER

--REVOGANDO Acesso DE ATUALIZACAO UsrTeste.
REVOKE UPDATE ON FUNCIONARIOS to UsrTeste; 

-- REVOGANDO Acesso DE inserção UsrTeste.
REVOKE INSERT ON FUNCIONARIOS TO UsrTeste; 

-- REVOGANDO Acesso DE Leitura UsrTeste.
REVOKE SELECT ON FUNCIONARIOS TO UsrTeste; 

--REVOGA DIREITO DE EXECUCAO DA PROC TESTE_PROC PARA UsrTeste.
REVOKE EXECUTE ON testproc TO UsrTeste ;

--VERIFICANDO USUARIO LOGADO
select CURRENT_USER

--EXEC sp_grantdbaccess 'UsrTeste','UsrTeste'

--EXEC sp_revokedbaccess 'UsrTeste'

--ALTERANDO USUARIO LOGADO
SETUSER 'UsrTeste'

--VERIFICANDO USUARIO LOGADO
select CURRENT_USER

--EXECUTANDO PROCEDURE COM USUARIO UsrTeste
EXEC testproc;

--TESTANDO SELECT
SELECT  * from FUNCIONARIOS

--TESTANDO INSERT
INSERT into FUNCIONARIOS values ('Maria','1000','TI')

--TESTANDO UPDATE
UPDATE FUNCIONARIOS set nome='Marilia'
where id='8';

--TESTANDO DELETE
DELETE FROM FUNCIONARIOS
WHERE ID='8'


setuser;

select CURRENT_USER

--3 PARTE NEGA-DENY
--NEGANDO Acesso DE ATUALIZACAO UsrTeste.
DENY UPDATE ON FUNCIONARIOS TO UsrTeste; 

-- NEGANDO Acesso DE ATUALIZACAO UsrTeste.
DENY INSERT ON FUNCIONARIOS TO UsrTeste;
 
-- NEGANDO Acesso DE Leitura UsrTeste.
DENY SELECT ON FUNCIONARIOS TO UsrTeste;

--NEGA ACESSO A EXECUSSAO DE PROCEDURE
DENY EXECUTE ON testproc TO UsrTeste;

--VERIFICANDO USUARIO LOGADO
select CURRENT_USER;

--ALTERANDO USUARIO LOGADO
SETUSER 'UsrTeste'

--VERIFICANDO USUARIO LOGADO
select CURRENT_USER

--EXECUTANDO PROCEDURE COM USUARIO UsrTeste
EXEC testproc

--TESTANDO SELECT
SELECT  * from FUNCIONARIOS;

--TESTANDO INSERT
INSERT into FUNCIONARIOS values ('Maria','1000','TI');

--TESTANDO UPDATE
UPDATE FUNCIONARIOS set nome='Marilia'
where id='7';

--TESTANDO DELETE
DELETE FROM FUNCIONARIOS
WHERE ID='7';

setuser;

select CURRENT_USER

