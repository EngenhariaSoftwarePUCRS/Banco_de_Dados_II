SELECT C.CODIGO AS 'Código Carro'
FROM CARRO C
INNER JOIN VIAGEM V ON C.CODIGO = V.FK_CARRO_CODIGO
INNER JOIN URBANA U ON U.FK_VIAGEM_ID = V.ID
WHERE U.BAIRRO_PARTIDA = 'Floresta';

SELECT P.NOME AS 'Nome Passageiro', C.CODIGO AS 'Codigo Carro'
FROM PASSAGEIRO P
INNER JOIN USA ON USA.FK_PASSAGEIRO_CPF = P.CPF
INNER JOIN VIAGEM V ON V.ID = USA.FK_VIAGEM_ID
INNER JOIN CARRO C ON C.CODIGO = V.FK_CARRO_CODIGO
INNER JOIN URBANA U ON U.FK_VIAGEM_ID = V.ID
WHERE P.BAIRRO = U.BAIRRO_PARTIDA;

SELECT P.CPF AS 'CPF Passageiro', P.NOME AS 'Nome Passageiro', SUM(V.KMS) AS 'Quilômetros Percorridos'
FROM PASSAGEIRO P
INNER JOIN USA ON USA.FK_PASSAGEIRO_CPF = P.CPF
INNER JOIN VIAGEM V ON V.ID = USA.FK_VIAGEM_ID
GROUP BY P.CPF, P.NOME
ORDER BY SUM(V.KMS) DESC;
