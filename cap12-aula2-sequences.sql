create sequence seq_aluno1
start with 60
increment by 2
minvalue 60
maxvalue 100
nocache
nocycle;

--insert com sequence 
insert into taluno (cod_aluno, nome)
  values(seq_aluno1.nextval, 'MASTER TRAINING 2');

select * from taluno;

commit;

--listar sequencias criadas pelo usuario
select * from user_sequences;

--valor atual da sequence
select seq_aluno1.currval from dual;

--alterar sequencia nao possivel alterar o atual valor 
alter sequence seq_aluno1 maxvalue 500;

--sdeletar sequence
drop sequence seq_aluno1;

create sequence seq_aluno1 start with 80;