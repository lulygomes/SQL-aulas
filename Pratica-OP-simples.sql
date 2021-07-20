--setando o banco de dados 
  use curso

--Usando operador =
  SELECT * FROM senso
  WHERE uf='SP';

/*
  O banco de dados pode ter a busca por Case sensitive ou insensitive
  Isso depende a configuração de Collate do banco
  Mesma coisa para palavras com o sem acento
*/

  SELECT * FROM senso
  WHERE nome_mun = 'Tupã'

  SELECT * FROM senso
  WHERE nome_mun = 'Tupa'

-- Operador = com AND
  SELECT * FROM senso
  WHERE nome_mun = 'Dourado'
  AND uf = 'sp'

-- Usando operador > 100000
  SELECT * FROM senso
  WHERE populacao > 100000
--  AND uf = 'SP'

-- Usando operador <=
  SELECT * FROM senso
  WHERE populacao <= 100000

-- Usando operador >=
  SELECT * FROM senso
  WHERE populacao >= 100000

-- Usando operador <> 
  SELECT * FROM senso
  WHERE uf <> 'SP'
  AND uf <> 'RJ'

--Combinando Operadores
  SELECT * FROM senso
  WHERE populacao <= 100000
    AND populacao >= 50000
    AND uf = 'SP'
    AND nome_mun <> 'Vinheco';