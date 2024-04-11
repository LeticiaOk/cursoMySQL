/*
Quantos gafanhotos homens e quantas mulheres nasceram após 01/jan/2005
*/

select sexo, count(*) from gafanhotos
where nascimento > '2005-01-01'
group by sexo;