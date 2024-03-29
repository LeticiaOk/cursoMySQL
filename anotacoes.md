# Curso MySQL #03 - Criando o primeiro Banco de Dados

>Bancos de dados são conjuntos de tabelas, tabelas são conjuntos de registros e registros são conjuntos de campos.

## Criando banco de dados:
~~~~sql
create database cadastro;
~~~~

## Criando tabelas:
~~~~sql
create table pessoas(

);
~~~~

## Colocando os campos:
~~~~sql
create table pessoas(
nome,
idade,
sexo,
peso,
altura,
nacionalidade
);
~~~~

## Tipos primitivos

### 1. Numérico
#### Inteiro:
* TinyInt
* SmallInt
* Int
* MediumInt
* BigInt

> A diferença entre estes tipos numéricos é a quatidade de bytes que vai ser utilizado para armazenar os dados.

#### Real:
* Decimal
* Float
* Double
* Real

> A diferença entre estes tipos numéricos é a quatidade de bytes que vai ser utilizado para armazenar os dados.

#### Lógico
* Bit
* Boolean

> Guarda valores como true ou false.


### 2. Data/tempo
* Date
* DateTime
* TimeStamp
* Time
* Year

> Gurda valores de tempo como data, hora, ano etc.

### 3. Literal
#### Caractere:
* Char 
>Coloca espaços fixos. Ex: armazena o campo 'nome' com 30 espaços independente do números de letras.
* VarChar
>Armazena o campo 'nome' de acordo com o número de letras.

#### Texto:
* TinyText
* Text
* MediumText
* LongText

> O tipo primitivo 'Texto' é para textos longos.
> ''Caractere' são para conteúdos menores como nome, telefone e endereço.

####  Binário:
* TinyBlob
* Blob
* MediumBlob
* LongBlob

> O tipo Blob permite guardar qualquer coisa em binário como uma imagem apesar de nãos ser ecomendado guardar imagens dentro de um banco de dados.

#### Coleção:
* Enum
* Set
> Serve para configurar quais são os valores permitidos e na hora do cadastro ele só vai aceitar estes valores.

### 4. Espacial
* Geometry
* Point
* Polygon
* MultiPolygon

> O tipo espacial permite guardar informações sobre volumétricos.

## Colocando tipos para cada um dos campos:
~~~~sql
create table pessoas(
nome varchar(30),
idade tinyint,
sexo char(1),
peso float,
altura float,
nacionalidade varchar(20)
);

~~~~
> Em 'idade, tinyint(3)' não precisa colocar o 3 entre parênteses

> Em ' sexo, char(1)' irá ser guardar uma letra independente se estiver preenchido ou não.

> O símbolo de ponto e vírgula indica o fim do comando

## Selcionando banco de dados

~~~~sql
use pessoas;
~~~~

## Mostrando estrutura interna de uma tabela

~~~~sql
describe pessoas;
~~~~

ou

~~~~sql
desc pessoas;
~~~~

# Curso MySQL #04 - Melhorando a Estrutura do Banco de Dados

## Apagando banco de dados:

~~~~sql
drop database cadastro;
~~~~

## Adicionando constraints:

~~~~sql
create database cadastro
default character set utf8
~~~~

## Adicionando collation:

~~~~sql
create database cadastro
default character set utf8
default collate utf8_general_ci;
~~~~

> Dessa forma o banco consegue trabalhar com caracteres espceciais e acentuações.

## Aprimorando o banco de dados:
~~~~sql
create table pessoas(
nome varchar(30) not null,
nascimento date,
sexo enum('M', 'F'),
peso decimal(5,2),
altura decimal (3,2),
nacionalidade varchat(20) default 'Brasil'
)default charset utf8;
~~~~
> Trocado o campo 'idade' por nascimento assim o sistema pode sempre atualizar a idade do usuário de acordo com a data de nascimento. 

> Adicionado 'default charset utf8' para padrão de caracteres especias.

> Adicionado uma constraint em 'nome varchar(30) not null' o valor not null faz se tornar obrigatório o preenchimento daquele campo.

> Adicionado o tipo 'date' em 'nascimento' para colocar a data de nascimento.

> Adicionado 'sexo enum('m', 'f'),' para que apenas sejam aceitam os dois valores entre aspas (m ou f).

> Adicionado 'peso decimal(5,2),'. O 5 reperesenta o número de casas no total e o 2 o número de casas após a virgula.

> Adicionado 'nacionalidade varchat(20) default 'Brasil'' se não colocar nada neste campo o padrão irá ser brasil.

