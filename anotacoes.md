# Curso MySQL #03 - Criando o primeiro Banco de Dados

>Bancos de dados são conjuntos de tabelas, tabelas são conjuntos de registros e registros são conjuntos de campos.

## Criando banco de dados:
~~~~mysql
create database cadastro;
~~~~

## Criando tabelas:
~~~~mysql
create table pessoas(

);
~~~~

## Colocando os campos:
~~~~mysql
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
~~~~mysql
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

~~~~mysql
use pessoas;
~~~~

## Mostrando estrutura interna de uma tabela

~~~~mysql
describe pessoas;
~~~~


# Curso MySQL #04 - Melhorando a Estrutura do Banco de Dados

## Apagando banco de dados:

~~~~mysql
drop database cadastro;
~~~~

## Adicionando constraints:

~~~~mysql
create database cadastro
default character set utf8
~~~~

## Adicionando collation:

~~~~mysql
create database cadastro
default character set utf8
default collate utf8_general_ci;
~~~~

> Dessa forma o banco consegue trabalhar com caracteres espceciais e acentuações.

## Aprimorando o banco de dados:
~~~~mysql
create table pessoas(
nome varchar(30) not null,
nascimento date,
sexo enum('M', 'F'),
peso decimal(5,2),
altura decimal (3,2),
nacionalidade varchar(20) default 'Brasil'
)default charset utf8;
~~~~
> Trocado o campo 'idade' por nascimento assim o sistema pode sempre atualizar a idade do usuário de acordo com a data de nascimento. 

> Adicionado 'default charset utf8' para padrão de caracteres especias.

> Adicionado uma constraint em 'nome varchar(30) not null' o valor not null faz se tornar obrigatório o preenchimento daquele campo.

> Adicionado o tipo 'date' em 'nascimento' para colocar a data de nascimento.

> Adicionado 'sexo enum('m', 'f'),' para que apenas sejam aceitam os dois valores entre aspas (m ou f).

> Adicionado 'peso decimal(5,2),'. O 5 reperesenta o número de casas no total e o 2 o número de casas após a virgula.

> Adicionado 'nacionalidade varchar(20) default 'Brasil'' se não colocar nada neste campo o padrão irá ser brasil.

## Colocando os campos entre crases:

~~~~mysql
create table `pessoas`(
`nome` varchar(30) not null,
`nascimento` date,
`sexo` enum('M', 'F'),
`peso` decimal(5, 2),
`altura` decimal(3, 2),
`nacionalidade` varchar(20) default 'Brasil',
) default charset = utf8;
~~~~
 
> Isso permite seremultilizados campos com acentos e espaços apezar de não ser recomendável

## Adcionando campos de chave primária:

~~~~mysql
create table pessoas(
id int not null auto_increment,
nome varchar(30) not null,
nascimento date,
sexo enum('M', 'F'),
peso decimal(5,2),
altura decimal (3,2),
nacionalidade varchar(20) default 'Brasil'
)default charset utf8;
~~~~

> 'id int not null auto_increment,' autoincrementa o campo 'id' de acordo com o número de cadastros. A primeira pessoa vais er id1 a segundo id2 etc.

## Adicionando campos como chave primária

~~~~mysql
create table pessoas(
id int not null auto_increment,
nome varchar(30) not null,
nascimento date,
sexo enum('M', 'F'),
peso decimal(5,2),
altura decimal (3,2),
nacionalidade varchar(20) default 'Brasil',
primary key (id)
)default charset utf8;
~~~~
> O campo 'id' foi adicionado como chave primária.

## Curso MySQL #05 - Inserindo Dados na Tabela (INSERT INTO)

> Todo comando SQL que faz parte para dar definição de estrutura de banco de dados são DDL (Data Definition Language).<br>
>Ex: create database e create table.

## Incluindo dados dentro da tabela

### Adcionando campos dentro de listas:

~~~~mysql
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

~~~~mysql
('1', 'Godofredo', '1984-01-2', 'M', '7.85', '1.83', 'Brasil');
~~~~
### Ligando os campos com os dados:

