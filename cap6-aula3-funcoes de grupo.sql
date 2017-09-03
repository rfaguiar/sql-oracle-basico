update tcontrato set desconto = null where cod_contrato = 4;
update tcontrato set desconto = null where cod_contrato = 3;

select count(*) as qtde_registros from tcontrato;

select * from tcontrato;

select count(desconto) as qtde_registros from tcontrato;

select * from taluno;

--qtde de registros com estaod informado
select count(estado) as qtde_registros from taluno;

--qtde de estados diferentes
select count(distinct(estado)) from taluno;

--qtde de registros por estado
select estado, count(*) from taluno group by estado;

select sum(desconto),
      avg(desconto),
      count(desconto),
      round(avg(nvl(desconto, 0)), 2)
from tcontrato;

--total de contrato por estado e data
select alu.estado, trunc(con.data) as data,
      sum(con.total) total, count(*) qtde
from taluno alu, tcontrato con
where alu.COD_ALUNO = con.COD_ALUNO
group by alu.estado, trunc(con.data)
order by alu.estado, data desc;

--having - filtrar coluna com funcao de grupo
select cod_aluno, avg(total) media
from tcontrato
where cod_aluno > 0
having avg(total) > 500
group by cod_aluno
order by cod_aluno;

select trunc(data), sum(total) total
from tcontrato
where cod_contrato > 0
group by trunc(data)
having sum(total) > 500
order by total desc;

--media mais alta por aluno
select max(avg(total))
from tcontrato
group by cod_aluno;--obrigatorio informar por conta do max

--soma dos salarios por estado
select estado, sum(salario) as total
from taluno
group by estado
order by 2 desc;