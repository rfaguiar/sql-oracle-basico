select cod_aluno, nome, cidade 
from taluno;

select cod_aluno as "Código", nome as "Nome do Aluno"
from taluno;

select cidade from taluno;

select distinct cidade from taluno;

select distinct cidade, cod_aluno
from taluno
order by cidade;

select nome as curso,
  valor,
  valor/carga_horaria,
  Round(valor/carga_horaria,2) as valor_hora
from tcurso
order by valor_hora;

select * from tcontrato;

update tcontrato set desconto = null
  where cod_contrato = 4;
  
select cod_contrato,
  total,
  desconto,
  total + desconto
from tcontrato;

select cod_contrato,
  total,
  nvl(desconto, 0),
  total + nvl(desconto, 0) as total_mais_desconto
from tcontrato;

select cod_aluno || ' - ' || nome || ' // ' || cidade as aluno
from taluno
order by cod_aluno;

--tipos:
  integer - 1, 2
  number (5,2) - 999,99
  numeric (5,2) - 999,99
  
  date - '10/03/2011 00:00:00
  
  varchar(10) - 'marcio'
  char(10) - 'marcio'