## Colocando os campos entre crases:

~~~~sql
create table `pessoas`(
`nome` varchar(30) not null,
`nascimento` date,
`sexo` enum('M', 'F'),
`peso` decimal(5, 2),
`altura` decimal(3, 2),
`nacionalidade` varchar(20) default 'Brasil',
) default charset = utf8;
~~~~
 
> Isso permite serem ultilizados campos com acentos e espaços apezar de não ser recomendável

## Adcionando campos de chave primária:

~~~~sql
create table pessoas(
id int not null auto_increment,
nome varchar(30) not null,
nascimento date,
sexo enum('M', 'F'),
peso decimal(5,2),
altura decimal (3,2),
nacionalidade varchat(20) default 'Brasil'
)default charset utf8;
~~~~

> 'id int not null auto_increment,' autoincrementa o campo 'id' de acordo com o número de cadastros. A primeira pessoa vais er id1 a segundo id2 etc.

## Adicionando campos como chave primária

~~~~sql
create table pessoas(
id int not null auto_increment,
nome varchar(30) not null,
nascimento date,
sexo enum('M', 'F'),
peso decimal(5,2),
altura decimal (3,2),
nacionalidade varchat(20) default 'Brasil',
primary key (id)
)default charset utf8;
~~~~
> O campo 'id' foi adicionado como chave primária.

## Curso MySQL #05 - Inserindo Dados na Tabela (INSERT INTO)

> Todo comando SQL que faz parte para dar definição de estrutura de banco de dados são DDL (Data Definition Language).<br>
>Ex: create database e create table.

## Incluindo dados dentro da tabela

### Adcionando campos dentro de listas:

~~~~sql
create database cadastro
default character set utf8
default collate utf8_general_ci;

create table `pessoas`(
`id` int not null auto_increment,
`nome` varchar(30) not null,
`nascimento` date,
`sexo` enum('M', 'F'),
`peso` decimal(5, 2),
`altura` decimal(3, 2),
`nacionalidade` varchar(20) default 'Brasil',
primary key (id)
) default charset = utf8;


(id, nome, nascimento, sexo, peso, altura, nacionalidade)
~~~~
### Adcionando valores dentro de listas:

~~~~sql
('1', 'Godofredo', '1984-01-2', 'M', '7.85', '1.83', 'Brasil');
~~~~
### Ligando os campos com os dados:

~~~~sql
insert into pessoas
(nome, nascimento, sexo, peso, altura, nacionalidade)
values
('Godofredo', '1984-01-02', 'M', '78.5', '1.83', 'Brasil');
~~~~

> Não é necessário colocar o 'id' já que ele já se autoincrementa

### Mostrandos os dados:
~~~~sql
select * from pessoas;
~~~~

### Técnicas para inserir dados:
> Ao invés de ocutar o id ele pode ser substuido pela constrain 'default':
~~~~sql
insert into pessoas
(id, nome, nascimento, sexo, peso, altura, nacionalidade)
values
(default, 'Maria', '1989-12-30', 'F', '55.2', '1.65', 'Portugal');

select * from pessoas;
~~~~

> Também pode ser utilizado na nacionalidade:

~~~~sql
insert into pessoas
(id, nome, nascimento, sexo, peso, altura, nacionalidade)
values
(default, 'Creuza', '1920-12-30', 'F', '50.2', '1.65', default);

select * from pessoas;
~~~~

> Se a ordem dos valores for a mesma dos campos não é necessário especificar os campos no início:

~~~~sql
insert into pessoas values
(default, 'Adalgiza', '1930-11-2', 'F', '63.2', '1.75', 'Irlanda');

select * from pessoas;
~~~~

> É possível inserir vários dados de uma vez:

~~~~sql
insert into pessoas values
(default, 'Cláudio', '1975-4-22', 'M', '99.0', '2.15', 'Brasil'),
(default, 'Pedro', '1999-12-3', 'M', '87', '2', default),
(default, 'Janaina', '1987-11-12', 'F', '75.4', '1.66', 'EUA')

select * from pessoas;
~~~~

> Comando de manipulação de dados são considerados DML (Data Manipulation Language)<br>
> Ex: Insert Into

# Curso MySQL #06 - Alterando a Estrutura da Tabela (ALTER TABLE e DROP TABLE)

## Alterando estrutura da tabela:

~~~~sql
alter table pessoas;
~~~~

## Adicionando colunas: 

