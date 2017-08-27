--data
select * from dual;

--sysdate retorna data/hora do servidor
select sysdate from dual;

select round(45.925, 2),
  trunc (45.929, 2),
  mod(10,2) as resto_divisao,
  trunc(1.99),
  trunc(1.99,2)
from dual;

select * from tcontrato;

--funcoes data/hora
select data, sysdate, data + 5 from tcontrato;

select sysdate - data as dif_dias from tcontrato;

select trunc(sysdate - data) as dias from tcontrato;

--somar horas em uma data
select sysdate + 2 / 24 as add_horas from tcontrato;

--somar minutos
select sysdate + 15 / 1440 as add_minutos from tcontrato;

select sysdate + 30 / (3600 * 24) as add_segundos from tcontrato;

--trunca a hora ficando 00:00
select trunc(sysdate) from dual;

--diferença de meses entre datas
select months_between(sysdate, sysdate - 90) as dif_mes from dual;

select add_months(sysdate, 5) as adiciona_mes_data from dual;

select next_day(sysdate, 'Quara-feira') as proxima_quarta_data from dual;

select last_day(sysdate) as ultimo_dia_mes from dual;

select round(sysdate, 'Month') as primeiro_dia_proximo_mes from dual;

select trunc(sysdate, 'month') as primeiro_dia_mes_corrente from dual;

--formatação de data

--converter to_char
--dia do mes
select sysdate, to_char(sysdate, 'DD') from dual;

--dia mes e ano, sem hora
select sysdate, to_char(sysdate, 'DD/MM/YYYY') from dual;

--dia e mes
select sysdate, to_char(sysdate, 'DD/MM') from dual;

--mes
select sysdate, to_char(sysdate, 'MM') from dual;

--ANO
select sysdate, to_char(sysdate, 'YYYY') from dual;

--NOME DO MES
select sysdate, to_char(sysdate, 'MONTH') from dual;

--NUMERO DO DIA DA SEMANA
select sysdate, to_char(sysdate, 'D') from dual;

--DIA DA SEMANA ABREVIADO
select sysdate, to_char(sysdate, 'DY') from dual;

--NOME DO DIA DA SEMANA
select sysdate, to_char(sysdate, 'DAY') from dual;

--
select sysdate, to_char(sysdate, 'YEAR') from dual;

--data formatada
select to_char(sysdate, '"NOVO HAMBURGO", fmDay "," DD "de" fmMonth "de" YYYY') from dual;

select to_char(sysdate, 'HH24:MI') Hora_min from dual;

select to_char(sysdate, 'HH24:MI:SS') Hora_min_seg from dual;


select to_char(sysdate, 'DD/MM HH24:MI') data_hora from dual;

select to_char(sysdate, 'DD/MM/YYYY HH24:MI:SS') data_hora_completa from dual;

--outras formatações
--L --> R$
--G --> ponto
--D --> cadas decimais

select * from taluno;

select to_char(salario, 'L99999.99'), to_char(salario, 'L99G999D99') from TALUNO;

select 'R$ '||(round(salario,2)) as salario from taluno;














