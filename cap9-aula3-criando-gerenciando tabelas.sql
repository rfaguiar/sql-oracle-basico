--comentario de tabela
comment on table tcontrato is 'Informações de contratos';

--comentario na coluna da tabela
comment on column tcontrato.cod_contrato is 'Código de ocontrato';
comment on column tcontrato.data is 'Data de emissão do contrato';

select * from user_col_comments where table_name = 'TCONTRATO';

select * from user_tab_comments where table_name = 'TCONTRATO';

alter table tcontrato add total2 numeric(8,2);

--desabilita coluna - não e possivel habilitar
alter table tcontrato set unused (total2);

select * from tcontrato;

--excluir colunas desabilitadas
alter table tcontrato drop unused columns;

























