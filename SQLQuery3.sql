use crm;

--Operador WHERE

SELECT * FROM cliente
 WHERE codigo_pais = 'BR';

--Operador AND
  SELECT cli.primeiro_nome
         ,cli.ultimo_nome
         ,cli.nascimento
  FROM cliente cli
  WHERE sexo = 'Female'
  AND etnia = 'Eskimo'
  ORDER BY cli.nascimento ASC

  --Operador BETWEEN
  SELECT cli.primeiro_nome
         ,cli.ultimo_nome
         ,cli.nascimento
  FROM cliente cli
  WHERE cli.sexo = 'female'
  AND cli.nascimento BETWEEN '1900-01-01' AND '1990-12-31'

  --OPERADOR IN
	SELECT a.primeiro_nome,
	       a.ultimo_nome,
		   a.id_profissao
    FROM CLIENTE a
	where a.id_profissao in ('91','191','151');

--OPERADOR NOT IN
	SELECT
	       a.primeiro_nome,
	       a.ultimo_nome,
		   a.id_profissao,
		   a.etnia
	 FROM CLIENTE a
	where a.id_profissao not in ('91','191')
	and a.etnia in ('Eskimo','Lumbee');


--LIKE LOCALIZA VALORES QUE CONTENHAM "OR" EM QUALQUER LUGAR

	SELECT a.primeiro_nome,
	       a.ultimo_nome
   FROM   clientea
		WHERE  a.primeiro_nome LIKE '%or%'; 

--LIKE Encontra quaisquer valores que tenham "r" na segunda posição	
	SELECT a.primeiro_nome,
	       a.ultimo_nome
	 FROM   clientea
		WHERE  a.primeiro_nome LIKE '_r%'; 

--LIKE Localiza valores que começam com "a" e possuem pelo menos 3 caracteres de comprimento
	SELECT a.primeiro_nome,
	       a.ultimo_nome 
    FROM   cliente a
		WHERE  a.primeiro_nome LIKE 'A_%_%';

 --LIKE Localiza valores que começam com 'a' e termina com 'o'

  SELECT cli.primeiro_nome
        ,cli.ultimo_nome
        ,cli.cidade
  FROM cliente cli
    WHERE cli.primeiro_nome LIKE 'lu%'

--LIKE Com negativa 
  SELECT cli.primeiro_nome
        ,cli.ultimo_nome
 FROM cliente cli
   WHERE cli.primeiro_nome NOT LIKE '%a%'
   
--LIKE com CORINGA [], 'lui[ZS]' essa função vai econtrar todos os Luiz tanto com Z ou S no final
  SELECT cli.primeiro_nome
        ,cli.ultimo_nome
        ,cli.codigo_pais  
  FROM cliente cli
    WHERE cli.primeiro_nome LIKE 'lui[ZS]'
    

USE curso;

--OPERADOR AND
 SELECT * FROM senso
      WHERE nome_mun LIKE 'T%'
      AND uf = 'SP'
      AND NOT populacao > 100000

--OPERADOR OR
 SELECT * FROM senso
    WHERE populacao < 50000
    AND ( uf = 'AM' OR uf = 'PR' );

USE AdventureWorks2017

--OPERADOR IS NULL
    SELECT TOP 10 FirstName 
          ,LastName
          ,MiddleName
    FROM person.Person
    WHERE MiddleName IS NULL;

    SELECT TOP 10 FirstName 
          ,LastName
          ,MiddleName
    FROM person.Person
    WHERE MiddleName IS not NULL;

--OPERADOR EXISTS
    SELECT a.FirstName
          ,a.LastName    
    FROM person.Person a
    WHERE EXISTS 
    (SELECT *
        FROM HumanResources.Employee b
        WHERE a.BusinessEntityID = b.BusinessEntityID
        AND a.LastName = 'Johnson');

--MESMO EXEMPLO UTILIZANDO IN
    SELECT a.FirstName
          ,a.LastName
    FROM Person.Person a
    WHERE a.LastName IN
    (SELECT a.LastName
      FROM HumanResources.Employee AS b
      WHERE a.BusinessEntityID = b.BusinessEntityID
      AND a.LastName = 'Johnson')


--O exemplo a seguir mostra duas consultas para localizar lojas cujo nome seja igual ao de um fornecedor.
-- A primeira consulta usa EXISTS e a segunda usa =``ANY.
SELECT DISTINCT s.Name  
FROM Sales.Store AS s   
WHERE EXISTS  
(SELECT *  
    FROM Purchasing.Vendor AS v  
    WHERE s.Name = v.Name) ; 

--MESMO EXEMPLO UTILIZANDO ANY

SELECT DISTINCT s.Name  
FROM Sales.Store AS s   
WHERE s.Name = ANY  
(SELECT v.Name  
    FROM Purchasing.Vendor AS v ) ; 

USE curso
--OPERADOR HAVING
  SELECT a.uf
        ,COUNT(a.cod_mun) as qtd_cidades
  FROM senso a
  GROUP BY a.uf HAVING COUNT(a.cod_mun) >100
  order by 2 desc

--OPERADOR HAVING 
  SELECT a.uf 
         ,SUM(a.populacao) as população  
  FROM senso a
  GROUP BY a.uf 
  ORDER BY 2 DESC

  select * from senso