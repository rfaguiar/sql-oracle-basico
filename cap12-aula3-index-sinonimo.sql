--indices secujndario
select nome from taluno
where nome like '%MA%';

create index ind_taluno_nome1 on taluno(nome);

create index ind_talu_nomecidade
on taluno(nome, cidade);

select nome, cidade from taluno
where nome like '%A%' and cidade like '%A%';

--listar index criados pelo usuario
select * from user_indexes;

--deletar indice
drop index ind_talu_nomecidade;

--sinonimos
--criar
create synonym alu for taluno;

--utilizando
select * from alu;

--deletar
drop synonym alu;