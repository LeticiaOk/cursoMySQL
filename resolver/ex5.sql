/*
Uma lista com o nome e nacionalidade de todos os homens que têm Silva
no nome, não nasceram no Brasil e pesam menos de 100Kg
*/

select nome, nacionalidade from gafanhotos
where sexo = 'M' and nome like '%_Silva%' and  nacionalidade not like 'Brasil' and peso < 100.00;