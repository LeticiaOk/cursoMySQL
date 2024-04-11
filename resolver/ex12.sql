/*
Uma lista com os gafanhotos que nasceram fora do Brasil, mostrando o páis de origem e o total de pessoas nascidas lá. Só nos interessam os páises que tieveremmais de 3 gafanhotos com essa nascionalidade
*/

select nacionalidade, count(*) from gafanhotos
where nacionalidade not like ('Brasil')
group by nacionalidade
having count(nacionalidade) > 3;