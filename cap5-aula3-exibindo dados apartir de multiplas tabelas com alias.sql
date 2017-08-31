--uniao da tabela de alu com contrato
select alu.COD_ALUNO, alu.NOMe as aluno,
      con.COD_CONTRATO, con.DATA, con.TOTAL
from taluno alu, tcontrato con
where con.COD_ALUNO = alu.COD_ALUNO
  and upper(alu.NOME) like '%'
  order by alu.NOME
;

select * from taluno;
select * from tcontrato;
select * from titem;
select * from tcurso;

select alu.COD_ALUNO, alu.NOME as aluno, con.COD_CONTRATO, con.DATA,
      con.TOTAL, ite.COD_CURSO, cur.NOME as curso, ite.VALOR

from taluno alu, tcontrato con, titem ite, tcurso cur

where alu.COD_ALUNO = con.COD_ALUNO(+) --criterio de uniao
    and con.COD_CONTRATO = ite.COD_CONTRATO(+)
    and ite.COD_CURSO = cur.COD_CURSO(+)
order by con.TOTAL desc
;

insert into taluno values(10, 'PEDRO', 'Novo Hamburgo', null, null, null, null);

create table tdesconto
( CLASSE VARCHAR(1) PRIMARY KEY,
  INFERIOR NUMBER(4,2),
  SUPERIOR NUMBER(4,2)
);

INSERT INTO TDESCONTO VALUES ('A', 00, 10);
INSERT INTO TDESCONTO VALUES ('B', 11, 15);
INSERT INTO TDESCONTO VALUES ('C', 16, 20);
INSERT INTO TDESCONTO VALUES ('D', 21, 25);
INSERT INTO TDESCONTO VALUES ('E', 26, 30);

SELECT * FROM TDESCONTO;

COMMIT;

SELECT * FROM TCONTRATO;

UPDATE TCONTRATO SET DESCONTO = 15 WHERE COD_CONTRATO = 1;
UPDATE TCONTRATO SET DESCONTO = 27 WHERE COD_CONTRATO = 4;

COMMIT;

SELECT CON.COD_CONTRATO AS CONTRATO, DES.CLASSE AS DESCONTO
FROM TCONTRATO CON, TDESCONTO DES
WHERE NVL(CON.DESCONTO, 0) BETWEEN DES.INFERIOR AND DES.SUPERIOR
order by CON.COD_CONTRATO
;

--mostrar cursos vendidos
select cur.COD_CURSO, cur.NOME, ite.VALOR
from tcurso cur, titem ite
where cur.COD_CURSO = ite.COD_CURSO
;

--mostrar cursos nao vendidos
select cur.COD_CURSO, cur.NOME, ite.COD_ITEM
from tcurso cur, titem ite
where cur.COD_CURSO = ite.COD_CURSO(+)
  and ite.COD_ITEM is null
;

select * from tcurso;

insert into tcurso values (6, 'PHP', 1000, 100, null);
insert into tcurso values (7, 'LOGICA', 100, 20, null);

update tcurso set PRE_REQ = 7 where COD_CURSO = 1;
update tcurso set PRE_REQ = 7 where COD_CURSO = 3;
update tcurso set PRE_REQ = 1 where COD_CURSO = 2;
update tcurso set PRE_REQ = 3 where COD_CURSO = 4;

--select de duas tabelas (a mesma tabela)
select curso.NOME as curso, pre_req.NOME as Pre_Requisito
from tcurso curso, tcurso pre_req
where curso.PRE_REQ = pre_req.COD_CURSO
;













