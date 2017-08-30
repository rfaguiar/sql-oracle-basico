select total,
  desconto,
  desconto + total,
  nvl(desconto, 0),
  nvl(desconto, 0) + total,
  nvl2(desconto, total, -1)
from tcontrato;

update taluno set nome = null where cod_aluno = 5;

select cod_aluno, nvl(nome, 'SEM NOME') from taluno;

select * from taluno;

update taluno set estado = 'SC' where cod_aluno = 3;
update taluno set estado = 'RJ' where cod_aluno = 5;

select nome, estado,
  case
    when estado = 'RS' then 'GAUCHO'
    when upper(estado) = 'AC' THEN 'NAO EXISTE'
    when Estado = 'RJ' and salario > 500 then 'CARIOCA'
    else 'OUTROS'
  end as apelido
from taluno;

-- alternatva ao case
select nome, estado,
  decode (estado, 'RS', 'GAUCHO',
                  'AC', 'ACREANO',
                  'SP', 'PAULISTA',
                        'OUTROS') AS apelido
from taluno;