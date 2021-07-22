--DDL CRIACAO DE TABELA PARA EXERCICIOS
USE curso;
go

CREATE TABLE funcinarios
(
  id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
  nome VARCHAR(50) NOT NULL,
  salario DECIMAL(10,2),
  setor VARCHAR(30)
);

--DML SELECT
--EXEMPLO SELECT
SELECT * FROM funcinarios;

--SELECT retornando apenas obj desejados
SELECT nome
      ,setor
FROM funcinarios;

--SELECT mudando o nome do obj na consulta
SELECT nome
      ,setor as departamento
FROM funcinarios

--DML INSERT
INSERT INTO funcinarios  VALUES ('Luiz', 1000, ''), ('Maria', 2000, ''), ('Antonio', 1500, '');

--OU
INSERT INTO funcinarios (nome, salario) VALUES ('Pedro', 2000);

--Simulado erro 
--Se um cado é definido como int não é possível colocar varchar
INSERT INTO funcinarios (nome, salario) VALUES ('Joao', '1256');

--DML UPDATE
UPDATE funcinarios SET salario = 1000
WHERE id= 1

--OU Aumento de 50% sobre o Salário atual
UPDATE funcinarios SET salario = salario * 1.5
WHERE id=1

--exemplo update com mais de um campo
UPDATE 
funcinarios 
SET salario = salario * 1.5
             ,setor = 'TI'
WHERE id <> '1'

--DML DELETE
DELETE funcinarios
WHERE id='1'

SELECT * FROM funcinarios