> Colunas equivalem aos campos da tabela.
~~~~sql
add column profissao varchar(10);
~~~~

# Removendo colunas:

~~~~sql
alter table pessoas
drop column profissao;
~~~~

## Escolhendo a posição da coluna

~~~~sql
alter table pessoas
add column profissao varchar(10) after nome;
~~~~

> Isso coloca a coluna 'profissao' depois da coluna 'nome'

## Adicionando a coluna na primeira posição:

~~~~sql
alter table pessoas
add column codigo int first;
~~~~

> a palavra 'column' é opcional e pode ser omitida.

## Modificando definições:

~~~~sql
alter table pessoas
modify column profissao varchar(20) not null;
~~~~

> Aqui foi adicionada uma constraint 'not null' porém como o default do mysql é 'null' para os valores assim que se cria uma coluna, pode ser adicionado o seguinte código:

~~~~sql
alter table pessoas
modify column profissao varchar(20) not null default '';
~~~~

> Assim o default é definido para vazio ao invés de 'null'.

## Renomeando coluna

~~~~sql
alter table pessoas
change column profissao prof varchar(20);
~~~~

## Renomenado tabela

~~~~sql
alter table pessoas
rename to gafanhotos;
~~~~

> Os comando anteriores com o nome antigo da tabela irão resultar em erro.

## Criando mais uma tabela 

> 'if not exists' (se não existir faz algo)

> 'unique' não deixa colocar dos valores do campo com o mesmo nome

> unsigned não deixa colocar sinal nos números assim evitando números negativos e economizando 1 byte

~~~~sql
create table if not exists cursos (
nome varchar(30) not null unique,
descricao text,
carga int unsigned,
totaulas int unsigned,
ano year default '2024'
) default charset=utf8;

describe cursos;
~~~~

## Adicionando chave primaária

~~~~sql
alter table cursos
add primary key (idcurso);
~~~~

## Apagando tabela

~~~~sql
drop table if exists teste;
~~~~

> O alter table  e o drop table são comandos DDL (comandos de definição) porque mexem na estrutura.

# Curso MySQL #07 - Manipulando Linhas (UPDATE, DELETE e TRUNCATE)


> Linhas, tuplas e registros são a mesma coisa em MySQL.

> Campos, atributos e colunas são a mesma coisa em MySQL.

## Adicionando registros:

~~~~sql
insert into cursos values
('1', 'HTML5', 'Curso de HTML5', '40', '37', '2014'),
('2', 'Algorítimos', 'Lógica de Programação','20','15','2014'),
('3', 'Photoshop', 'Dicas de Photoshop CC','10','8','2014'),
('4', 'PGP', 'Curso de PHP para iniciantes','40,','20','2010'),
('5', 'Jarva', 'Introdução a Linguagem Java','10','29','2000'),
('6', 'MySQL', 'Banco de Dados MySQL','30','15','2016'),
('7', 'Word', 'Curso Completo de Word','40','30','2016'),
('8', 'Sapateado', 'Danças Rítmicas','40','30','2018'),
('9', 'Cozinha Árabe', 'Aprenda a fazer Kibe','40','30','2018'),
('10', 'Youtuber', 'Gerar polêmica e ganhar inscritos','5','2','2018');
~~~~

## Modificando linhas Incorretas:

~~~~sql
update cursos // atualize
set nome = 'HTML5' // configure
Where idcurso = '1'; // onde
~~~~

> Usa a chave primária 'idcurso = '1' porque só tem uma linha com o idcurso = 1. A partir disto é possivel identificar a linha onde se quer fazer a alteração.

> Dessa forma 'HTML4'da tabela vai ser substituido por 'HTML5'.

## Modificando mais de um valor ao mesmo tempo

~~~~sql
update cursos 
set nome = 'PHP', ano = 2015  
where idcurso = '4';
~~~~

> Apenas adicionando a virgula e o valor que deseja alterar já se pode alterar mais DE um valor ao mesmo tempo

> Dessa forma o valor de nome e ano foram alterados.

## Modificando linhas de forma limitada 

~~~~sql
update cursos 
set nome = 'JAVA', ano = 2015 , carga = '40' 
where idcurso = '5'
limit 1;
~~~~

> dessa forma usando o limit apenas 1 linha será afetada

## Modificando linhas de forma ilimitada

> Habilitar a permissão para modificar mais de uma linha ao mesmo tempo no MySQL:<br>
> edit > preferences > SQL editor > safe updates > desabilitar > reconectar

