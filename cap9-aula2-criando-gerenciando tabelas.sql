create table TESTE
(
  CODIGO INTEGER NOT NULL PRIMARY KEY,
  DATA DATE DEFAULT SYSDATE
);

INSERT INTO TESTE (CODIGO) VALUES (1);
INSERT INTO TESTE (CODIGO, DATA) VALUES (2, '03/08/2013');

SELECT * FROM TESTE;

--TABELAS CRIADAS PELO USUARIO
SELECT * FROM USER_TABLES;

--TODAS AS TABELAS
SELECT * FROM ALL_TABLES;

--CRIA UMA TABELA APARTIR DE UMA CONSULTA
CREATE TABLE TCONTRATO_VIP
AS
  SELECT * FROM TCONTRATO WHERE TOTAL > 500;

SELECT * FROM TCONTRATO_VIP;

--ADICIONA COLUNA A TABELA
ALTER TABLE TCONTRATO_VIP ADD VALOR NUMBER(5,2);

--ALTERA UMA COLUNA
ALTER TABLE TCONTRATO_VIP MODIFY VALOR NUMBER (8,2);

--ALTERA UMA COLUNA
ALTER TABLE TCONTRATO_VIP MODIFY VALOR NUMBER (12,2) DEFAULT 0;

--RENOMEAR UMA COLUNA
ALTER TABLE TCONTRATO_VIP RENAME COLUMN VALOR TO VALOR2;

--EXCLUIR UMA COLUNA
ALTER TABLE TCONTRATO_VIP DROP COLUMN VALOR2;

--EXCLUIR TABELA
DROP TABLE TCONTRATO_VIP;

--RENOMEAR TABELA
RENAME TCONTRATO_VIP TO TCONTRATO_TOP;

SELECT * FROM TCONTRATO;

