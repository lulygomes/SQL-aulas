USE crm;
GO

--EXEMPLO SUBQUERYS
SELECT cli.id_cliente
      ,CONCAT(cli.primeiro_nome, ' ',cli.ultimo_nome) as Nome
      ,cli.sexo
FROM cliente cli
  WHERE cli.id_cliente IN (SELECT car.id_cliente 
                           FROM carro_cliente car
                            WHERE car.ano='2005')


--OUTO EXEMPLO, POREM NÃO RECOMENDADO, POUCO PERFORMÁTICO
SELECT cli.id_cliente
      ,CONCAT(cli.primeiro_nome, ' ',cli.ultimo_nome) as Nome
      ,cli.sexo
FROM cliente cli
  WHERE cli.id_cliente IN (SELECT car.id_cliente 
                           FROM carro_cliente car
                            WHERE car.ano = '2005'
                          AND
                          car.id_carro IN (SELECT mont.id_carro 
                                           FROM carro_montadora mont
                                            WHERE mont.id_montadora = 2
                                           ));


--OUTRO EXEMPLO, AGORA NA PERTE DE CAMPOS DA TABELA
--UTILIZAR EM ULTIMO CASO
SELECT cli.id_cliente
      ,cli.primeiro_nome
      ,cli.ultimo_nome
      ,cli.sexo
      ,(SELECT mont.nome_carro
       FROM carro_montadora mont
       INNER JOIN carro_cliente car
       on mont.id_carro = car.id_carro
       AND cli.id_cliente = car.id_cliente) as nome_carro
FROM cliente cli

--outro exemplo

SELECT cli.id_cliente
      ,cli.primeiro_nome
      ,cli.ultimo_nome
      ,cli.codigo_pais
      ,(SELECT pais.nome_pais
       FROM pais
        WHERE cli.codigo_pais = pais.codigo_pais
       ) AS nome_pais
FROM cliente cli
  --WHERE cli.codigo_pais = 'BR';

--outro exemplo
SELECT cli.id_cliente
      ,cli.primeiro_nome
      ,cli.ultimo_nome
      ,cli.codigo_pais
      ,(SELECT pais.nome_pais from pais WHERE cli.codigo_pais = pais.codigo_pais) as nome_pais
      ,(SELECT TOP 1 idi.idioma FROM idiomas idi WHERE cli.id_cliente = idi.id_cliente) as idioma
FROM cliente cli


--outro exemplo
SELECT mont.id_montadora
      ,mont.nome_carro
      ,(SELECT AVG(carcli.ano) FROM carro_cliente carcli where mont.id_carro = carcli.id_carro) media_ano
      ,(SELECT MAX(carcli.ano) FROM carro_cliente carcli where mont.id_carro = carcli.id_carro) mais_novo
      ,(SELECT MIN(carcli.ano) FROM carro_cliente carcli where mont.id_carro = carcli.id_carro) mais_antigo
      ,(SELECT COUNT(carcli.ano) FROM carro_cliente carcli where mont.id_carro = carcli.id_carro) quantidade
FROM carro_montadora mont

--CRIANDO CENARIO PARA FAZER UPDATE COM SUBSELECT - ADD COLUMN
ALTER TABLE carro_montadora ADD atd int;

--renomeando 
EXEC Sp_rename 'carro_montadora.atd', 'qtd', 'COLUMN'

SELECT * FROM carro_montadora;

--CRIANDO UPDATE PARA qtd DE CARROS QUE OS CLIENTES POSSUEM MODELO 

BEGIN TRANSACTION
  UPDATE carro_montadora SET qtd = ( SELECT COUNT(*) AS qtd 
                                     FROM carro_cliente carcli
                                      INNER JOIN carro_montadora carmont ON
                                      carmont.id_carro = carcli.id_carro
                                      AND carro_montadora.id_carro = carcli.id_carro
                                      group by carcli.id_carro);


-- carreto commit
  COMMIT;

-- erro ROLLBACK
  ROLLBACK

SELECT COUNT(idiomas.idioma) FROM idiomas