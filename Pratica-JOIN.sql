use curso
--DROP TABLE alunos
--CRIACAO DE TABELA ALUNOS
--DORP TABLE slunos
--DROP TABLE disciplina
--DROP TABLE matricula

CREATE TABLE alunos
(
  id_aluno INT IDENTITY(1,1)
 ,nome VARCHAR(20) NOT NULL
)

CREATE TABLE disciplina
(
  id_disciplina INT IDENTITY(1,1)
 ,nome_disc VARCHAR(20)
);

CREATE TABLE matricula
(
  id_aluno INT
 ,id_disciplina INT
 ,periodo VARCHAR(10)
);

ALTER TABLE matricula ALTER COLUMN id_aluno INT NOT NULL;
ALTER TABLE matricula ALTER COLUMN id_disciplina INT NOT NULL;

--CRIANDO CHAVE PRIMARIA COMPOSTA
ALTER TABLE matricula ADD CONSTRAINT PK_1 PRIMARY KEY (id_aluno, id_disciplina);

--CRIANDO CHAVE PK
ALTER TABLE disciplina ADD CONSTRAINT PK2 PRIMARY KEY (id_disciplina);
ALTER TABLE alunos ADD CONSTRAINT PK1 PRIMARY KEY (id_aluno);

--ADICIONANDO CHAVE ESTRANGEIRA NA TABLEA MATRICULA
ALTER TABLE matricula
ADD CONSTRAINT FK_MAT1 FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno);

ALTER TABLE matricula
ADD CONSTRAINT FK_MAT2 FOREIGN KEY (id_disciplina) REFERENCES disciplina(id_disciplina)

--ISERINDO REGISTRO EM ALUNOS
INSERT INTO alunos VALUES ('Ana'), ('Maria'), ('Luiz'), ('João'), ('Antonio');

SELECT * FROM alunos;

--INSERINDO REGISTRO EM DISCIPLINAS
INSERT INTO disciplina values 
('Física'), ('Quimica'), ('Matemática'), ('Banco de Dados'), ('Programação')

SELECT * FROM disciplina;

--INSERINDO DADOS EM MATRICULAS 
INSERT INTO matricula values ('1', '1', 'Noturno');
INSERT INTO matricula values ('1', '2', 'Vespertino');
INSERT INTO matricula values ('1', '3', 'Matutino');

INSERT INTO matricula values ('2', '3', 'Noturno');
INSERT INTO matricula values ('2', '4', 'Noturno');

INSERT INTO matricula values ('3', '1', 'Noturno');
INSERT INTO matricula values ('3', '3', 'Noturno');
INSERT INTO matricula values ('3', '4', 'Noturno');


INSERT INTO matricula values ('5', '1', 'Matutino');
INSERT INTO matricula values ('5', '2', 'Vespetino');
INSERT INTO matricula values ('5', '4', 'Noturno');

--SIMULANDO ERRO
INSERT INTO matricula VALUES ('6','6','Não Existe')
INSERT INTO matricula values ('5', '4', 'Noturno');

SELECT * FROM matricula;

--ALUNO CODIGO 4 NÃO TEM MATRICULA
--DISCIPLINA 5 NÃO TEM ALUNOS

--INNER JOIN
SELECT alunos.id_aluno
      ,alunos.nome
      ,disciplina.id_disciplina
      ,disciplina.nome_disc
      ,matricula.periodo
FROM alunos
INNER JOIN matricula
ON alunos.id_aluno = matricula.id_aluno
INNER JOIN disciplina
ON matricula.id_disciplina = disciplina.id_disciplina

--LEFT JOIN
SELECT alunos.id_aluno
      ,alunos.nome
      ,disciplina.id_disciplina
      ,disciplina.nome_disc
      ,matricula.periodo
FROM alunos
LEFT JOIN matricula
ON alunos.id_aluno = matricula.id_aluno
LEFT JOIN disciplina
ON matricula.id_disciplina = disciplina.id_disciplina

--RIGHT JOIN
SELECT alunos.id_aluno
      ,alunos.nome
      ,disciplina.id_disciplina
      ,disciplina.nome_disc
      ,matricula.periodo
FROM alunos
RIGHT JOIN matricula
ON alunos.id_aluno = matricula.id_aluno
RIGHT JOIN disciplina
ON matricula.id_disciplina = disciplina.id_disciplina
ORDER BY alunos.id_aluno ASC;

--FULL JOIN
SELECT alunos.id_aluno
      ,alunos.nome
      ,disciplina.id_disciplina
      ,disciplina.nome_disc
      ,matricula.periodo
FROM alunos
FULL JOIN matricula
ON alunos.id_aluno = matricula.id_aluno
FULL JOIN disciplina
ON matricula.id_disciplina = disciplina.id_disciplina


--INNER JOIN
--TESTANDO CONHECIMENTO
USE crm

SELECT cliente.id_cliente
      ,cliente.primeiro_nome
      ,cliente.codigo_pais
      ,carro_cliente.ano
      ,carro_montadora.nome_carro
      ,montadora.nome_montadora
FROM cliente
  JOIN carro_cliente
  ON cliente.id_cliente = carro_cliente.id_cliente

  JOIN carro_montadora
  ON carro_cliente.id_carro = carro_montadora.id_carro

  JOIN montadora
  ON carro_montadora.id_montadora = montadora.id_montadora


--OUTRO TESTE
--INNER JOIN
USE AdventureWorks2017

SELECT Person.BusinessEntityID
      ,Person.FirstName
      ,Employee.JobTitle
      ,Person.PersonType
FROM Person.Person
JOIN HumanResources.Employee
ON Person.BusinessEntityID = Employee.BusinessEntityID

--LEFT JOIN
SELECT Person.BusinessEntityID
      ,Person.FirstName
      ,Employee.JobTitle
      ,Person.PersonType
FROM Person.Person
LEFT JOIN HumanResources.Employee
ON Person.BusinessEntityID = Employee.BusinessEntityID


--RIGHT JOIN
SELECT Person.BusinessEntityID
      ,Person.FirstName
      ,Employee.JobTitle
      ,Person.PersonType
FROM Person.Person
RIGHT JOIN HumanResources.Employee
ON Person.BusinessEntityID = Employee.BusinessEntityID


--FULL JOIN
SELECT Person.BusinessEntityID
      ,Person.FirstName
      ,Employee.JobTitle
      ,Person.PersonType
FROM Person.Person
FULL JOIN HumanResources.Employee
ON Person.BusinessEntityID = Employee.BusinessEntityID

