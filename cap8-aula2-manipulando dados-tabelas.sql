create table TDESCONTO
(CLASSE varchar(2),
  INFERIOR integer,
  SUPERIOR integer);

select * from tdesconto;

--usando variavel de substituição
insert into tdesconto (classe, inferior, superior)
values('&cla', '&inf', '&sup');

select * from tdesconto
where classe = '&cla';

update tdesconto set inferior = '&inf', superior = '&sup'
where classe = '&cla';

delete from tdesconto
where classe = '&cla';

---------------------------------------------------------------

--criar tabela nova copiando estrutura e dados de outra tabela
create table tdesconto2
  as select * from tdesconto;
  
select * from tdesconto2;

commit;

--transação commit/rollback

--deleta todos registros
delete from tdesconto2;

--retorna ultima ação
rollback;

--deleta todos registros da tabela sem opção de roolback
--não tem clausula where
truncate table tdesconto2;

select * from tdesconto2;
