--DIFERENCA EM DIAS
SELECT DATEDIFF (day, '1989-04-26', Getdate())
SELECT DATEDIFF (day, '1989-04-26', '1998-04-26')

--DIFERENCA ENTRE MESES
SELECT DATEDIFF(MONTH, '1989-04-26', GETDATE())
SELECT DATEDIFF (MONTH, '1989-04-26', '1998-04-26')

--DIFERENCA ENTRE ANOS
SELECT DATEDIFF(YEAR, '1989-04-16', GETDATE())
SELECT DATEDIFF (YEAR, '1989-04-26', '1998-04-26')


--EXEMPLO

USE CRM

SELECT cli.id_cliente
      ,cli.nascimento
      ,GETDATE() Hoje
      ,DATEDIFF(DAY, cli.nascimento, GETDATE()) dif_dias
      ,DATEDIFF(MONTH, cli.nascimento, GETDATE()) dif_mes
      ,DATEDIFF(YEAR, cli.nascimento, GETDATE()) dif_ano
FROM cliente cli
WHERE cli.nascimento > '1980-01-01'
ORDER BY dif_ano DESC

--DATEADD 
--ADICIONANDO 90 DIAS
SELECT GETDATE() Hoje
      ,DATEADD(DAY, 90, GETDATE()) Mais_90Dias

--ADICIONANDO 2 MESES
SELECT GETDATE() Hoje
      ,DATEADD(MONTH, 2, GETDATE()) Mais_2MESES

--ADICIONANDO 3 ANOS
SELECT GETDATE() Hoje
      ,DATEADD(YEAR, 3, GETDATE()) Mais_3Anos

--Exemplo
use curso
--drop table contas
create table contas
(
 id_cont int identity(1,1) not null primary key,
 data_conta date not null,
 dias int,
 data_vencimento date ,
 valor decimal(10,2),
 situacao char(1) default('A')
 );
 --inserindo dados
  insert into contas (data_conta,dias,valor) values ('2018-05-24',10,25.75);

  insert into contas (data_conta,dias,valor) values ('2018-05-24',30,40.75);

  insert into contas (data_conta,dias,valor) values ('2018-05-24',60,30.75);


  --exemplo

  select id_cont,data_conta,dias,data_vencimento,valor from contas;

-- trazendo o valor na consulta
    select id_cont,
	       data_conta,
		   dias,
		   Dateadd(day,dias,data_conta) vencto,
		   valor from contas;
--realizando update 
 update contas set data_vencimento = Dateadd(day,dias,data_conta)
 where data_vencimento is null;

-- verificando

select * from contas