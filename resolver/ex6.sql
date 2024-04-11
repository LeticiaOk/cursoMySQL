/*
Qual é a maior altura entre gafanhotos homens que moram no Brasil
*/

select max(altura) from gafanhotos where sexo = 'M' and nacionalidade = 'Brasil';