~~~~mysql
insert into pessoas
(nome, nascimento, sexo, peso, altura, nacionalidade)
values
('Godofredo', '1984-01-02', 'M', '78.5', '1.83', 'Brasil');
~~~~

> Não é necessário colocar o 'id' já que ele já se autoincrementa

### Mostrandos os dados:
~~~~mysql
select * from pessoas;
~~~~

### Técnicas para inserir dados:
> Ao invés de ocutar o id ele pode ser substuido pela constrain 'default':
~~~~mysql
insert into pessoas
(id, nome, nascimento, sexo, peso, altura, nacionalidade)
values
(default, 'Maria', '1989-12-30', 'F', '55.2', '1.65', 'Portugal');

select * from pessoas;
~~~~

> Também pode ser utilizado na nacionalidade:

~~~~mysql
insert into pessoas
(id, nome, nascimento, sexo, peso, altura, nacionalidade)
values
(default, 'Creuza', '1920-12-30', 'F', '50.2', '1.65', default);

select * from pessoas;
~~~~

> Se a ordem dos valores for a mesma dos campos não é necessário especificar os campos no início:

~~~~mysql
insert into pessoas values
(default, 'Adalgiza', '1930-11-2', 'F', '63.2', '1.75', 'Irlanda');

select * from pessoas;
~~~~

> É possível inserir vários dados de uma vez:

~~~~mysql
insert into pessoas values
(default, 'Cláudio', '1975-4-22', 'M', '99.0', '2.15', 'Brasil'),
(default, 'Pedro', '1999-12-3', 'M', '87', '2', default),
(default, 'Janaina', '1987-11-12', 'F', '75.4', '1.66', 'EUA')

select * from pessoas;
~~~~

> Comando de manipulação de dados são considerados DML (Data Manipulation Language)<br>
Ex: Insert Into

# Curso MySQL #06 - Alterando a Estrutura da Tabela (ALTER TABLE e DROP TABLE)

## Alterando estrutura da tabela:

~~~~mysql
alter table pessoas;
~~~~

## Adicionando colunas: 

> Colunas equivalem aos campos da tabela.
~~~~mysql
add column profissao varchar(10);
~~~~

# Removendo colunas:

~~~~mysql
alter table pessoas
drop column profissao;
~~~~

## Escolhendo a posição da coluna

~~~~mysql
alter table pessoas
add column profissao varchar(10) after nome;
~~~~

> Isso coloca a coluna 'profissao' depois da coluna 'nome'

## Adicionando a coluna na primeira posição:

~~~~mysql
alter table pessoas
add column codigo int first;
~~~~

> a palavra 'column' é opcional e pode ser omitida.

## Modificando definições:

~~~~mysql
alter table pessoas
modify column profissao varchar(20) not null;
~~~~

> Aqui foi adicionada uma constraint 'not null' porém como o default do mysql é 'null' para os valores assim que se cria uma coluna, pode ser adicionado o seguinte código:

~~~~mysql
alter table pessoas
modify column profissao varchar(20) not null default '';
~~~~

> Assim o default é definido para vazio ao invés de 'null'.

## Renomeando coluna

~~~~mysql
alter table pessoas
change column profissao prof varchar(20);
~~~~

## Renomenado tabela

~~~~mysql
alter table pessoas
rename to gafanhotos;
~~~~

> Os comando anteriores com o nome antigo da tabela irão resultar em erro.

## Criando mais uma tabela 

> 'if not exists' (se não existir faz algo)

> 'unique' não deixa colocar dos valores do campo com o mesmo nome

> unsigned não deixa colocar sinal nos números assim evitando números negativos e economizando 1 byte

~~~~mysql
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

~~~~mysql
alter table cursos
add primary key (idcurso);
~~~~

## Apagando tabela

~~~~mysql
drop table if exists teste;
~~~~

> O alter table  e o drop table são comandos DDL(comandos de definição) porque mexem na estrutura.

