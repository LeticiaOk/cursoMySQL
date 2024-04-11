/*
Uma lista agrupada pela altura dos gafanhotos, motrando quantas pessoas pesam mais de 100kg e que estão acima da média de altura de todos os cadastros
*/

select altura, count(*) from gafanhotos
where peso > 100
group by altura
having altura > (select avg(altura) from gafanhotos);