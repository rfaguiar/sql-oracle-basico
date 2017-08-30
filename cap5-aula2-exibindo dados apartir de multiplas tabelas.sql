
select * from taluno;

select * from tcontrato;

-- produto cartesiano - errado
select taluno.cod_aluno, taluno.nome, tcontrato.total
from taluno, tcontrato;

-- correto
select taluno.cod_aluno, taluno.nome, tcontrato.total
from taluno, tcontrato
where taluno.COD_ALUNO = tcontrato.COD_ALUNO;-- criterio de uniao

update taluno set nome = 'Marcos'
where cod_aluno = 5;

-- errdo - coluna ambigua
select COD_ALUNO, taluno.nome, tcontrato.total
from taluno, tcontrato
where taluno.COD_ALUNO = tcontrato.COD_ALUNO;

















