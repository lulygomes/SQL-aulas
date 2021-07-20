--Operador +
SELECT 1 + 2 as resultado

--Operador *
SELECT 1 * 2 as resultado

--Operador -
SELECT 1 - 2 as resultado

--Operador /
SELECT 10 / 2 as resultado

--Operador %
SELECT 10 % 3 as resultado

/*
Usando o operador de adição para calcular o número total de
horas de ausência do trabalho para cada funcionário
*/

use AdventureWorks2017

--Ex com Adição
SELECT CONCAT(p.FirstName, ' ' ,p.LastName) as 'Nome'
       ,e.VacationHours
       ,e.SickLeaveHours
       ,e.VacationHours + e.SickLeaveHours as 'Horas Ausente'
FROM HumanResources.Employee as e
 JOIN Person.Person as p
 ON e.BusinessEntityID = p.BusinessEntityID
 ORDER BY 'Horas Ausente' ASC

--Usando subtração em um instrução SELECT
SELECT Max(taxrate) maximo,
       Min(taxrate) minimo,
       Max(taxrate) - Min(taxrate) AS 'Diferença na Taxa'
FROM Sales.SalesTaxRate
WHERE StateProvinceID IS NOT NULL;

/*
O exemplo a seguir recupera o número de identificação do produto, 
o nome, o preço de tabela e o novo preço de tabela de 
todas as bicicletas mountain bike na tabela Product. 
O novo preço de tabela é calculado usando o operador aritmético * 
para multiplicar ListPrice por 1.15.
*/

SELECT ProductID
       ,NAME
       ,ListPrice
       ,ListPrice * 1.15 as Novo_preco
FROM Production.Product
WHERE NAME LIKE 'Mountain-%'
ORDER BY ProductID ASC;

/*
O exemplo a seguir usa o operador aritmético de divisão para 
calcular a meta de vendas mensal da equipe de vendas em Ciclos de 12 meses
*/

SELECT s.BusinessEntityID as SalesPersonID
       ,CONCAT(p.FirstName, ' ', p.LastName ) as 'Nome'
       ,s.SalesQuota
       ,s.SalesQuota / 12 AS 'Meta Mensal'
FROM Sales.SalesPerson as s
     JOIN HumanResources.Employee as e
     ON s.BusinessEntityID = e.BusinessEntityID
     JOIN Person.Person as p 
     ON s.BusinessEntityID = p.BusinessEntityID
     WHERE s.SalesQuota IS NOT NULL
/*
O exemplo a seguir divide o número 38 por 5. 
Isto resulta em 7 como a parte inteira do resultado = 7
e demonstra como o módulo retorna o resto de 3.
*/

	SELECT 38 / 5 AS Inteiro,        
	       38 % 5 AS Restante


		   
