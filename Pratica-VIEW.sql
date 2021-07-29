--Criando uma VIEW
USE AdventureWorks2017

CREATE VIEW v_data_contratacao
AS
  SELECT p.FirstName
        ,p.LastName
        ,e.BusinessEntityID
        ,HireDate
  FROM HumanResources.Employee e
  JOIN Person.Person p
  ON e.BusinessEntityID = p.BusinessEntityID


--Select da view
select * from v_data_contratacao

--Select da view com retrição
select * from v_data_contratacao
WHERE YEAR(HireDate) = '2009'


--Alterando a View

ALTER VIEW v_data_contratacao
AS
  SELECT p.FirstName
        ,p.LastName
        ,P.MiddleName       --NOVO CAMPO
        ,e.BusinessEntityID
        ,HireDate Admissao  --ATUALIZADO O NOME DO CAMPO
  FROM HumanResources.Employee e
  JOIN Person.Person p
  ON e.BusinessEntityID = p.BusinessEntityID

  --Select da view com retrição
select * from v_data_contratacao
WHERE YEAR(Admissao) = '2009'

--View com dados Particionados.
--Criação de view com dados de varias tabelas usando UNION ALL

--Create the tables and insert the values. 
use curso
CREATE TABLE fornecedores1              
(              
id_fornec INT PRIMARY KEY CHECK (id_fornec BETWEEN 1 AND 150),             
fornec CHAR(50)              
)
CREATE TABLE fornecedores2              
( 
 id_fornec INT PRIMARY KEY CHECK (id_fornec BETWEEN 151 AND 300),          
 fornec    CHAR(50) )

CREATE TABLE fornecedores3             
(
  id_fornec INT PRIMARY KEY CHECK(id_fornec BETWEEN 301 AND 450),       
  fornec char(50)
 )
CREATE TABLE fornecedores4              
(             
  id_fornec INT PRIMARY KEY CHECK (id_fornec BETWEEN 451 AND 600),             
  fornec    CHAR(50)              
) 

--inserindo valores  
 INSERT  fornecedores1 VALUES  ('1','CaliforniaCorp') 
 INSERT  fornecedores1 VALUES  ('5', 'BraziliaLtd')
  
 INSERT  fornecedores2 VALUES  ('231','FarEast')
 INSERT  fornecedores2 VALUES  ('280','NZ') 

 INSERT  fornecedores3 VALUES  ('321','EuroGroup') 
 INSERT  fornecedores3 VALUES  ('442','UKArchip') 
  
 INSERT  fornecedores4 VALUES  ('475','India') 
 INSERT  fornecedores4 VALUES  ('521','Afrique') 

--simular erro
 INSERT  fornecedores4 VALUES  ('10','India') 
 INSERT  fornecedores4 VALUES  ('25','Afrique') 

 --CRIANDO VIEW
 CREATE VIEW v_fornec_geral
 AS
  SELECT id_fornec
        ,fornec
  FROM fornecedores1
  UNION ALL
  SELECT id_fornec
        ,fornec
  FROM fornecedores2
  UNION ALL
  SELECT id_fornec
        ,fornec
  FROM fornecedores3
  UNION ALL
  SELECT id_fornec
        ,fornec
  FROM fornecedores4

 


 ALTER VIEW v_fornec_geral
 AS
  SELECT 'F1' origem
        ,id_fornec
        ,fornec
  FROM fornecedores1
  UNION ALL
  SELECT 'F2' 
        ,id_fornec
        ,fornec
  FROM fornecedores2
  UNION ALL
  SELECT 'F3'
        ,id_fornec
        ,fornec
  FROM fornecedores3
  UNION ALL
  SELECT 'F4' 
        ,id_fornec
        ,fornec
  FROM fornecedores4