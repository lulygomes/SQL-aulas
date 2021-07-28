
--Listando os top 10 do campeonato
USE curso;
SELECT TOP 10 * FROM campeonato
ORDER BY pontos ASC

--Listando os top 10 monstadora com mais carro
USE CRM
SELECT TOP 10 mont.nome_montadora
           ,COUNT(carmont.id_carro) AS qtd_carro
FROM montadora mont
  INNER JOIN carro_montadora carmont
  ON mont.id_montadora = carmont.id_montadora
  GROUP BY mont.nome_montadora
  ORDER BY 2 DESC


--Listando top 10 maiores cidades
USE curso;
SELECT TOP 10 *
FROM senso
ORDER BY populacao DESC


SELECT TOP 10 *
       ,RANK() OVER(ORDER BY populacao DESC) AS posicao
FROM senso
ORDER BY populacao DESC







