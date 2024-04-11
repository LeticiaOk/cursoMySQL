/*
Uma lista com os dados de todas as mulheres que nasceram no Brasil e que têm
seu nome iniciado com a letra J
*/

select * from gafanhotos
where sexo = 'F' and nacionalidade = 'Brasil' and nome like 'J%'