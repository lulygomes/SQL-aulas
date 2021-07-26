use curso;

--SIMULANDO UM ERRO
SELECT 1,1
UNION
SELECT 'A', 2

--CORRETO -- OS VALORES TEM QUE SER DO MESMO TIPO, VARCHAR COM VARCHAR E INTER COM INTER
SELECT '1',1
UNION
SELECT 'A', 1


USE AdventureWorks2017;
--EXEMPLO USANDO UNION
--NESSE EXEMPLO CONSEGUIMOS LISTAR AS CIDADES SEM REPETIR A CIDADE
SELECT city 
FROM Person.Address

UNION

SELECT city 
FROM Person.Address

--EXEMPLO UNION ALL
SELECT city 
FROM Person.Address

UNION ALL

SELECT city 
FROM Person.Address


USE CRM
--UNION
SELECT cidade
      ,codigo_pais
FROM cliente
WHERE codigo_pais = 'US'
UNION
SELECT cidade
      ,codigo_pais
FROM cliente
WHERE codigo_pais = 'BR'
ORDER BY cidade;

--UNION ALL
SELECT cidade
      ,codigo_pais
FROM cliente
WHERE codigo_pais = 'US'
UNION ALL
SELECT cidade
      ,codigo_pais
FROM cliente
WHERE codigo_pais = 'BR'
ORDER BY cidade;