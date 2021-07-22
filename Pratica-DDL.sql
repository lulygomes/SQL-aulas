USE curso;
go


--Criando uma tabela
CREATE TABLE colaborador
(
    matricula     INT IDENTITY(1,1) NOT NULL
   ,nome          VARCHAR(50) NOT NULL
   ,sobrenome     VARCHAR(50) NOT NULL
   ,endereco      VARCHAR(50)
   ,cidade        VARCHAR(50)
   ,pais          VARCHAR(25)
   ,data_nasc     DATE NOT NULL CHECK(data_nasc < GETDATE())
   ,data_cadastro DATETIME DEFAULT GETDATE()
   ,situacao      CHAR(1) DEFAULT('A')
);

--Criando tabela com chave estrangeira
CREATE TABLE salario
(
    matricula INT PRIMARY KEY NOT NULL
   ,salario   DECIMAL(10,2) NOT NULL CHECK(salario > 0)
    FOREIGN KEY(matricula) REFERENCES colaborador(matricula)
);
--Ao tentar rodar o comando anteriro o sistema retorna um erro, pois na tabela colaborador não tem PK
--O seguinte comando muda a configuração da tablea colaborador e coloca o campo maricula como PK
ALTER TABLE colaborador ADD PRIMARY KEY (matricula);

--Criado table com PK 
CREATE TABLE audit_salario
(
     transacao   INT IDENTITY(1,1) NOT NULL PRIMARY KEY
    ,matricula   INT NOT NULL
    ,data_trans  DATETIME NOT NULL
    ,sal_antigo  DECIMAL(10,2)
    ,sal_novo    DECIMAL(10,2)
    ,usuario     VARCHAR(20) NOT NULL
);

--ADD FK em uma tabela já criada
ALTER TABLE audit_salario
ADD FOREIGN KEY (matricula) REFERENCES colaborador(matricula);

--Criando de INDEX 
CREATE INDEX ix_func1 ON colaborador(data_nasc);
CREATE INDEX ix_func2 ON colaborador(cidade, pais);

--Adicionando novo campo na tabela 
ALTER TABLE colaborador ADD genero CHAR(1);

--Ex de EXEC, Sp_rename é um procedure utilizada para mudar o nome de uma coluna na tablela
--Essa operação não é recomendada pois pode afetar outras funções que tem essa coluna como dependencia.
EXEC Sp_rename 'colaborador.end', 'ender', 'COLUMN'

--Alterando tip da coluna
ALTER TABLE colaborador ALTER COLUMN ender VARCHAR(30);

--Excluindo uma coluna da da tabela
ALTER TABLE colaborador DROP COLUMN genero;

--Renomeando uma Tabela
EXEC Sp_rename 'colaborador', 'colab';

EXEC Sp_rename 'colab', 'colaborador';

--DDL Criando DATABASE
CREATE DATABASE TESTE;

--DDL EXCLUIR DATABASE
--DROP DATABASE TESTE;

--Ecluindo table
DROP TABLE salario;


--CRIANDO VIEW
CREATE VIEW v_colaborador
  AS
SELECT * FROM colaborador;

--ALTER VIEW
ALTER VIEW v_colaborador
AS
SELECT matricula, nome from colaborador;

--Excluindo VIEW
DROP VIEW v_colaborador;

--Excluindo index
DROP INDEX ix_func1 on colaborador
CREATE INDEX ix_func1 on colaborador (nome);

--EXCLUINDO PROCEDURE 
--DROP PROCEDURE proc_salario;

--EXECLUINDO FUNÇÃO
--DROP FUNCTION func_salario;

--EXCLUINDO TRIGGER
DROP TRIGGER trg_func_salario;


--CRIANDO UMA CÓPIA DA TABLEA
SELECT * into senso_bk FROM senso;
SELECT * FROM senso_bk

--TRUNCATE
TRUNCATE TABLE senso_bk

--FAZENDO BK EM TABELA TEMPORARIA
SELECT * INTO #BK_SENSO2 FROM senso;
SELECT COUNT(*) AS Total_Registros FROM #BK_SENSO2


--DLL TRUNCATE APAGA DADOS DA TABELA
TRUNCATE TABLE senso;

SELECT * FROM senso

--RESTAURANDO O BK
INSERT INTO senso 
SELECT * FROM #BK_SENSO2;