create or replace view v_aluno
as
  select cod_aluno as codigo, salario, nome as aluno, cidade
  from taluno
  where estado='RS';
  
select * from v_aluno
order by aluno;

create or replace view v_contrato_top
as
  select cod_contrato, desconto
  from tcontrato
  where desconto >= 10;
  
select * from v_contrato_top;

--nome e conteudo das views
select view_name, text
from user_views;

--view com parameteo de saida
create or replace view v_aluno2(cod, aluno, sal)
as
  select cod_aluno, nome, salario
  from taluno;
  
select * from v_aluno2;

--view complexa
create or replace view v_contrato
as
  select trunc(data) as data,
        max(desconto) maximo,
        avg(desconto) media,
        count(*) qtde
  from tcontrato
  group by trunc(data);
  
select * from v_contrato;

--view simples
create or replace view v_pessoa_f
as
  select cod_pessoa, tipo, nome, cod_rua as rua
  from tpessoa
  where tipo = 'F';
  
select * from v_pessoa_f;

--exemplo de consulta usando view e tabela
select pes.cod_pessoa as codigo,
      pes.nome as pessoa,
      cid.nome as cidade,
      rua.nome as rua
from v_pessoa_f pes, trua rua, tcidade cid
where pes.rua = rua.cod_rua (+)
    and cid.cod_cidade = rua.cod_cidade
order by pes.nome;

--/////////////////////////////////////////

--operacao dml na view
create or replace view vcurso1000ck
as
  select cod_curso, nome, valor
  from tcurso
  where valor = 1000
  with check option constraint vcursos1000_ck;
  
insert into vcurso1000ck (cod_curso, nome ,valor)
  values(52,'teste y', 1000);
  
select * from tcurso;

--delete em view
delete from v_aluno where codigo = 3;

--insert em view
insert into v_aluno
values (50, 500, 'RS', 'MARIA', 'NH');

commit;

--delete em vie
--nao pode fazer dml em view complexa
delete from v_contrato;

--view somente leitura nao permite dml
create or replace view v_aluno3
as
  select cod_aluno codigo, nome aluno, cidade
  from taluno
  where estado = 'RS'
  with read only;
  
--nao pode executar delete em view somente leitura
delete from v_aluno3;

--excluindo view
drop view v_aluno3;