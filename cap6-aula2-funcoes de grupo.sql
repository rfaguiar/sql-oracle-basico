--capitulo 6 aula02 funcoes de grupo
select count(*) AS QTDE_REGISTROS,
      AVG(TOTAL) AS MEDIA,
      ROUND(AVG(TOTAL),2)AS MEDIA,
      MAX(TOTAL) AS MAXIMO,
      MIN(TOTAL) AS MINIMO,
      SUM(TOTAL) AS SOMA,
      MAX(DATA) AS DATA_MAIOR,
      MIN(DATA) AS DATA_MENOR
from tcontrato;

--PROXIMO CODIGO SEQUENCIAL DA TABELA
SELECT MAX(COD_CONTRATO) + 1 AS PROXIMO_CODIGO
FROM TCONTRATO;

select * from tcontrato;

--total de contratos por aluno
select cod_aluno,
      count(*) as qtde_contrato,
      sum(total) as valor_total
from tcontrato
group by cod_aluno;--sem group by ocorre erro

--total de contrato por data
select to_char(trunc(data),'DD/MM/YYYY') as DATA,--funcoes single row, obrigatorio usar groud by
      sum(total) as soma,
      avg(total) as media,
      count(*) as qtde
from tcontrato
group by trunc(data)
order by data desc;





