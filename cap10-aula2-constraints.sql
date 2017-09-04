select * from user_constraints;

select * from all_constraints;

--taluno 
--    cod_aluno - pk; - > chave primaria - > primary key

--tcontrato cod_contrato - pk - > chave primaria - > primary key
--  cod_aluno - FK -> chave primaria que vem de outra tabela

--chave primaria
create table tcidade(
  cod_cidade integer not null,
  nome varchar(40),
  constraint pk_cidade primary key(cod_cidade)
);

--chave primaria composta
create table tbairro(
  cod_cidade integer not null,
  cod_bairro integer not null,
  nome varchar2(40),
  constraint pk_bairro primary key(cod_cidade, cod_bairro)
);

--adicionando chave estrageira
alter table tbairro
  add constraint fk_cod_cidade
    foreign key (cod_cidade)
    references tcidade(cod_cidade);
    
create table trua(
  cod_rua integer not null,
  cod_cidade integer,
  cod_bairro integer,
  nome varchar2(40),
  constraint pk_rua primary key(cod_rua)
);

--chave estrangeira composta
alter table trua add constraint fk_cidadebairro
  foreign key(cod_cidade, cod_bairro)
  references tbairro(cod_cidade, cod_bairro);
  

create table tpessoa(
  cod_pessoa integer not null,
  tipo varchar2(1) not null,
  nome varchar2(30) not null,
  pessoa varchar2(1) not null,
  cod_rua integer not null,
  cpf varchar2(15),
  constraint pk_pessoa primary key (cod_pessoa)
);

--unique key
alter table tpessoa add constraint uk_cpf unique(cpf);

alter table tpessoa add constraint fk_pessoa_rua
  foreign key (cod_rua)
  references trua(cod_rua);

--cidade
insert into tcidade values (1, 'novo hamburgo');
insert into tcidade values (2, 'ivoti');
insert into tcidade values (3, 'sapiranga');
insert into tcidade values (4, 'taquara');

--bairro
insert into tbairro values (1, 1, 'centro');
insert into tbairro values (2, 1, 'rio branco');
insert into tbairro values (3, 1, 'centro');
insert into tbairro values (4, 1, 'fritz');
insert into tbairro values (5, 1, 'amaral');-- erro constraint
insert into tbairro values (6, 1, 'empresa');--erro constraint

--rua
insert into trua values (1, 1, 1, 'marcilio dias');
insert into trua values (2, 2, 1, 'fritz');
insert into trua values (3, 3, 1, 'jacobina');
insert into trua values (4, 3, 1, 'joao da silva');

--check
alter table tpessoa add constraint ck_pessoa_tipo
  check (tipo in ('C', 'F'));
  
alter table tpessoa add constraint ck_pessoa_1jf
  check (pessoa in ('J', 'F'));
  
--excluir constraint
alter table tpessoa drop constraint nome_contraint;

insert into tpessoa values(1, 'C', 'MARCIO', 'F', 1, '1234');
insert into tpessoa values(2, 'R', 'BEATRIZ', 'F', 2, '125');--erro tipo errado
insert into tpessoa values(3, 'F', 'PEDRO', 'F', 4, '123');
insert into tpessoa values(4, 'F', 'MARIA', 'J', 5, '123');--erro cpf unico

--excluir chave estrangeira
alter table tpessoa drop constraint nome_da_constraint
  cascade constraint;
  
--check
alter table tcontrato add constraint ck_contrato_desconto
check (desconto between 0 and 30);

--desabilitar/habilitar constraint
alter table tpessoa disable constraint uk_cpf;
alter table tpessoa enable constraint uk_cpf;

--excluir constraint
alter table tpessoa drop constraint uk_cpf;

--listar constraint de uma tabela  
select * from user_constraints
where table_name = 'TPESSOA';

select object_name, object_type
from user_objects
where object_name in ('TPESSOA');

commit;