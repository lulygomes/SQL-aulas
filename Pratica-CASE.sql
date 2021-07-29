USE curso

DECLARE @date DATETIME
SET @date = GETDATE() +1
SELECT @date,
       CASE WHEN @date = GETDATE() THEN 'Hoje'
            WHEN @date < GETDATE() THEN 'Ontem'
            WHEN @date > GETDATE() THEN 'Amanhã'
            END dia

--EXEMPLO 2
USE AdventureWorks2017
SELECT ProductNumber
      ,ProductLine
      ,CASE ProductLine
                   WHEN 'R' THEN 'Road'
                   WHEN 'M' THEN 'Mountain'
                   WHEN 'T' THEN 'Touring'
                   WHEN 'S' THEN 'Other sale items'
                   ELSE 'Not for sale' END Categoria
FROM Production.Product
ORDER BY ProductNumber;

--Exemplo 2

SELECT ProductNumber
      ,ProductLine
      ,CASE 
            WHEN ProductLine = 'R' THEN 'Road'
            WHEN ProductLine = 'M' THEN 'Mountain'
            WHEN ProductLine = 'T' THEN 'Touring'
            WHEN ProductLine = 'S' THEN 'Other sale items'
            ELSE 'Not fro sale' END Categoria
FROM Production.Product
ORDER BY ProductNumber

--EXEMPLO 3
SELECT ProductNumber
      ,Name
      ,ListPrice
      ,CASE 
            WHEN ListPrice = 0   THEN 'Não está a venda'
            WHEN ListPrice <= 50 THEN 'Abaixo de $50'
            WHEN ListPrice > 51  AND ListPrice <= 250 THEN 'Entre $51 de $250'
            WHEN ListPrice > 250 AND ListPrice <= 100 THEN 'Entre $251 de $1000'
            ELSE 'Acima de $1000' END Range_preco
FROM Production.Product
ORDER BY productnumber

--ORDERNADO COM CASE WHEN
SELECT BusinessEntityID
      ,SalariedFlag
FROM HumanResources.Employee
ORDER BY CASE WHEN SalariedFlag = 1 THEN BusinessEntityID END DESC,
         CASE WHEN SalariedFlag = 0 THEN BusinessEntityID END ASC
 

--ATUALIZANDO DADOS COM CASE
BEGIN TRANSACTION
  UPDATE HumanResources.Employee
    SET VacationHours = (CASE
                              WHEN (VacationHours - 10.00) < 0 THEN VacationHours + 40
                              ELSE (VacationHours + 20) END)
    OUTPUT deleted.BusinessEntityID
          ,deleted.VacationHours AS Antes
          ,inserted.VacationHours AS Depois
    WHERE SalariedFlag = 0;

ROLLBACK TRANSACTION