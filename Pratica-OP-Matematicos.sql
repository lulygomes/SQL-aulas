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
Usando o operador de adi��o para calcular o n�mero total de
horas de aus�ncia do trabalho para cada funcion�rio
*/

use AdventureWorks2017

--Ex com Adi��o
SELECT CONCAT(p.FirstName, ' ' ,p.LastName) as 'Nome'
       ,e.VacationHours
       ,e.SickLeaveHours
       ,e.VacationHours + e.SickLeaveHours as 'Horas Ausente'
FROM HumanResources.Employee as e
 JOIN Person.Person as p
 ON e.BusinessEntityID = p.BusinessEntityID
 ORDER BY 'Horas Ausente' ASC

--Usando subtra��o em um instru��o SELECT
SELECT Max(taxrate) maximo,
       Min(taxrate) minimo,
       Max(taxrate) - Min(taxrate) AS 'Diferen�a na Taxa'
FROM Sales.SalesTaxRate
WHERE StateProvinceID IS NOT NULL;

/*
O exemplo a seguir recupera o n�mero de identifica��o do produto, 
o nome, o pre�o de tabela e o novo pre�o de tabela de 
todas as bicicletas mountain bike na tabela�Product.�
O novo pre�o de tabela � calculado usando o operador aritm�tico�*�
para multiplicar�ListPrice�por�1.15.
*/

SELECT ProductID
       ,NAME
       ,ListPrice
       ,ListPrice * 1.15 as Novo_preco
FROM Production.Product
WHERE NAME LIKE 'Mountain-%'
ORDER BY ProductID ASC;

/*
O exemplo a seguir usa o operador aritm�tico de divis�o para 
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
O exemplo a seguir divide o n�mero 38 por 5. 
Isto resulta em 7 como a parte inteira do resultado = 7
e demonstra como o m�dulo retorna o resto de 3.
*/

	SELECT�38�/�5�AS�Inteiro,��������
	       38�%�5�AS�Restante


		   
