select * from taluno;

alter table taluno add estado char(2) default 'RS';
alter table taluno add salario number (8,2) default 620;

update taluno set estado = 'AC', salario = 250 where cod_aluno = 1;
update taluno set estado = 'MT', salario = 2000 where cod_aluno = 2;
update taluno set estado = 'sp', salario = 800 where cod_aluno = 5;

select * from taluno;

commit;

select * from taluno 
where estado <> 'RS' and salario <= 800 order by salario desc;

insert into taluno (cod_aluno, nome, cidade)
values (seq_aluno.nextval, 'aldo', 'Quatro irmaos');

insert into taluno (cod_aluno, nome, cidade)
values (seq_aluno.nextval, 'valdo', 'dois irmaos');

select * from taluno;

update taluno set estado = 'SP', salario = 900, nome = 'Pedro'
where cod_aluno = 5;

select estado, salario, nome from taluno
order by estado, salario desc;

alter table taluno add nascimento date default sysdate - 1000;

select sysdate - sysdate - 100 from dual;

select * from taluno;

update taluno set
nascimento = '10/10/2001'
where cod_aluno = 1;

update taluno set
nascimento = '10/10/2000'
where cod_aluno = 2;

select * from taluno;

select cod_aluno, nascimento, trunc(nascimento), nome
from taluno
where trunc(nascimento) = '21/05/2010';

select cod_aluno, nascimento, trunc(nascimento), nome
from taluno
where nascimento between to_date('25/08/2010 22:00', 'DD/MM/YYYY HH24:MI')
and to_date('25/08/2010 23:55', 'DD/MM/YYYY HH24:MI');

select cod_contrato, data, total, desconto, desconto + 1000 as calculo
from tcontrato where total <= desconto + 1000;

select * from tcontrato;

update tcontrato set desconto = null
where cod_contrato = 2;

select * from tcontrato
where desconto is null;

select * from tcontrato
where desconto is not null;

select * from tcontrato where desconto between 0 and 10;

select cod_contrato, total, desconto, nvl(desconto,0)
from tcontrato
where nvl(desconto,0) between 0 and 10;

select * from tcontrato
where desconto > = 0
and desconto <= 10
or desconto is null;

select * from titem
where cod_curso in(1, 2, 3);

select * from titem
where cod_curso not in(1, 2, 3);

select * from titem
where cod_curso not in (1, 2, 3);

insert into tcurso values (5, 'windows', 1000, 50);

select * from tcurso
where cod_curso not in (select cod_curso from titem);

select * from tcurso
where cod_curso in (select cod_curso from titem);

select * from titem
where cod_curso = 1
or cod_curso = 2
or cod_curso = 3;

select * from taluno where nome like '_a%';

select * from tcurso;

commit;

alter table tcurso add pre_req integer;

update tcurso set pre_req = 1
where cod_curso = 2;

update tcurso set pre_req = 3
where cod_curso = 4;

select * from tcurso where pre_req is null;

select * from tcurso where pre_req is not null;

select * from tcurso
where valor > 750
or valor < 1000
and carga_horaria = 25;

select * from tcurso
where (valor > 750 or valor < 1000) and carga_horaria = 25;








