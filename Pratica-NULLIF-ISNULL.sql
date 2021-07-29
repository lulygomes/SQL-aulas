USE curso

--Criando table para teste
CREATE TABLE teste2
(
  val1 int
 ,val2 int
)

--Populando tabela teste2
INSERT INTO teste2 values (100,0)
                         ,(100,25)
                         ,(1,0)
                         ,(5,2)

--Verificando dados
SELECT * FROM teste2

--Testando sem tratativa
SELECT val1
      ,val2
      ,(val1/val2) divisão
FROM teste2

--Teste com tratativa
SELECT val1
      ,val2
      ,ISNULL((val1/NULLIF(val2,0)), NULL) Expressão1
      ,ISNULL(CAST(val1 AS decimal(5,2)) / CAST(NULLIF(val2, 0) AS decimal(5,2)), 0) Expressao2
      ,cast(ISNULL(CAST(val1 AS decimal(5,2)) / CAST(NULLIF(val2, 0) AS decimal(5,2)), 0) AS decimal(5,2)) Expressao3
FROM teste2

--Teste NULLIF
USE AdventureWorks2017


SELECT TOP 50
       ProductID
      ,makeflag
      ,FinishedGoodsFlag
      ,NULLIF(makeflag, FinishedGoodsFlag) AS 'Null se igual'
FROM Production.Product


--Teste ISNULL

USE curso

SELECT alunos.id_aluno
      ,alunos.nome
      ,ISNULL(disciplina.nome_disc, 'Não Matriculado') AS Matricula
      ,ISNULL(matricula.id_disciplina, 0) AS Matricula
      ,disciplina.nome_disc
      ,matricula.id_disciplina
FROM alunos
LEFT JOIN matricula
ON alunos.id_aluno = matricula.id_aluno
LEFT JOIN disciplina
ON matricula.id_disciplina = disciplina.id_disciplina

