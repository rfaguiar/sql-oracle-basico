select * from tdesconto;

--savepoint cria ponto de restauração
savepoint upd_b;

update tdesconto set superior = 88
where classe = 'B';

savepoint upd_a;

update tdesconto set superior = 99
where classe = 'A';

--ponto de restauração
savepoint ins_ok;

insert into tdesconto(classe, inferior, superior)
values('&cla', '&inf', '&sup');

select * from tdesconto;

--desfazer usando savepoint
rollback to savepoint ins_ok;
rollback to savepoint upd_a;
rollback to savepoint upd_b;

drop table tdesconto2;

commit;