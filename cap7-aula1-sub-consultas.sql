--subconsultas
select cod_contrato data, total
from tcontrato
where total >=
  (select valor from tcurso
    where cod_curso = 3
  );

--errado so pode retornar 1 linha na subconsulta
select cod_contrato data, total
from tcontrato
where total >=
  (select valor from tcurso
    where valor > 500
  );
  
select * from taluno;

--todos os alunos da mesma cidade do aluno 1, menos o aluno 1
select cod_aluno, nome, cidade
from taluno
where cidade = (select cidade from taluno where cod_aluno = 1)
  and cod_aluno <> 1;
  
--todos os alunos da mesma cidade e estado do aluno menos o aluno 1
select cod_aluno, nome, cidade
from taluno
where (cidade, estado) = (
      select cidade, estado from taluno where cod_aluno = 1
    )
  and cod_aluno <> 1;

--soma todos os itens e mostra somente cujo o valor minimo seja maior
--que o valor medio dos cursos
select cod_curso, min(valor), sum(valor), count(*) qtde
from titem
where cod_curso > 0
group by cod_curso
having min(valor) > (
      select avg(valor) from tcurso)
order by cod_curso;
