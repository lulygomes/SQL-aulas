use curso

CREATE TABLE matriculados
(
  id_matricula INT PRIMARY KEY NOT NULL,
  aluno        VARCHAR(10) NOT NULL,
  periodo      VARCHAR(10) NOT NULL,
  disciplina   VARCHAR(10) NOT NULL,
)

-- SELECT * FROM information_schema.tables

DECLARE @id_aluno      int
       ,@id_disciplina int    
       ,@aluno_nome    VARCHAR(10)
       ,@periodo       VARCHAR(10)
       ,@disciplina    VARCHAR(10)

DECLARE cr_Matriculados CURSOR FOR
  SELECT alunos.id_aluno
        ,disciplina.id_disciplina
        ,alunos.nome
        ,matricula.periodo
        ,disciplina.nome_disc
  FROM alunos
  JOIN matricula
  on alunos.id_aluno = matricula.id_aluno
  JOIN disciplina
  ON matricula.id_disciplina = disciplina.id_disciplina

OPEN cr_Matriculados;

FETCH NEXT FROM cr_Matriculados INTO @id_aluno
                                 ,@id_disciplina
                                 ,@aluno_nome
                                 ,@periodo   
                                 ,@disciplina

WHILE @@FETCH_STATUS = 0
BEGIN
  SET @id_disciplina = CONCAT(@id_aluno, @id_disciplina)
  INSERT INTO matriculados VALUES (@id_disciplina, @aluno_nome, @periodo, @disciplina)
  
  FETCH NEXT FROM cr_Matriculados INTO @id_aluno
                                 ,@id_disciplina
                                 ,@aluno_nome
                                 ,@periodo   
                                 ,@disciplina
END

CLOSE cr_Matriculados

DEALLOCATE cr_Matriculados


SELECT * FROM matriculados