/*
Uma lista com as profissões dos gafanhotos e seus respectivos quantitativos
*/

select profissao, count(*) from gafanhotos
group by profissao;