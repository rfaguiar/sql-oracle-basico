--soma o total de contrato por aluno e mostra somente cujo o menor contrato
--seja maior que o valor medio de curso
select cod_aluno, min(total), sum(total)
from tcontrato
group by cod_aluno
having min(total) > (
    select avg(valor) from tcurso);

--todos os curso que estao na tabela de item vendidos
select cod_curso, nome, valor
from tcurso
where cod_curso in (select cod_curso from titem);

--todos os cursos que nao estado na tabela de item não vendidos
select cod_curso, nome, valor
from tcurso
where cod_curso not in (select cod_curso from titem)
order by nome;

--codigo equivalente a subselect se os valores sao conhecidos
select cod_curso, nome, valor
from tcurso 
where cod_curso in(1, 2, 3, 4);

--equivalente ao anterior
select cod_curso, nome, valor
from tcurso 
where cod_curso = 1
or cod_curso = 2
or cod_curso = 3
or cod_curso = 4;

--todos curso que foram vendidos pelo valor padrao
select * from titem
where (cod_curso, valor) in(select cod_curso, valor from tcurso);

--subconsulta na clausula from
select ite.cod_contrato, ite.valor, ite.cod_curso, 
      cur.cod_curso codigo, cur.valor
from titem ite,
  (select cod_curso, valor from tcurso where valor > 500) cur
where cur.cod_curso = ite.cod_curso;