~~~~sql
update cursos 
set ano = '2050', carga = '800' 
where ano = '2018';
~~~~

> dessa forma todas as linhas com o ano  = 2018 serão afetadas.

> Se usasse o 'limit 1' afetaria apenas a primeira linha.

## Removendo linhas

~~~~sql
delete from cursos
where idcurso = '8';
~~~~

> Apaga a linha pelo id

## Deletando mais de uma linha ao mesmo tempo

~~~~sql
delete from cursos
where ano = '2050'
limit 2;
~~~~

> Usando o limit para limitar o número de linhas que serão apagadas.

## Removendo todas as linhas de uma tabela

~~~~sql
truncate cursos;
~~~~

### Comandos DDL (Data Definition Language):

* create database
* create table
* alter table
* drop table

### Comando DML (Data Manipulation Language)

* Insert into
* update
* delete
* truncate

# Curso MySQL #08 - Gerenciando Cópias de Segurança MySQL

## Exportando:
> Server > Data Export > selecionar banco de dados > Export to Self-Contained File > Include Create Schema > Start Export.

## Abrindo arquivo:
> documentos > dumps > arquivo msql.

## Importando:
> Server > Data Import > Import to Self-Contained File > ... > seleciona o arquivo msql > Start Import > refresh.

> Dump é a mesma coisa que criar uma cópia de um banco de dados.

## Mostrando tabelas:

~~~~sql
show tables;
~~~~

# Curso MySQL #09 - PHPMyAdmin (Parte 1)

> Comando no shell para usar comandos sql:<br>
>mysql -h localhost -u root -p

## Comandos para usar no shhell 

### Mostrar bancos de dados:

> show databases;

### Ver qual banco está ativo no momento:

> status;

### Ativar banco de dados:

> use cadastro;

### Mostrar tabelas:
> show tables;

> Usar seta para cima e para baixa volta no histórico de comandos.

# Curso MySQL #10 - PHPMyAdmin (Parte 2)

## Comando para mostar como foi criada a tabela com os valores:

~~~~sql
show create table amigos;
~~~~

### Mostra:

~~~~sql
 CREATE TABLE `amigos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `telefone` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nome` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci
~~~~

## Comando para mostrar como foi criado o banco de dados


~~~~sql
show create database exemplo;
~~~~

### Mostra:

~~~~sql
+----------+------------------------------------------------------------------------------------------+
| Database | Create Database                                                                          |
+----------+------------------------------------------------------------------------------------------+
| exemplo  | CREATE DATABASE `exemplo` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */ |
+----------+------------------------------------------------------------------------------------------+
~~~~

## Gerando/exportando DUMP no phpmyadmin

> casinha > Personalizada - exibir todas as opções possíveis > selecionar opção > Executar

## Apagando banco de dados

> casinha > base de dados > selecionar o banco de dados > elimina

# Curso MySQL #11 - SELECT (Parte 1)

## Ordenando colunas pelo nome (ordem alfabética):

~~~~sql
select * from cursos
order by nome;
~~~~

## Ordenando colunas pelo nome de forma inversa:

~~~~sql
select * from cursos
order by nome desc;
~~~~

> Se no lugar de 'desc' for colocado 'asc' a ordem alfabética voltará a ser normal.

## Selecionando colunas:

~~~~sql
select nome, carga, ano from cursos;
~~~~

> Isso mostra apenas as colunas informadas e seus valores.

### Invertendo a ordem das colunas selecionadas:

~~~~sql
  select ano, nome, carga from cursos;
~~~~

### Ordenando colunas selecionadas pelo ano:

~~~~sql
select ano, nome, carga from cursos
order by ano;
~~~~

### Ordenando colunas selecionadas pelo ano e pelo nome:

~~~~sql
select ano, nome, carga from cursos
order by ano, nome;
~~~~

## Selecionando linhas

~~~~sql
select * from cursos
where ano = '2016'
order by nome;
~~~~

> Isso mostra todas as linhas com ano igual '2016'.

## Selecionando linhas e colunas

~~~~sql
select nome, carga from cursos
where ano = '2016'
order by nome;
~~~~

> A coluna do ano não irá ser processada a não ser que coloque no select.

## Selecionando linhas e colunas com operadores relacionais:

~~~~sql
select nome, descricao from cursos
where ano <= 2015
order by nome;
~~~~

> Dessa forma apenas as linhas com ano menor ou igual a 2016 irão ser processadas.

> Observação: o número 2016 não precisa estar entre aspas

> Aceita operadores: =, <, >, <=, =>
