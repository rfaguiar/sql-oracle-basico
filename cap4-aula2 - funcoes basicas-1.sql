select nome from taluno;

select concat(cod_aluno, nome) from taluno;

select cod_aluno || nome from taluno;

select nome, initcap(nome) from taluno;

select nome, instr(nome, 'R') from taluno;
--tamanha
select nome, length(nome) from taluno;
--transforma caract em minusculo
select nome, lower(nome) from taluno;
--transforma caract em maiusculo
select nome, upper(nome) from taluno;

select initcap('JOSE DA SILVA') from dual;
--preenche a esquerda
select cod_aluno, lpad(cod_aluno, 5, '0') from taluno;
--preenche a direita
select cod_aluno, rpad(cod_aluno, 8, '0') from taluno;

select nome, rpad(nome, 10, '$') from taluno;

--copia parte de um texo
--substr(campo/texto. posicao, qtde de caracteres)
select nome, substr(nome, 1, 3) from taluno;

select nome, substr(nome, 1, 1) from taluno;

select nome, substr(nome, 3, 1) from taluno;

--substitui as etras r por s
select replace(nome, 'R', 'S') from taluno;

select nome, substr(nome, length(nome), 1) from taluno;

select nome, substr(nome, length(nome) -1, 2) from taluno;

select nome, substr(nome, 3, length(nome) -3) from taluno;










