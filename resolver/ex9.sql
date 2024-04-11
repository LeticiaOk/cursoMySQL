/*
Quantas gafanhotos mulheres têm mais de 1.90m de altura
*/

select count(altura) from gafanhotos where sexo = 'F' and altura > '1.90';
