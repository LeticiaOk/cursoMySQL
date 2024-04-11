/*
Qual é o menor peso entre as gafanhotas mulheres que nasceram fora do Brasil
e entre 01/jan/1990 e 31/dez/2000?
*/

select min(peso) from gafanhotos where sexo = 'F' and nacionalidade not like 'Brasil' and nascimento between '1990-01-01' and '2000-12-31';
