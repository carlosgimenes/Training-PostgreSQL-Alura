/*
-------------------------------------------------------------------------------------------------------------------------
	Title		:	Training-PostgreSQL-Alura
-------------------------------------------------------------------------------------------------------------------------
	Author		:	Gimenes
	Date		:	09/04/2025
	Requester	:	Gimenes
	Purpose		:	Testar conhecimento adquirido
-------------------------------------------------------------------------------------------------------------------------
*/

/*
-------------------------------------------------------------------------------------------------------------------------
	Módulo 1 - Primeiros passos com PostgreSQL
-------------------------------------------------------------------------------------------------------------------------
*/

-- Testando funcionamento do PostgreSQL
-- ====================================
SELECT
	NOW();

-- Retorno
/*
"2025-04-17 14:45:56.584795+00"
*/

-- Criando o Banco de Dados "alura"
-- ================================
CREATE DATABASE ALURA;

-- Listando os Bancos de Dados
-- ===========================
SELECT
	DATNAME
FROM
	PG_DATABASE;

-- Retorno
/*
"postgres"
"template1"
"template0"
"alura"
*/

-- Excluindo o Banco de Dados "alura"
-- ==================================
DROP DATABASE alura;


-- ============================
-- Tipos de Dados no PostgreSQL
-- ============================
/*

Tipos Numéricos

integer
real
serial
numeric

Tipos de Texto

varchar(n)
char(n)
text

Tipo Booleano

boolean

Tipos de Data e Hora

date
time
timestamp
*/

-- Agora que vimos os principais Tipos de Dados, iremos criar nossa primeira tabela

-- Criando a Tabela aluno
-- ======================

CREATE TABLE aluno(
    id SERIAL,
    nome VARCHAR(255),
    cpf CHAR(11),
    observacao TEXT,
    idade INTEGER,
    dinheiro NUMERIC(10,2),
    altura REAL,
    ativo BOOLEAN,
    data_nascimento DATE,
    hora_aula TIME,
    matriculado_em TIMESTAMP
);

-- Listando os dados da Tabela
-- ===========================
SELECT * FROM aluno;

-- Excluindo uma Tabela
-- ====================
DROP TABLE aluno;


/*
================
O que aprendemos
================
Nesta aula, aprendemos:

# Como instalar o PostgreSQL e o pgAdmin
# Como conectar ao PostgreSQL, utilizando o terminal e o pgAdmin
# A criar o banco de dados pelo terminal e pelo pgAdmin
# Como apagar o banco de dados pelo terminal e pelo pgAdmin
# A criar tabela com os tipos de dados mais comuns:
	# SERIAL
	# VARCHAR
	# CHAR
	# TEXT
	# INTEGER
	# NUMERIC
	# BOOLEAN
	# DATE
	# TIME
	# TIMESTAMP
*/


/*
-------------------------------------------------------------------------------------------------------------------------
	Módulo 2 - Executando operações CRUD
-------------------------------------------------------------------------------------------------------------------------
*/

-- Incluindo um registro na tabela
-- ===============================

INSERT INTO aluno (
    nome,
    cpf,
    observacao,
    idade,
    dinheiro,
    altura,
    ativo,
    data_nascimento,
    hora_aula,
    matriculado_em
) VALUES (
    'Diogo',
    '12345678901',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ac dui et nisl vestibulum consequat. Integer vitae magna egestas, finibus libero dapibus, maximus magna. Fusce suscipit mi ut dui vestibulum, non vehicula felis fringilla.',
    35,
    100.50,
    1.81,
    TRUE,
    '1984-08-27',
    '17:30:00',
    '2020-02-08 12:32:45'
);


-- Visualizando registro incluido na tabela
-- ========================================
SELECT * FROM aluno;

-- Retorno
/*
2	"Diogo"	"12345678901"	"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ac dui et nisl vestibulum consequat. Integer vitae magna egestas, finibus libero dapibus, maximus magna. Fusce suscipit mi ut dui vestibulum, non vehicula felis fringilla. Vestibulum eget massa blandit, viverra quam non, convallis libero. Morbi ut nunc ligula. Duis tristique purus augue, nec sodales sem scelerisque dignissim. Sed vel rutrum mi. Nunc accumsan magna quis tempus rhoncus. Duis volutpat nulla a aliquet feugiat. Vestibulum rhoncus mi diam, eu consectetur sapien eleifend in. Donec sed facilisis velit. Duis tempus finibus venenatis. Mauris neque nisl, pulvinar eu volutpat eu, laoreet in massa. Quisque vestibulum eros ac tortor facilisis vulputate. Sed iaculis purus non sem tempus mollis. Curabitur felis lectus, aliquam id nunc ut, congue accumsan tellus."	35	100.50	1.81	true	"1984-08-27"	"17:30:00"	"2020-02-08 12:32:45"
*/

-- Atualizando um registro na tabela
-- =================================

/*
Primeiramente, vamos selecionar os dados da tabela utilizando o SELECT * FROM. É fundamental usar o WHERE para filtrar os 
registros que serão atualizados, evitando alterações em todos os dados. No nosso caso, utilizaremos o campo id como filtro. 
Atualmente temos apenas uma entrada, mas ao trabalhar com várias, esse comando retornará apenas o registro específico.
*/

SELECT *
    FROM aluno
WHERE id = 1;

/*
Após filtrar os dados que desejamos alterar, utilizamos o comando UPDATE nome_da_tabela para realizar a atualização. Com o 
SET, especificamos os campos a serem modificados e os novos valores. No exemplo abaixo, alteramos o valor de todos os campos 
para fixar a sintaxe do UPDATE, similar à do INSERT. Copiaremos todos os campos e atribuímos novos valores:
*/

UPDATE aluno
    SET nome = 'Nico',
        cpf = '10987654321',
        observacao = 'Teste',
        idade = 38,
        dinheiro = 15.23,
        altura = 1.90,
        ativo = FALSE,
        data_nascimento = '1980-01-15',
        hora_aula = '13:00:00',
        matriculado_em = '2020-01-02 15:00:00'
WHERE id = 1;

-- Conferindo atualização realizada
-- ================================
SELECT * FROM aluno;

-- Excluindo um registro da tabela
-- ===============================

/*
Aplicando o DELETE na tabela aluno
Vamos aplicar esse comando ao nosso banco de dados, onde o registro do "Nico" está presente. Antes de excluir o dado, é 
fundamental utilizar o SELECT para verificar se o filtro está correto. Isso evita a exclusão inadvertida de registros. 
No exemplo abaixo, filtramos os registros com o nome Nico:
*/

SELECT *
    FROM aluno 
    WHERE nome = 'Nico';

/*
Se utilizarmos um nome diferente, não haverá nenhum retorno, pois atualmente só temos o registro de "Nico". Por isso, sempre 
que for excluir um dado, execute o SELECT antes para confirmar os resultados. Após validar o filtro, basta substituir o 
comando SELECT * por DELETE e executar a exclusão:
*/

DELETE FROM aluno 
    WHERE nome = 'Nico';

/*
Agora, ao usar novamente o comando SELECT * FROM aluno para buscar o registro de "Nico", não haverá retorno, pois ele foi 
removido da tabela. Note que, se omitirmos o filtro WHERE e executarmos apenas DELETE FROM nome_da_tabela, todos os registros 
da tabela serão 
apagados. Geralmente, o objetivo é excluir apenas um registro específico, por isso o uso do filtro é essencial.
*/


SELECT * FROM aluno;

/*
================
O que aprendemos
================
Nesta aula, aprendemos:

# Como incluir um registro na tabela, entendendo a sintaxe de inclusão de cada tipo de campo
# A efetuar uma consulta simples, para listar os dados da tabela
# Como alterar um registro na tabela
# Como excluir um registro na tabela
*/


/*
-------------------------------------------------------------------------------------------------------------------------
	Módulo 3 - Consultas com Filtros
-------------------------------------------------------------------------------------------------------------------------
*/

-- Selecionando colunas específicas da tabela
-- ==========================================

/*
Antes de aprendermos sobre os filtros, precisamos aprender outra coisa importante, que é a seleção de campos específicos do 
banco de dados.

Até o momento, nossas seleções incluíam todos os campos da tabela. Agora vamos descobrir como filtrar um campo e como 
atribuir um alias para ele.

Começaremos criando um registro no nosso banco de dados, porque na nossa última aula o deixamos vazio. Basta retornar no 
nosso código de INSERT e executá-lo novamente.
*/

INSERT INTO aluno (
    nome,
    cpf,
    observacao,
    idade,
    dinheiro,
    altura,
    ativo,
    data_nascimento,
    hora_aula,
    matriculado_em
) VALUES (
    'Diogo',
    '12345678901',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ac dui et nisl vestibulum consequat. Integer vitae magna egestas, finibus libero dapibus, maximus magna. Fusce suscipit mi ut dui vestibulum, non vehicula felis fringilla. Vestibulum eget massa blandit, viverra quam non, convallis libero. Morbi ut nunc ligula. Duis tristique purus augue, nec sodales sem scelerisque dignissim. Sed vel rutrum mi. Nunc accumsan magna quis tempus rhoncus. Duis volutpat nulla a aliquet feugiat. Vestibulum rhoncus mi diam, eu consectetur sapien eleifend in. Donec sed facilisis velit. Duis tempus finibus venenatis. Mauris neque nisl, pulvinar eu volutpat eu, laoreet in massa. Quisque vestibulum eros ac tortor facilisis vulputate. Sed iaculis purus non sem tempus mollis. Curabitur felis lectus, aliquam id nunc ut, congue accumsan tellus.',
    35,
    100.50,
    1.81,
    TRUE,
    '1984-08-27',
    '17:30:00',
    '2020-02-08 12:32:45'
);

-- Conferindo atualização realizada
-- ================================
SELECT * FROM aluno;

/*
Para retornar apenas os dados da coluna "nome", executamos o comando SELECT nome FROM aluno;, e assim veremos só os registros 
de nome. Se quisermos os resultados de mais campos, como "nome", "idade" e "matriculado_em", informamos esses campos, 
separados por vírgula, após o SELECT.
*/

SELECT nome,
       idade,
       matriculado_em
    FROM aluno;

-- Utilização de Alias
-- ===================

/*
A partir dessa seleção, podemos usar o comando AS, ou seja, um alias, para trocar o nome de exibição dos campos na tabela. 
Se escrevermos SELECT matriculado_em AS quando_se_matriculou, essa coluna aparecerá com o nome "quando_se_matriculou".

O alias também pode ser usado para atribuir nomes com espaço para os campos, o que pode ser útil, por exemplo, para elaborar 
um relatório. Nesses casos, os novos nomes precisam estar entre aspas duplas " ", ou o programa não irá reconhecê-los e 
aparecerá uma mensagem de erro de sintaxe.
*/

SELECT nome AS "Nome do Aluno",
       idade,
       matriculado_em AS quando_se_matriculou
    FROM aluno;

-- Filtrando registros de campos do tipo texto
-- ===========================================

/*
Começaremos a trabalhar com filtros e, para isso, precisamos incluir mais dados na tabela, que até o momento só tem o usuário 
"Diogo".

Incluiremos apenas nomes, porque os filtros que aprenderemos podem ser usados com todos os campos do tipo texto, ou seja, 
VARCHAR, CHAR e TEXT.

Usaremos o comando INSERT INTO para incluir os novos nomes.
*/

INSERT INTO aluno (nome) VALUES ('Vinícius Dias');
INSERT INTO aluno (nome) VALUES ('Nico Steppat');
INSERT INTO aluno (nome) VALUES ('João Roberto');
INSERT INTO aluno (nome) VALUES ('Diego');

/*
Após executarmos esse script para incluirmos todos esses nomes no nosso registro, começaremos a conhecer os filtros, que 
funcionam a partir do WHERE nome_do_campo .

O primeiro filtro que aprenderemos é o "igual", representado pelo símbolo = e usado para pesquisar um texto específico.
*/

SELECT	nome,
		cpf
    FROM aluno
 WHERE nome = 'Diogo

-- Retorno
/*
"Diogo"	"12345678901"							
*/

/*
Ao executar esse código, notamos que WHERE nome = 'Diogo;' retorna apenas os dados do "Diogo". Se pesquisássemos, por exemplo,
WHERE nome = 'Diogo Oliveira' , não acharíamos nenhum resultado, pois o único "Diogo" na nossa tabela não tem sobrenome.

O próximo filtro é o "diferente", usado quando queremos todos os dados que não declaramos. Pode ser representado pelo sinal 
<> ou pelo sinal != . Então WHERE nome <> 'Diogo' e WHERE nome != 'Diogo' retornam o mesmo resultado, ou seja, todos os 
registros que não são o "Diogo".
*/

SELECT
	*
FROM
	ALUNO
WHERE
	NOME <> 'Diogo';

-- Retorno
/*
3	"Vinícius Dias"									
4	"Nico Steppat"									
5	"João Roberto"									
6	"Diego"									
*/

/*
Outra forma de filtrar uma informação é utilizando o LIKE que pode ser entendido como "parecido com". Dessa forma, WHERE 
nome LIKE 'Diogo' pode ser lido como "ONDE nome PARECIDO COM 'Diogo'". Ao utilizarmos o LIKE podemos aplicar dois operadores 
especiais: o _ (underline) e o % (porcentagem).

Começaremos aprendendo o _ , que significa "qualquer caractere naquela posição", ou seja, a posição que ele ocupa substitui 
um caractere. Então se pesquisarmos com WHERE nome LIKE '_iogo', os nomes apresentados começarão por qualquer letra, mas 
terminarão com "iogo". Vejamos outro exemplo.
*/

SELECT
	NOME,
	CPF,
	IDADE,
	DINHEIRO,
	ALTURA,
	ATIVO,
	DATA_NASCIMENTO,
	HORA_AULA,
	MATRICULADO_EM
FROM
	ALUNO
WHERE
	NOME LIKE 'Di_go';

-- Retorno
/*
"Diogo"	"12345678901"	35	100.50	1.81	true	"1984-08-27"	"17:30:00"	"2020-02-08 12:32:45"
"Diego"								
*/

/*
Nesse caso, o filtro ignora o terceiro caractere entre o "Di" e o "go", ou seja, a tabela retornará tanto o "Diego", quanto 
o "Diogo". Em resumo, o _ , que pode estar no começo, meio ou final de uma palavra, ocupa o espaço específico de um caractere, 
que será ignorado na busca.

Outra forma de usarmos o _ é com o comando NOT LIKE, ou seja, "não parece com". Portanto, em WHERE nome NOT LIKE 'Di_go' , 
a tabela apresentará apenas os registros de nomes que não tenham comecem com "Di" e terminem com "go", independentemente do 
caractere que estiver entre essas sílabas. No caso, todos os nomes que não sejam "Diego" ou "Diogo".

Agora aprenderemos o caractere % , que substitui todos os caracteres até o espaço que ele ocupa. Por exemplo, para recuperar 
todos os nomes que comecem com "D", usamos o comando:
*/

SELECT * 
    FROM aluno
 WHERE nome LIKE 'D%';

-- Retorno
/*
2	"Diogo"	"12345678901"	"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ac dui et nisl vestibulum consequat. Integer vitae magna egestas, finibus libero dapibus, maximus magna. Fusce suscipit mi ut dui vestibulum, non vehicula felis fringilla. Vestibulum eget massa blandit, viverra quam non, convallis libero. Morbi ut nunc ligula. Duis tristique purus augue, nec sodales sem scelerisque dignissim. Sed vel rutrum mi. Nunc accumsan magna quis tempus rhoncus. Duis volutpat nulla a aliquet feugiat. Vestibulum rhoncus mi diam, eu consectetur sapien eleifend in. Donec sed facilisis velit. Duis tempus finibus venenatis. Mauris neque nisl, pulvinar eu volutpat eu, laoreet in massa. Quisque vestibulum eros ac tortor facilisis vulputate. Sed iaculis purus non sem tempus mollis. Curabitur felis lectus, aliquam id nunc ut, congue accumsan tellus."	35	100.50	1.81	true	"1984-08-27"	"17:30:00"	"2020-02-08 12:32:45"
6	"Diego"									
*/

/*
Novamente aparecem os resultados do "Diogo" e do "Diego", que são os nomes da nossa tabela que começam dom D. Podemos filtrar 
também pela última letra ao invés da primeira. Por exemplo, para filtrar os nomes terminados em "s", utilizamos o comando 
WHERE nome LIKE '%s';. Assim aparecerão os dados do "Vinícius Dias". Outra possibilidade é recuperar todos os nomes que 
tenham espaço:
*/

SELECT * 
    FROM aluno
 WHERE nome LIKE '% %';

-- Retorno
/*
3	"Vinícius Dias"									
4	"Nico Steppat"									
5	"João Roberto"									
*/

/*
Esse filtro ignora quaisquer nomes que estejam antes ou depois do espaço, então os únicos dados que não vão aparecer serão 
"Diogo" e do "Diego", porque todos os outros usuários têm nome e sobrenome divididos por espaço. O ``%também pode ser usado 
entre textos, como%i%a%`.
*/

SELECT * 
    FROM aluno
 WHERE nome LIKE '%i%a%';

-- Retorno
/*
3	"Vinícius Dias"									
4	"Nico Steppat"									
*/

/*
Esse comando apresenta os dados que tenham "i**", em alguma parte do texto, seguido por "a", em outra parte do texto. No 
nosso banco de dados retorna os nomes "Vinícius Dias", devido ao "i" em "Vinícius" e o "a" em "Dias", e o "Nico Steppat", 
devido ao "i" em "Nico" e o "a" em "Steppa**t".

Até agora aprendemos o filtro de igualdade, de diferença, os filtros com LIKE e NOT LIKE e os caracteres especiais _ , que 
substitui um caractere qualquer naquela posição específica, e % que substitui múltiplos caracteres no começo, no final ou 
entre o texto.

Na próxima aula aprenderemos a filtrar os campos de números, data, hora e boleanos.
*/

-- Filtrando registros de campos do tipo numérico, data e booleano
-- ===============================================================

/*
Nesta aula, aprenderemos a aplicar filtros em campos do tipo numérico, data e booleano. Também veremos os comandos 
universais IS e IS NOT, que podem ser usados em qualquer tipo de campo, incluindo texto.
*/

-- =========================
-- Filtros para campos nulos
-- =========================
/*
Ao selecionar nossa tabela com o comando SELECT * FROM aluno;, notamos que apenas o CPF do "Diogo" está preenchido, enquanto 
os demais registros estão nulos. Para identificar esses valores, não podemos usar WHERE cpf = NULL, pois no PostgreSQL 
valores nulos não são comparados diretamente com o operador =. Nesse caso, usamos o comando IS NULL:
*/

SELECT *
    FROM aluno
 WHERE cpf IS NULL;

-- Retorno
/*
3	"Vinícius Dias"									
4	"Nico Steppat"									
5	"João Roberto"									
6	"Diego"									
*/

/*
Esse comando retorna todos os registros cujo campo CPF está nulo, ou seja, os dados do "Diogo" não aparecem. Para buscar 
os registros com CPF preenchido, utilizamos o comando oposto: IS NOT NULL:
*/

SELECT *
    FROM aluno
 WHERE cpf IS NOT NULL;

-- Retorno
/*
2	"Diogo"	"12345678901"	"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ac dui et nisl vestibulum consequat. Integer vitae magna egestas, finibus libero dapibus, maximus magna. Fusce suscipit mi ut dui vestibulum, non vehicula felis fringilla. Vestibulum eget massa blandit, viverra quam non, convallis libero. Morbi ut nunc ligula. Duis tristique purus augue, nec sodales sem scelerisque dignissim. Sed vel rutrum mi. Nunc accumsan magna quis tempus rhoncus. Duis volutpat nulla a aliquet feugiat. Vestibulum rhoncus mi diam, eu consectetur sapien eleifend in. Donec sed facilisis velit. Duis tempus finibus venenatis. Mauris neque nisl, pulvinar eu volutpat eu, laoreet in massa. Quisque vestibulum eros ac tortor facilisis vulputate. Sed iaculis purus non sem tempus mollis. Curabitur felis lectus, aliquam id nunc ut, congue accumsan tellus."	35	100.50	1.81	true	"1984-08-27"	"17:30:00"	"2020-02-08 12:32:45"
*/

/*
Esse comando retorna apenas os registros cujo campo CPF não é nulo, como o do "Diogo".
*/

-- ========================
-- Operadores de comparação
-- ========================

/*
Agora veremos os filtros específicos para campos numéricos, datas e horários. Eles utilizam operadores como = (igual), <> ou 
!= (diferente), >= (maior ou igual), <= (menor ou igual), > (maior) e < (menor). Exemplos:
*/

-- ==========
-- Igualdade:
-- ==========
-- WHERE idade = 35;

SELECT 	nome,
		idade
    FROM aluno
 WHERE idade = 35;

-- Retorno
/*
"Diogo"	35
*/

/*
Retorna apenas os usuários cuja idade seja exatamente 35.
*/

-- ==========
-- Diferença:
-- ==========
-- WHERE idade <> 36;

SELECT 	nome,
		idade
    FROM aluno
 WHERE idade <> 36;

-- Retorno
/*
"Diogo"	35
*/

/*
Retorna todos os registros cuja idade não seja 36.
*/

/*
Nota importante: Com exceção dos comandos IS e IS NOT, os operadores de comparação não retornam registros cujo campo está 
nulo.
*/

-- ==============================
-- Maior ou igual/menor ou igual:
-- ==============================
-- WHERE idade >= 35;
-- WHERE idade <= 50;

SELECT 	nome,
		idade
    FROM aluno
 WHERE idade >= 35;

-- Retorno
/*
"Diogo"	35
*/

SELECT 	nome,
		idade
    FROM aluno
 WHERE idade <= 50;

-- Retorno
/*
"Diogo"	35
*/

/*
Esses comandos retornam valores dentro do intervalo especificado.
*/

-- ============
-- Maior/menor:
-- ============
-- WHERE idade > 30;
-- WHERE idade < 100;

SELECT 	nome,
		idade
    FROM aluno
 WHERE idade > 30;

-- Retorno
/*
"Diogo"	35
*/

SELECT 	nome,
		idade
    FROM aluno
 WHERE idade < 100;

-- Retorno
/*
"Diogo"	35
*/

/*
Esses filtros retornam os registros que superam ou não atingem o valor declarado.
*/

-- =======================
-- Intervalos com BETWEEN:
-- =======================

SELECT 	nome,
		idade
    FROM aluno
 WHERE idade BETWEEN 10 AND 35;

-- Retorno
/*
"Diogo"	35
*/

/*
O comando BETWEEN retorna todos os valores dentro do intervalo especificado, inclusive os extremos. No exemplo, tanto 10 
quanto 35 estão incluídos nos resultados.
*/

/*
Todos esses filtros funcionam para campos dos tipos INTEGER, REAL, SERIAL, NUMERIC, DATE, TIME e TIMESTAMP.
*/

-- Filtros para campos booleanos
-- =============================

/*
Os campos booleanos utilizam apenas os filtros = e <>. Para buscar registros cujo campo seja verdadeiro (TRUE) ou falso 
(FALSE), usamos:
*/

-- =============
-- Valores TRUE:
-- =============

SELECT 	nome,
		cpf,
		ativo
    FROM aluno
 WHERE ativo = true;

-- Retorno
/*
"Diogo"	"12345678901"	true
*/

/*
Esse comando retorna registros onde o campo "ativo" é verdadeiro.
*/

-- ==============
-- Valores FALSE:
-- ==============

SELECT 	nome,
		cpf,
		ativo
    FROM aluno
 WHERE ativo = false;

-- Retorno
/*
Não havia registro que satisfizesse a condição
*/

/*
Retorna os registros cujo campo "ativo" é falso.
*/

-- Para filtrar registros onde o campo booleano é nulo, utilizamos o comando IS:
-- =============================================================================

SELECT 	nome,
		cpf,
		ativo
    FROM aluno
 WHERE ativo IS NULL;

-- Retorno
/*
"Vinícius Dias"		
"Nico Steppat"		
"João Roberto"		
"Diego"		
*/

/*
Esse comando retorna os registros nos quais o campo "ativo" não possui valor.
*/

-- Filtrando utilizando operadores E e OU
-- ======================================

/*
Nesta aula, aprenderemos como combinar filtros utilizando os operadores AND (e) e OR (ou), permitindo criar consultas mais 
específicas e precisas. Começaremos pelo operador AND.
*/

-- ============
-- Operador AND
-- ============
/*
O operador AND funciona como uma soma de condições, exibindo apenas os registros que atendem a todas as exigências declaradas.
Imagine a situação em que precisamos buscar os nomes que começam com a letra "D" e têm o CPF preenchido. A consulta seria:
*/

SELECT 	nome,
		cpf,
		ativo
    FROM aluno
 WHERE nome LIKE 'D%'
   AND cpf IS NOT NULL;

-- Retorno
/*
"Diogo"	"12345678901"	true
*/

/*
Se utilizarmos apenas nome LIKE 'D%', o código retornará todos os registros cujo nome começa com "D". No entanto, ao combinar
mos com AND cpf IS NOT NULL, a consulta retorna somente os registros que atendem às duas condições: começar com "D" e ter o 
CPF preenchido.
*/

-- ===========
-- Operador OR
-- ===========

/*
O operador OR exibe os registros que atendem a pelo menos uma das condições impostas. Por exemplo, se quisermos buscar os 
usuários chamados "Diogo" ou "Rodrigo", utilizamos:
*/

SELECT 	nome,
		cpf,
		ativo
    FROM aluno
 WHERE nome LIKE 'Diogo'
    OR nome LIKE 'Rodrigo';

-- Retorno
/*
"Diogo"	"12345678901"	true
*/

/*
Mesmo que não haja nenhum registro de "Rodrigo" no banco, o comando retorna os dados do "Diogo". Se adicionarmos outra 
condição, como OR nome LIKE 'Nico%', o resultado incluirá os dados de "Diogo" e todos os registros que começam com "Nico", 
como o "Nico Steppat".
*/

SELECT 	nome,
		cpf,
		ativo
    FROM aluno
 WHERE nome LIKE 'Diogo'
    OR nome LIKE 'Nico%';

-- Retorno
/*
"Diogo"	"12345678901"	true
"Nico Steppat"		
*/

/*
Diferença principal:
====================
AND: Retorna apenas os registros que atendem todas as condições.
OR: Retorna os registros que atendem pelo menos uma das condições.
*/

/*
================
O que aprendemos
================
Nesta aula, aprendemos:

# A selecionar campos específicos da tabela
# Como definir um alias para os nomes dos campos
# A filtrar registros, utilizando o WHERE para campos do tipo de texto
	# Operadores =, !=,<>, LIKE e NOT LIKE
	# A diferença entre = e LIKE
	# O funcionamento do caractere % no filtro com LIKE e NOT LIKE
	# O funcionamento do caractere _ no filtro com LIKE e NOT LIKE
# Como filtrar utilizando IS NULL e IS NOT NULL
# Como filtrar registros para campos do tipos relacionados a números, datas e horas
	# =, !=, <>, <, <=, >, >=
	# BETWEEN
# Como filtrar registros para campos do tipo booleano
	# =, !=, <>
# Como funciona os operadores lógicos AND e OR
*/


/*
-------------------------------------------------------------------------------------------------------------------------
	Módulo 4 - Trabalhando com Relacionamentos
-------------------------------------------------------------------------------------------------------------------------
*/

-- =================================
-- Criando tabela com chave primária
-- =================================

-- Vamos começar criando uma tabela simples chamada curso:
-- =======================================================
CREATE TABLE curso (
    id INTEGER,
    nome VARCHAR(255)
);

/*
Embora seja possível inserir dados com o comando INSERT INTO curso (...), essa tabela permite valores inválidos, como NULL. 
Por exemplo:
*/

INSERT INTO
	CURSO (ID, NOME)
VALUES
	(NULL, NULL);

-- Visualizando registro incluido na tabela
-- ========================================
SELECT
	ID,
	NOME
FROM
	CURSO;

-- Retorno
/*
Não havia registro que satisfizesse a condição
*/

/*
Para evitar essa situação, precisamos garantir que certos campos não aceitem valores nulos. Para isso, utilizamos o comando 
NOT NULL ao criar a tabela:
*/

-- Excluindo a tabela que permite valores inválidos, como NULL.
-- ============================================================
DROP TABLE CURSO;

-- Recriando a tabela curso com restrição para valores inválidos, como NULL.
-- =========================================================================
CREATE TABLE curso (
    id INTEGER NOT NULL,
    nome VARCHAR(255) NOT NULL
);

/*
Se tentarmos executar o comando anterior (INSERT INTO curso (id, nome) VALUES (NULL, NULL);), receberemos uma mensagem de 
erro indicando que os valores nulos não são permitidos. Isso garante que os dados inseridos na tabela sejam válidos.
*/

INSERT INTO
	CURSO (ID, NOME)
VALUES
	(NULL, NULL);

-- Retorno
/*
ERROR:  null value in column "id" of relation "curso" violates not-null constraint
Failing row contains (null, null). 

SQL state: 23502
Detail: Failing row contains (null, null).
*/

-- ==============================
-- Definindo unicidade com UNIQUE
-- ==============================

/*
Agora que garantimos que os campos não podem ser nulos, precisamos evitar duplicidade nos valores da coluna id. Isso é 
especialmente importante para identificar cada registro de forma exclusiva. Utilizamos o comando UNIQUE para garantir essa 
propriedade:
*/

-- Excluindo a tabela que permite duplicidade nos valores da coluna id
-- ===================================================================
DROP TABLE CURSO;

-- Recriando a tabela curso com restrição para valores inválidos, como NULL e duplicidade nos valores da coluna id
-- ===============================================================================================================
CREATE TABLE curso (
    id INTEGER NOT NULL UNIQUE,
    nome VARCHAR(255) NOT NULL
);

/*
Com essa tabela, tentamos inserir dois registros com o mesmo id:
*/

INSERT INTO curso (id, nome) VALUES (1, 'HTML');
INSERT INTO curso (id, nome) VALUES (1, 'Javascript');

-- Retorno
/*
ERROR:  duplicate key value violates unique constraint "curso_id_key"
Key (id)=(1) already exists. 

SQL state: 23505
Detail: Key (id)=(1) already exists.
*/

/*
O segundo comando falha, pois o id precisa ser exclusivo. Ao alterar o id do curso de "Javascript" para 2, conseguimos 
incluir ambos os 
registros com sucesso:
*/

INSERT INTO curso (id, nome) VALUES (2, 'Javascript');

-- Visualizando registro incluido na tabela
-- ========================================
SELECT
	ID,
	NOME
FROM
	CURSO;

-- Retorno
/*
2	"Javascript"
1	"HTML"
*/

-- ======================
-- Utilizando PRIMARY KEY
-- ======================
/*
A chave primária é uma forma mais intuitiva de declarar que uma coluna não pode ser nula e deve ser única. Podemos substituir 
NOT NULL UNIQUE pelo comando PRIMARY KEY para simplificar a definição:
*/

-- Excluindo a tabela
-- ==================
DROP TABLE CURSO;

-- Recriando a tabela com nova restrição
-- =====================================
CREATE TABLE CURSO (
	ID INTEGER PRIMARY KEY,
	NOME VARCHAR(255) NOT NULL
);

/*
Com isso, o id assume automaticamente as propriedades de uma chave primária: não pode ser nulo e deve ser único. Qualquer 
tentativa de duplicar o valor do id resultará em erro:
*/

-- Teste com retorno de erro
-- =========================
INSERT INTO curso (id, nome) VALUES (1, 'HTML');
INSERT INTO curso (id, nome) VALUES (1, 'Javascript'); -- erro

-- Retorno
/*
ERROR:  duplicate key value violates unique constraint "curso_pkey"
Key (id)=(1) already exists. 

SQL state: 23505
Detail: Key (id)=(1) already exists.
*/

-- Teste com sucesso
-- =================
INSERT INTO curso (id, nome) VALUES (1, 'HTML');
INSERT INTO curso (id, nome) VALUES (2, 'Javascript');

-- Retorno
/*
INSERT 0 1

Query returned successfully in 104 msec.
*/

/*
Conclusão
=========
Aprendemos que uma chave primária é uma coluna que possui duas propriedades fundamentais: não pode conter valores nulos e 
deve ser única. Isso garante a integridade dos dados e facilita o gerenciamento de registros em uma tabela.

Embora seja possível criar chaves primárias compostas (que utilizam mais de uma coluna), nesta aula focamos em chaves 
primárias simples, definidas em uma única coluna. Na próxima aula, aprofundaremos o uso de relacionamentos entre tabelas 
para entender como esses conceitos trabalham juntos.
*/

-- ====================================
-- Criando tabela com chave estrangeira
-- ====================================

/*
Nesta aula, exploraremos o funcionamento das chaves estrangeiras (FOREIGN KEY), que são fundamentais para estabelecer 
relações entre tabelas e garantir a consistência dos dados. Segundo a documentação oficial do PostgreSQL, uma chave 
estrangeira é "uma limitação que especifica que o valor de uma coluna (ou grupo de colunas) deve corresponder a uma linha 
em outra tabela".

Atualmente, temos duas tabelas em nosso banco de dados: curso e aluno, que criamos anteriormente. Para simplificar, vamos 
recriar a tabela de alunos com novos registros.
*/

-- Criando a tabela aluno e inserindo dados
-- ========================================

-- Primeiro, apagamos a tabela existente com o comando:
DROP TABLE ALUNO;

-- Em seguida, criamos uma nova tabela aluno:
CREATE TABLE aluno (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL
);

-- Agora, adicionamos dois registros para os alunos:
INSERT INTO aluno (nome) VALUES ('Diogo');
INSERT INTO aluno (nome) VALUES ('Vinícius');

-- Visualizando registro incluido na tabela
-- ========================================
SELECT
	*
FROM
	ALUNO;

-- Retorno
/*
1	"Diogo"
2	"Vinícius"
*/

-- Criando a tabela de relacionamento aluno_curso
-- ==============================================
/*
Agora, queremos criar uma relação entre os alunos e os cursos. Para isso, criaremos uma nova tabela chamada aluno_curso:
*/

CREATE TABLE aluno_curso (
    aluno_id INTEGER,
    curso_id INTEGER,
    PRIMARY KEY (aluno_id, curso_id)
);

/*
Essa tabela será usada para registrar quais alunos estão matriculados em quais cursos. No entanto, precisamos garantir que 
os valores inseridos em aluno_id e curso_id correspondam a registros válidos nas tabelas aluno e curso. É aqui que entra o 
uso das chaves estrangeiras.
*/

-- =============================
-- Definindo chaves estrangeiras
-- =============================

/*
As chaves estrangeiras são declaradas com o comando FOREIGN KEY. Primeiro, definimos a chave estrangeira para a coluna 
aluno_id, informando que ela deve referenciar o campo id na tabela aluno:

FOREIGN KEY (aluno_id)
REFERENCES aluno (id)

Fazemos o mesmo para a coluna curso_id, vinculando-a ao campo id na tabela curso:

FOREIGN KEY (curso_id)
REFERENCES curso (id)
*/

-- Com isso, recriamos a tabela aluno_curso, agora com as chaves estrangeiras:
-- ===========================================================================
DROP TABLE aluno_curso;

CREATE TABLE aluno_curso (
    aluno_id INTEGER,
    curso_id INTEGER,
    PRIMARY KEY (aluno_id, curso_id),

    FOREIGN KEY (aluno_id)
        REFERENCES aluno (id),

    FOREIGN KEY (curso_id)
        REFERENCES curso (id)
);

-- Validando registros com FOREIGN KEY
-- Agora, podemos inserir registros na tabela aluno_curso para matricular alunos nos cursos:

INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (1,1);
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (2,1);
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (3,1); -- erro

-- Retorno
/*
ERROR:  insert or update on table "aluno_curso" violates foreign key constraint "aluno_curso_aluno_id_fkey"
Key (aluno_id)=(3) is not present in table "aluno". 

SQL state: 23503
Detail: Key (aluno_id)=(3) is not present in table "aluno".
*/

/*
Neste exemplo:

Os registros (1,1) e (2,1) são adicionados com sucesso, pois o aluno 1 (Diogo) e o aluno 2 (Vinícius) existem na tabela 
aluno, e o curso 1 (HTML) existe na tabela curso.

O registro (3,1) falha, pois não há um aluno com id = 3 na tabela aluno. Do mesmo modo, se tentarmos adicionar (1,3):
*/

-- Testando para (1,3)
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (1,3);

-- Retorno
/*
ERROR:  insert or update on table "aluno_curso" violates foreign key constraint "aluno_curso_curso_id_fkey"
Key (curso_id)=(3) is not present in table "curso". 

SQL state: 23503
Detail: Key (curso_id)=(3) is not present in table "curso".
*/

-- Esse comando também resultará em erro, pois não existe um curso com id = 3 na tabela curso.

/*
Esses erros mostram que as chaves estrangeiras bloqueiam a inserção de registros inválidos, ajudando a evitar inconsistências 
nos dados.
*/

/*
Conclusão
=========
Com as chaves estrangeiras, garantimos que os valores inseridos em uma tabela de relacionamento correspondam a registros 
válidos emoutras tabelas. Isso é essencial para manter a integridade referencial no banco de dados.
*/

-- =============================
-- Consultas com Relacionamentos
-- =============================
/*
Nesta aula, aprenderemos como combinar dados de diferentes tabelas em uma única consulta usando o comando JOIN. Esse recurso 
é essencial para visualizar informações relacionadas de maneira organizada e eficiente.

Atualmente, temos três tabelas em nosso banco de dados: aluno, curso e aluno_curso. Começaremos verificando os dados inseridos
em cada uma delas:
*/

-- Tabela aluno
-- ============
SELECT * FROM aluno

-- Retorno
/*
1	"Diogo"
2	"Vinícius"
*/

-- Tabela curso
-- ============
SELECT * FROM curso;

-- Retorno
/*
1	"HTML"
2	"Javascript"
*/

-- Tabela aluno_curso
-- ==================
SELECT * FROM aluno_curso;

-- Retorno
/*
1	1
2	1
*/

/*
Essas consultas mostram que temos dois alunos registrados na tabela aluno, dois cursos na tabela curso e as informações de 
matrículas na tabela aluno_curso.
*/

-- O problema de consultas separadas
-- =================================
/*
Até agora, para verificar em quais cursos um aluno está matriculado, precisaríamos consultar os IDs individualmente em cada 
tabela. Por exemplo:
*/

SELECT * FROM aluno WHERE id = 1;
-- Retorno
/*
1	"Diogo"
*/

SELECT * FROM curso WHERE id = 1;
-- Retorno
/*
1	"HTML"
*/


/*
Essa abordagem é pouco prática e difícil de interpretar. Para resolver isso, utilizaremos o comando JOIN, que combina os 
dados de diferentes tabelas em uma única consulta.
*/

-- =========================
-- Utilizando o comando JOIN
-- =========================
/*
O comando JOIN é usado para unir os dados de duas tabelas baseando-se em uma condição que define a relação entre elas. Por 
exemplo, para combinar os dados das tabelas aluno e aluno_curso, usamos:
*/

SELECT
	*
FROM
	ALUNO
	JOIN ALUNO_CURSO ON ALUNO_CURSO.ALUNO_ID = ALUNO.ID;

/*
Essa consulta une as tabelas aluno e aluno_curso, com base na relação entre aluno.id e aluno_curso.aluno_id. O resultado 
mostra, em uma única tabela, os dados de ambos os registros:
*/

-- Retorno
/*
1	"Diogo"		1	1
2	"Vinícius"	2	1
*/

-- Para adicionar as informações da tabela curso, complementamos o código com mais um JOIN:
SELECT
	*
FROM
	ALUNO
	JOIN ALUNO_CURSO ON ALUNO_CURSO.ALUNO_ID = ALUNO.ID
	JOIN CURSO ON CURSO.ID = ALUNO_CURSO.CURSO_ID;

-- Retorno
/*
1	"Diogo"		1	1	1	"HTML"
2	"Vinícius"	2	1	1	"HTML"
*/

/*
Agora, a consulta combina as três tabelas, retornando dados mais detalhados. Por exemplo, podemos ver que o aluno "Diogo" 
está matriculado no curso de "HTML" (linha 1) e o aluno "Vinícius" também está matriculado no mesmo curso (linha 2).
*/

-- Inserindo novos registros e atualizando a busca
-- ===============================================

-- Vamos matricular o aluno "Vinícius" no curso de "Javascript":

INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (2,2);

/*
Ao executar a consulta anterior novamente, agora vemos que o aluno "Vinícius" aparece matriculado em dois cursos: "HTML" 
e "Javascript".
*/

SELECT
	*
FROM
	ALUNO
	JOIN ALUNO_CURSO ON ALUNO_CURSO.ALUNO_ID = ALUNO.ID
	JOIN CURSO ON CURSO.ID = ALUNO_CURSO.CURSO_ID;

-- Retorno
/*
1	"Diogo"		1	1	1	"HTML"
2	"Vinícius"	2	1	1	"HTML"
2	"Vinícius"	2	2	2	"Javascript"
*/

-- =========================================
-- Usando alias para organizar os resultados
-- =========================================

/*
Podemos organizar melhor os resultados usando alias, que nos permite renomear as colunas exibidas. Isso é útil, pois tanto 
a tabela aluno quanto a tabela curso possuem uma coluna chamada nome, o que pode causar confusão.
*/

SELECT aluno.nome AS aluno,
       curso.nome AS curso
  FROM aluno
  JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
  JOIN curso ON curso.id = aluno_curso.curso_id;

-- Retorno
/*
"aluno"		"curso"
"Diogo"		"HTML"
"Vinícius"	"HTML"
"Vinícius"	"Javascript"
*/

-- Executando esse comando, os resultados especificam claramente qual nome pertence ao aluno e qual pertence ao curso.

-- Se quisermos personalizar ainda mais os nomes das colunas, podemos usar aspas para criar títulos mais descritivos:

SELECT aluno.nome AS "Nome do Aluno",
       curso.nome AS "Nome do Curso"
  FROM aluno
  JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
  JOIN curso ON curso.id = aluno_curso.curso_id;

-- Retorno
/*
"Nome do Aluno"	"Nome do Curso"
"Diogo"			"HTML"
"Vinícius"		"HTML"
"Vinícius"		"Javascript"
*/

-- O resultado exibe uma tabela limpa e organizada, ideal para relatórios.

/*
Conclusão
=========
Com o uso do comando JOIN, aprendemos a combinar dados de diferentes tabelas em uma única consulta, criando uma visão mais 
clara e detalhada das informações relacionadas. Além disso, exploramos a utilização de alias para organizar os resultados e 
tornar a leitura mais intuitiva.

Esse método é indispensável quando trabalhamos com bancos de dados que possuem relações entre tabelas, permitindo construir 
relatórios complexos e responder a perguntas que envolvem múltiplas fontes de dados. Na próxima aula, aprofundaremos o 
conhecimento explorando outros tipos de junções, como LEFT JOIN e RIGHT JOIN, que oferecem ainda mais flexibilidade para 
lidar com relações específicas.
*/

-- ===============================
-- LEFT, RIGHT, CROSS e FULL JOINS
-- ===============================
/*
Nesta aula, exploraremos diferentes tipos de JOIN para lidar com situações em que registros de uma tabela podem não ter 
correspondência em outra. Isso garantirá que nossa consulta retorne todos os dados relevantes, mesmo quando há informações 
ausentes.

O problema do JOIN padrão
Até agora, utilizamos JOIN para relacionar alunos e cursos. No entanto, esse comando retorna apenas os alunos matriculados 
em cursos existentes. Para entender melhor esse problema, adicionaremos um novo aluno que ainda não está matriculado:
*/

-- Adicionando aluno sem matricula
INSERT INTO aluno (nome) VALUES ('Nico');

/*
Agora, ao executar uma consulta padrão JOIN que retorna alunos e cursos, perceberemos que o aluno "Nico" não aparece nos 
resultados:
*/

SELECT aluno.nome AS "Nome do Aluno",
       curso.nome AS "Nome do Curso"
  FROM aluno
  JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
  JOIN curso ON curso.id = aluno_curso.curso_id;

-- Resultado
/*
"Nome do Aluno"	"Nome do Curso"
"Diogo"			"HTML"
"Vinícius"		"HTML"
"Vinícius"		"Javascript"
*/

/*
O mesmo ocorre quando adicionamos um novo curso:
*/

INSERT INTO curso (id, nome) VALUES (3, 'CSS');

/*
O curso "CSS" aparece na tabela curso, mas não na consulta acima. Isso ocorre porque um JOIN padrão só retorna registros 
que possuem correspondências em ambas as tabelas.
*/

SELECT aluno.nome AS "Nome do Aluno",
       curso.nome AS "Nome do Curso"
  FROM aluno
  JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
  JOIN curso ON curso.id = aluno_curso.curso_id;

-- Retorno
/*
"Nome do Aluno"	"Nome do Curso"
"Diogo"			"HTML"
"Vinícius"		"HTML"
"Vinícius"		"Javascript"
*/

-- ======================================
-- LEFT JOIN - Retornando todos os alunos
-- ======================================
/*
Para garantir que todos os alunos apareçam, independentemente de estarem matriculados ou não, utilizamos LEFT JOIN. Esse 
comando prioriza os registros da tabela à esquerda (aluno) e preenche os campos sem correspondência com NULL:
*/

SELECT
	ALUNO.NOME AS "Nome do Aluno",
	CURSO.NOME AS "Nome do Curso"
FROM
	ALUNO
	LEFT JOIN ALUNO_CURSO ON ALUNO_CURSO.ALUNO_ID = ALUNO.ID
	LEFT JOIN CURSO ON CURSO.ID = ALUNO_CURSO.CURSO_ID;

-- Retorno
/*
"Nome do Aluno"	"Nome do Curso"
"Diogo"			"HTML"
"Vinícius"		"HTML"
"Vinícius"		"Javascript"
"Nico"	
*/

/*
Agora, nosso resultado incluirá todos os alunos, mesmo aqueles que não estão matriculados. Quando um aluno não tem um curso 
correspondente, o campo "Nome do Curso" aparecerá como NULL.
*/

-- =======================================
-- RIGHT JOIN - Retornando todos os cursos
-- =======================================
/*
Agora consideremos a situação inversa: queremos listar todos os cursos, mesmo aqueles que não têm alunos matriculados. Para 
isso, utilizamos RIGHT JOIN, que prioriza os registros da tabela à direita (curso):
*/

SELECT
	ALUNO.NOME AS "Nome do Aluno",
	CURSO.NOME AS "Nome do Curso"
FROM
	ALUNO
	RIGHT JOIN ALUNO_CURSO ON ALUNO_CURSO.ALUNO_ID = ALUNO.ID
	RIGHT JOIN CURSO ON CURSO.ID = ALUNO_CURSO.CURSO_ID;

-- Resultado
/*
"Nome do Aluno"	"Nome do Curso"
"Diogo"			"HTML"
"Vinícius"		"HTML"
"Vinícius"		"Javascript"
				"CSS"
*/

/*
Os cursos sem alunos terão o campo "Nome do Aluno" preenchido com NULL.
*/

-- =========================================
-- FULL JOIN - Retornando todos os registros
-- =========================================
/*
Para garantir que todos os alunos e todos os cursos sejam exibidos, independentemente de estarem relacionados ou não, 
utilizamos FULL JOIN:
*/

SELECT
	ALUNO.NOME AS "Nome do Aluno",
	CURSO.NOME AS "Nome do Curso"
FROM
	ALUNO
	FULL JOIN ALUNO_CURSO ON ALUNO_CURSO.ALUNO_ID = ALUNO.ID
	FULL JOIN CURSO ON CURSO.ID = ALUNO_CURSO.CURSO_ID;

-- Retorno
/*
"Nome do Aluno"	"Nome do Curso"
"Diogo"			"HTML"
"Vinícius"		"HTML"
"Vinícius"		"Javascript"
"Nico"	
				"CSS"
*/

/*
Esse comando retorna todos os alunos e todos os cursos, preenchendo os campos sem correspondência com NULL. Dessa forma, 
conseguimos visualizar todas as informações disponíveis, inclusive o aluno "Nico" e o curso "CSS".
*/

-- ===================================================
-- CROSS JOIN - Criando todas as combinações possíveis
-- ===================================================
/*
Existe outro tipo de junção que relaciona todos os registros da tabela "A" com todos os registros da tabela "B". Esse 
método é conhecido como CROSS JOIN. Aqui, cada aluno é vinculado a todos os cursos, independentemente de matrícula real:
*/

SELECT aluno.nome AS "Nome do Aluno",
       curso.nome AS "Nome do Curso"
  FROM aluno
  CROSS JOIN curso;

/*
O CROSS JOIN não exige um campo de ligação entre as tabelas. Ele simplesmente combina todas as linhas da tabela aluno com 
todas as linhas da tabela curso. O resultado é um conjunto expandido onde cada aluno aparece vinculado a cada curso.
*/

-- Retorno
/*
"Nome do Aluno"		"Nome do Curso"
"Diogo"				"HTML"
"Diogo"				"Javascript"
"Diogo"				"CSS"
"Vinícius"			"HTML"
"Vinícius"			"Javascript"
"Vinícius"			"CSS"
"Nico"				"HTML"
"Nico"				"Javascript"
"Nico"				"CSS"
*/

/*
Para observar o efeito do CROSS JOIN, adicionaremos mais um aluno:
*/

INSERT INTO aluno (nome) VALUES ('João');

/*
Agora, ao executar a mesma consulta, veremos que o aluno "João" está listado em todos os cursos disponíveis.
*/

SELECT aluno.nome AS "Nome do Aluno",
       curso.nome AS "Nome do Curso"
  FROM aluno
  CROSS JOIN curso;

/*
O resultado mostra que todos os alunos foram vinculados a todos os cursos:
*/

-- Retorno
/*
"Nome do Aluno"		"Nome do Curso"
"Diogo"				"HTML"
"Diogo"				"Javascript"
"Diogo"				"CSS"
"Vinícius"			"HTML"
"Vinícius"			"Javascript"
"Vinícius"			"CSS"
"Nico"				"HTML"
"Nico"				"Javascript"
"Nico"				"CSS"
"João"				"HTML"
"João"				"Javascript"
"João"				"CSS"
*/

/*
Conclusão
=========
Aprendemos diferentes tipos de JOIN que permitem realizar consultas mais flexíveis e abrangentes:
# LEFT JOIN → Prioriza os registros da tabela à esquerda e exibe todos os alunos, mesmo os que não estão matriculados.
# RIGHT JOIN → Prioriza os registros da tabela à direita e exibe todos os cursos, mesmo os que não têm alunos matriculados.
# FULL JOIN → Exibe todos os registros de ambas as tabelas, preenchendo campos não correspondentes com NULL.
# CROSS JOIN → Combina todas as linhas da tabela A com todas as linhas da tabela B, gerando combinações amplas.
Com essas técnicas, conseguimos estruturar consultas mais eficientes e garantir que informações importantes não sejam 
omitidas. Na próxima aula, aprenderemos mais sobre restrições de relacionamento e como elas impactam a integridade dos dados.
*/


/*
================
O que aprendemos
================
Nesta aula, aprendemos:

# Como funciona a chave primária
# Como funciona os campos que aceitam NULL e que não aceitam NULL (NOT NULL)
# Como funciona um campo UNIQUE
# Como criar uma chave primária
# Como funciona a chave estrangeira
# Como criar uma chave estrangeira
# Como criar consultas com relacionamentos
	# INNER JOIN
	# LEFT JOIN
	# RIGHT JOIN
	# FULL JOIN
	# CROSS JOIN
*/


/*
-------------------------------------------------------------------------------------------------------------------------
	Módulo 5 - Usando CASCADE
-------------------------------------------------------------------------------------------------------------------------
*/

-- ==============
-- DELETE CASCADE
-- ==============
/*
Nesta aula, exploraremos as restrições de chaves estrangeiras e como ON DELETE CASCADE pode garantir que registros 
relacionados sejam excluídos automaticamente, evitando erros ao deletar dados. Para entender sua aplicação, primeiro 
verificamos o estado atual do banco de dados:
*/

SELECT * FROM aluno;
-- Retorno
/*
"id"	"nome"
1		"Diogo"
2		"Vinícius"
3		"Nico"
4		"João"
*/

SELECT * FROM aluno_curso;
-- Retorno
/*
"aluno_id"	"curso_id"
1			1
2			1
2			2
*/

SELECT * FROM curso;
-- Retorno
/*
"id"	"nome"
1		"HTML"
2		"Javascript"
3		"CSS"
*/

/*
Temos quatro alunos na tabela aluno, três cursos na tabela curso e quatro matrículas registradas na tabela aluno_curso. 
Como não definimos restrições específicas, ao tentar excluir um aluno diretamente, recebemos um erro:
*/

DELETE FROM aluno WHERE id = 1;

/*
ERROR:  update or delete on table "aluno" violates foreign key constraint "aluno_curso_aluno_id_fkey" on table "aluno_curso"
Key (id)=(1) is still referenced from table "aluno_curso". 

SQL state: 23503
Detail: Key (id)=(1) is still referenced from table "aluno_curso".
*/

/*
Isso acontece porque esse aluno está vinculado à tabela aluno_curso, e a restrição padrão ON DELETE RESTRICT impede a 
exclusão de dados que possuem relações em outras tabelas. Para resolver esse problema, utilizaremos ON DELETE CASCADE, 
que garante que, ao excluir um registro principal (aluno), todos os seus registros relacionados em aluno_curso sejam 
apagados automaticamente.
*/

-- =====================================================
-- Modificando a chave estrangeira com ON DELETE CASCADE
-- =====================================================
/*
Vamos recriar a tabela aluno_curso com essa funcionalidade. Primeiro, apagamos a versão existente:
*/

DROP TABLE aluno_curso;

/*
Agora, criamos a nova estrutura incluindo ON DELETE CASCADE na chave estrangeira que faz referência à tabela aluno:
*/

CREATE TABLE aluno_curso (
    aluno_id INTEGER,
    curso_id INTEGER,
    PRIMARY KEY (aluno_id, curso_id),

    FOREIGN KEY (aluno_id)
        REFERENCES aluno (id)
        ON DELETE CASCADE,

    FOREIGN KEY (curso_id)
        REFERENCES curso (id)
);

-- =======================
-- Testando DELETE CASCADE
-- =======================

-- Agora, registramos novas matrículas para testar a funcionalidade:

INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (1,1);
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (2,1);
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (3,1);
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (1,3);

-- Podemos verificar as matrículas com a consulta JOIN:

SELECT
	ALUNO.NOME AS "Nome do Aluno",
	CURSO.NOME AS "Nome do Curso"
FROM
	ALUNO
	JOIN ALUNO_CURSO ON ALUNO_CURSO.ALUNO_ID = ALUNO.ID
	JOIN CURSO ON CURSO.ID = ALUNO_CURSO.CURSO_ID;

-- Retorno
/*
"Nome do Aluno"		"Nome do Curso"
"Diogo"				"HTML"
"Vinícius"			"HTML"
"Nico"				"HTML"
"Diogo"				"CSS"
*/

-- Agora, excluímos o aluno id = 1:

DELETE FROM aluno WHERE id = 1;

/*
Desta vez, ao invés de um erro, recebemos uma mensagem de sucesso. Para confirmar que a exclusão ocorreu corretamente, 
verificamos novamente as tabelas:
*/

SELECT * FROM aluno; -- O aluno "Diogo" foi excluído
-- Retorno
/*
"id"	"nome"
2		"Vinícius"
3		"Nico"
4		"João"
*/

SELECT * FROM aluno_curso; -- Suas matrículas também foram removidas
-- Retorno
/*
"aluno_id"	"curso_id"
2			1
3			1
*/

-- Todos os registros relacionados ao aluno id = 1 foram apagados automaticamente.

/*
Conclusão
=========
Nesta aula, vimos como ON DELETE CASCADE facilita a manutenção do banco de dados, garantindo que, ao excluir um registro 
principal, seus dados relacionados também sejam removidos. Isso evita inconsistências e permite um gerenciamento mais 
eficiente.

Na próxima aula, aprenderemos como aplicar esse mesmo conceito com UPDATE CASCADE, garantindo que alterações feitas em 
registros principais sejam propagadas para tabelas relacionadas.
*/

-- ==============
-- UPDATE CASCADE
-- ==============
/*
Agora que entendemos DELETE CASCADE, aprenderemos ON UPDATE CASCADE, que garante que alterações feitas em registros 
principais também sejam refletidas nas tabelas relacionadas. Sem essa opção, tentativas de modificar valores em colunas 
que possuem chaves estrangeiras podem resultar em erros devido à restrição de integridade referencial.
*/

-- O problema ao atualizar chaves primárias
-- ========================================

-- Vamos tentar alterar o id do aluno Vinícius na tabela aluno:

UPDATE aluno
    SET id = 10
    WHERE id = 2;

-- Retorno
/*
ERROR:  update or delete on table "aluno" violates foreign key constraint "aluno_curso_aluno_id_fkey" on table "aluno_curso"
Key (id)=(2) is still referenced from table "aluno_curso". 

SQL state: 23503
Detail: Key (id)=(2) is still referenced from table "aluno_curso".
*/

/*
Esse comando solicita ao banco de dados que atualize o id = 2 para id = 10, mas retorna um erro. Isso ocorre porque esse 
aluno possui registros relacionados na tabela aluno_curso, e a chave estrangeira impede a alteração para evitar 
inconsistências.
*/

-- Se tentarmos modificar o id do João, que não possui matrículas associadas, o comando será executado com sucesso:

UPDATE aluno
    SET id = 20
    WHERE id = 4;

-- Retorno
/*
UPDATE 1

Query returned successfully in 147 msec.
*/

-- Para permitir a atualização de registros vinculados, precisamos modificar nossa chave estrangeira para incluir 
-- ON UPDATE CASCADE.

-- =====================================================
-- Modificando a chave estrangeira com ON UPDATE CASCADE
-- =====================================================

-- Primeiro, apagamos a tabela aluno_curso para recriá-la com a nova configuração:

DROP TABLE aluno_curso;

-- Agora, adicionamos ON UPDATE CASCADE na chave estrangeira que referencia a tabela aluno:

CREATE TABLE aluno_curso (
    aluno_id INTEGER,
    curso_id INTEGER,
    PRIMARY KEY (aluno_id, curso_id),

    FOREIGN KEY (aluno_id)
        REFERENCES aluno (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    FOREIGN KEY (curso_id)
        REFERENCES curso (id)
);

-- =======================
-- Testando UPDATE CASCADE
-- =======================

/*
Com a tabela recriada, registramos as matrículas novamente, tomando cuidado para não incluir o aluno Diogo, que foi 
excluído anteriormente:
*/

INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (2,1);
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (3,1);

-- Para visualizar as matrículas e os IDs dos alunos e cursos, usamos:

SELECT 
       aluno.id AS aluno_id,
       aluno.nome AS "Nome do Aluno",
       curso.id AS curso_id,
       curso.nome AS "Nome do Curso"
  FROM aluno
  JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
  JOIN curso ON curso.id = aluno_curso.curso_id;

-- Retorno
/*
"aluno_id"	"Nome do Aluno"	"curso_id"	"Nome do Curso"
2			"Vinícius"		1			"HTML"
3			"Nico"			1			"HTML"
*/

-- Agora, tentamos novamente atualizar o id do aluno Vinícius:

UPDATE aluno
    SET id = 10
    WHERE id = 2;

-- Desta vez, o comando é executado com sucesso. Ao rodar a consulta anterior, vemos que o id do Vinícius mudou para 10. 

SELECT 
       aluno.id AS aluno_id,
       aluno.nome AS "Nome do Aluno",
       curso.id AS curso_id,
       curso.nome AS "Nome do Curso"
  FROM aluno
  JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
  JOIN curso ON curso.id = aluno_curso.curso_id;

-- Retorno
/*
"aluno_id"	"Nome do Aluno"	"curso_id"	"Nome do Curso"
3			"Nico"			1			"HTML"
10			"Vinícius"		1			"HTML"
*/

-- Verificando a tabela aluno_curso:

SELECT * FROM aluno_curso;

-- Retorno
/*
"aluno_id"	"curso_id"
3			1
10			1
*/

/*
Percebemos que a atualização do id também foi refletida na tabela aluno_curso, garantindo que os registros permaneçam 
consistentes em ambas as tabelas.
*/

/*
Conclusão
=========
Com ON UPDATE CASCADE, qualquer modificação em uma chave primária na tabela aluno é automaticamente propagada para as 
tabelas relacionadas, evitando problemas de integridade e permitindo um gerenciamento mais eficiente dos dados.

Na próxima aula, aprenderemos como lidar com alterações nas consultas e explorar formas avançadas de manipulação de dados.
*/


/*
================
O que aprendemos
================

Nesta aula, aprendemos:

    # Como funcionam as restrições de chave estrangeira
    # A diferença entre RESTRICT e CASCADE
    # Como aplicar tipos diferentes de restrições de chave estrangeira no DELETE
    # RESTRICT
    # CASCADE
    # A aplicar tipos diferentes de restrições de chave estrangeira no UPDATE
    # RESTRICT
    # CASCADE
*/


/*
-------------------------------------------------------------------------------------------------------------------------
	Módulo 6 - Avançando com Consultas
-------------------------------------------------------------------------------------------------------------------------
*/

-- ======================
-- Ordenando as consultas
-- ======================

-- Nesta aula, aprenderemos como organizar consultas SQL utilizando ORDER BY. Essa cláusula é essencial para tornar a 
-- apresentação dos resultados mais clara, especialmente em tabelas grandes. Para isso, criaremos uma tabela simulando o 
-- cadastro de funcionários:

CREATE TABLE funcionarios(
    id SERIAL PRIMARY KEY,
    matricula VARCHAR(10),
    nome VARCHAR(255),
    sobrenome VARCHAR(255)
);

-- Agora, inserimos alguns registros:

INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M001', 'Diogo', 'Mascarenhas');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M002', 'Vinícius', 'Dias');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M003', 'Nico', 'Steppat');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M004', 'João', 'Roberto');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M005', 'Diogo', 'Mascarenhas');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M006', 'Alberto', 'Martins');

-- Executando SELECT * FROM funcionarios;, confirmamos que os registros foram incluídos corretamente.

SELECT * FROM funcionarios;

-- Retorno
/*
"id"	"matricula"	"nome"		"sobrenome"
1		"M001"		"Diogo"		"Mascarenhas"
2		"M002"		"Vinícius"	"Dias"
3		"M003"		"Nico"		"Steppat"
4		"M004"		"João"		"Roberto"
5		"M005"		"Diogo"		"Mascarenhas"
6		"M006"		"Alberto"	"Martins"
*/

-- ==========================================
-- Usando ORDER BY para ordenar os resultados
-- ==========================================

-- O comando ORDER BY nos permite definir a ordem em que os resultados serão exibidos. Por padrão, a ordenação ocorre em 
-- ordem crescente:

SELECT * 
  FROM funcionarios
  ORDER BY nome;

-- Retorno
/*
"id"	"matricula"	"nome"		"sobrenome"
6		"M006"		"Alberto"	"Martins"
1		"M001"		"Diogo"		"Mascarenhas"
5		"M005"		"Diogo"		"Mascarenhas"
4		"M004"		"João"		"Roberto"
3		"M003"		"Nico"		"Steppat"
2		"M002"		"Vinícius"	"Dias"
*/

-- Caso queiramos ordenar os resultados em ordem decrescente, utilizamos DESC:

SELECT * 
  FROM funcionarios
  ORDER BY nome DESC;

-- Retorno
/*
"id"	"matricula"	"nome"	"sobrenome"
2	"M002"	"Vinícius"	"Dias"
3	"M003"	"Nico"	"Steppat"
4	"M004"	"João"	"Roberto"
1	"M001"	"Diogo"	"Mascarenhas"
5	"M005"	"Diogo"	"Mascarenhas"
6	"M006"	"Alberto"	"Martins"
*/

-- Também podemos ordenar por múltiplas colunas. Por exemplo, se quisermos organizar os registros primeiro pelo nome 
-- e depois pela matricula, usamos:

SELECT * 
  FROM funcionarios
  ORDER BY nome, matricula;

-- Retorno
/*
"id"	"matricula"	"nome"		"sobrenome"
6		"M006"		"Alberto"	"Martins"
1		"M001"		"Diogo"		"Mascarenhas"
5		"M005"		"Diogo"		"Mascarenhas"
4		"M004"		"João"		"Roberto"
3		"M003"		"Nico"		"Steppat"
2		"M002"		"Vinícius"	"Dias"
*/

-- Aqui, os registros serão ordenados pelo nome de forma crescente e, em casos de nomes repetidos, a matrícula definirá 
-- a ordem.

-- Para inverter a ordem da matrícula, aplicamos DESC somente a ela:

SELECT * 
  FROM funcionarios
  ORDER BY nome, matricula DESC;

-- Retorno
/*
"id"	"matricula"	"nome"		"sobrenome"
6		"M006"		"Alberto"	"Martins"
5		"M005"		"Diogo"		"Mascarenhas"
1		"M001"		"Diogo"		"Mascarenhas"
4		"M004"		"João"		"Roberto"
3		"M003"		"Nico"		"Steppat"
2		"M002"		"Vinícius"	"Dias"
*/

-- ===============================
-- Ordenação por posição da coluna
-- ===============================
/*
Outra forma de organizar os registros é usando a posição da coluna ao invés do seu nome. Na nossa tabela:

    id → posição 1
    matricula → posição 2
    nome → posição 3
    sobrenome → posição 4

*/

-- Podemos ordenar pela quarta coluna (sobrenome) informando sua posição:

SELECT * 
  FROM funcionarios
  ORDER BY 4;

-- Retorno
/*
"id"	"matricula"	"nome"	    "sobrenome"
2	    "M002"	    "Vinícius"	"Dias"
6	    "M006"	    "Alberto"	"Martins"
1	    "M001"	    "Diogo"	    "Mascarenhas"
5	    "M005"	    "Diogo"	    "Mascarenhas"
4	    "M004"	    "João"	    "Roberto"
3	    "M003"	    "Nico"	    "Steppat"
*/

-- Se quisermos organizar por múltiplas colunas, como nome, sobrenome e matricula, usamos:

SELECT * 
  FROM funcionarios
  ORDER BY 3, 4, 2;

-- Retorno
/*
"id"	"matricula"	"nome"	    "sobrenome"
6	    "M006"	    "Alberto"	"Martins"
1	    "M001"	    "Diogo"	    "Mascarenhas"
5	    "M005"	    "Diogo"	    "Mascarenhas"
4	    "M004"	    "João"	    "Roberto"
3	    "M003"	    "Nico"	    "Steppat"
2	    "M002"	    "Vinícius"	"Dias"
*/

-- Isso gera uma ordenação pelos nomes primeiro, depois pelos sobrenomes e, por último, pelas matrículas.

-- Agora, adicionamos um novo registro para ver a ordenação em ação:

INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M007', 'Diogo', 'Oliveira');

-- Executamos:

SELECT * 
  FROM funcionarios
  ORDER BY 3, 4, 2;

-- Retorno
/*
"id"	"matricula"	"nome"	    "sobrenome"
6	    "M006"	    "Alberto"	"Martins"
1	    "M001"	    "Diogo"	    "Mascarenhas"
5	    "M005"	    "Diogo"	    "Mascarenhas"
7	    "M007"	    "Diogo"	    "Oliveira"
4	    "M004"	    "João"	    "Roberto"
3	    "M003"	    "Nico"	    "Steppat"
2	    "M002"	    "Vinícius"	"Dias"
*/

-- Aqui, os registros com o nome "Diogo" aparecem juntos, mas, como o sobrenome "Mascarenhas" vem antes de "Oliveira" 
-- alfabeticamente, ele aparece primeiro.

-- ======================================================
-- Evitando Ambiguidade ao Ordenar Colunas Compartilhadas
-- ======================================================

-- Ao trabalhar com JOIN, pode haver campos com o mesmo nome em diferentes tabelas. Para evitar erros, especificamos o 
-- nome da tabela ao ordenar:

SELECT 
       aluno.id AS aluno_id,
       aluno.nome AS "Nome do Aluno",
       curso.id AS curso_id,
       curso.nome AS "Nome do Curso"
  FROM aluno
  JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
  JOIN curso ON curso.id = aluno_curso.curso_id
  ORDER BY aluno.nome;

-- Retorno
/*
"aluno_id"	"Nome do Aluno"	"curso_id"	"Nome do Curso"
3	        "Nico"	        1	        "HTML"
10	        "Vinícius"	    1	        "HTML"
*/

-- Esse comando ordena os registros pelo nome do aluno. Se quisermos organizá-los pelo nome do curso primeiro, fazemos:
-- ORDER BY curso.nome, aluno.nome;

SELECT 
       aluno.id AS aluno_id,
       aluno.nome AS "Nome do Aluno",
       curso.id AS curso_id,
       curso.nome AS "Nome do Curso"
  FROM aluno
  JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
  JOIN curso ON curso.id = aluno_curso.curso_id
  ORDER BY curso.nome, aluno.nome;

-- Retorno
/*
"aluno_id"	"Nome do Aluno"	"curso_id"	"Nome do Curso"
3	"Nico"	1	"HTML"
10	"Vinícius"	1	"HTML"
*/

-- Agora, os cursos aparecem em ordem crescente, e dentro de cada curso os alunos estão ordenados alfabeticamente.

-- ======================
-- Limitando as consultas
-- ======================

-- Quando uma tabela contém muitos registros, podemos limitar a quantidade de resultados exibidos com a cláusula LIMIT. 
-- Isso torna as buscas mais eficientes e evita retornos excessivos.

-- Para exibir apenas os cinco primeiros registros, utilizamos:

SELECT * 
  FROM funcionarios
  LIMIT 5;

-- Retorno
/*
"id"	"matricula"	"nome"	    "sobrenome"
1	    "M001"	    "Diogo"	    "Mascarenhas"
2	    "M002"	    "Vinícius"	"Dias"
3	    "M003"	    "Nico"	    "Steppat"
4	    "M004"	    "João"	    "Roberto"
5	    "M005"	    "Diogo"	    "Mascarenhas"
*/

-- Para ordenar antes de limitar os resultados:

SELECT * 
  FROM funcionarios
  ORDER BY nome
  LIMIT 5;

-- Retorno
/*
"id"	"matricula"	"nome"	    "sobrenome"
6	    "M006"	    "Alberto"	"Martins"
5	    "M005"	    "Diogo"	    "Mascarenhas"
7	    "M007"	    "Diogo"	    "Oliveira"
1	    "M001"	    "Diogo"	    "Mascarenhas"
4	    "M004"	    "João"	    "Roberto"
*/

-- ============================
-- Pulando registros com OFFSET
-- ============================

-- Se quisermos exibir resultados após ignorar um certo número de linhas, usamos OFFSET. No exemplo abaixo, pulamos o 
-- primeiro registro e exibimos os cinco seguintes:

SELECT * 
  FROM funcionarios
  ORDER BY id
  LIMIT 5
  OFFSET 1;

-- Retorno
/*
"id"	"matricula"	"nome"	    "sobrenome"
2	    "M002"	    "Vinícius"	"Dias"
3	    "M003"	    "Nico"	    "Steppat"
4	    "M004"	    "João"	    "Roberto"
5	    "M005"	    "Diogo"	    "Mascarenhas"
6	    "M006"	    "Alberto"	"Martins"
*/

-- Podemos testar outras combinações:

-- OFFSET 2; -- Exibe registros a partir do ID 3
SELECT * 
  FROM funcionarios
  ORDER BY id
  LIMIT 5
  OFFSET 2;

-- Retorno
/*
"id"	"matricula"	"nome"	    "sobrenome"
3	    "M003"	    "Nico"	    "Steppat"
4	    "M004"	    "João"	    "Roberto"
5	    "M005"	    "Diogo"	    "Mascarenhas"
6	    "M006"	    "Alberto"	"Martins"
7	    "M007"	    "Diogo"	    "Oliveira"
*/

-- OFFSET 3; -- Exibe registros a partir do ID 4
SELECT * 
  FROM funcionarios
  ORDER BY id
  LIMIT 5
  OFFSET 3;

-- Retorno
/*
"id"	"matricula"	"nome"	    "sobrenome"
4	    "M004"	    "João"	    "Roberto"
5	    "M005"	    "Diogo"	    "Mascarenhas"
6	    "M006"	    "Alberto"	"Martins"
7	    "M007"	    "Diogo"	    "Oliveira"
*/

-- Caso OFFSET ultrapasse o número total de registros disponíveis, a consulta pode retornar um conjunto menor de resultados.

/*
-- =========
-- Conclusão
-- =========
Os comandos ORDER BY, LIMIT e OFFSET são essenciais para otimizar consultas SQL. Eles permitem organizar os resultados, 
limitar sua quantidade e definir quais registros devem ser exibidos. Na próxima aula, aprofundaremos outros aspectos para 
manipulação avançada dos dados.
*/

-- ====================
-- Funções de Agregação
-- ====================

-- Nesta aula, aprenderemos sobre as funções de agregação, que permitem calcular estatísticas sobre conjuntos de registros, 
-- como contagens, somas e médias. Essas funções são essenciais para gerar relatórios e análises de dados.

-- Os comandos de agregação mais comuns são:

-- COUNT - Conta a quantidade de registros
-- SUM   - Calcula a soma dos valores
-- MAX   - Retorna o maior valor de um conjunto
-- MIN   - Retorna o menor valor de um conjunto
-- AVG   - Calcula a média dos valores

-- =================================
-- Contagem de registros com COUNT()
-- =================================

-- A função COUNT() retorna o número total de registros de uma tabela. Ela pode contar registros específicos ou usar 
-- COUNT(*) para incluir todas as linhas, independentemente de valores NULL.

SELECT COUNT(*) 
  FROM funcionarios;

-- Retorno
/*
"count"
7
*/

-- Se quisermos contar apenas os registros onde id não seja NULL, utilizamos:

SELECT COUNT(id) 
  FROM funcionarios;

-- Retorno
/*
"count"
7
*/

-- No caso da nossa tabela, ambas as consultas retornam 7, porque todos os registros possuem valores preenchidos em id.

-- =================================================
-- Obtendo valores máximo e mínimo com MAX() e MIN()
-- =================================================

-- Podemos encontrar o maior valor de um conjunto de registros utilizando MAX():

SELECT MAX(id) 
  FROM funcionarios;

-- Retorno
/*
"max"
7
*/

-- Esse comando retorna 7, pois é o maior id registrado. Da mesma forma, para obter o menor valor:

SELECT MIN(id) 
  FROM funcionarios;

-- Retorno
/*
"min"
1
*/

-- O retorno será 1, pois esse é o menor id na tabela.

-- ======================================================
-- Calculando médias com AVG() e arredondando com ROUND()
-- ======================================================

-- A função AVG() retorna a média dos valores de uma coluna:

SELECT AVG(id) 
  FROM funcionarios;

-- Retorno
/*
"avg"
4.0000000000000000
*/

-- O resultado será 4, obtido dividindo a soma total (28) pelo número de registros (7).

-- Por padrão, o retorno da média pode incluir várias casas decimais. Para controlar essa precisão, usamos ROUND

SELECT ROUND(AVG(id), 2) 
  FROM funcionarios;

-- Retorno
/*
"round"
4.00
*/

-- Esse comando arredonda a média para duas casas decimais. Se quisermos um valor inteiro, usamos:

SELECT ROUND(AVG(id), 0) 
  FROM funcionarios;

-- Retorno
/*
"round"
4
*/

-- Esse comando retorna 4, arredondando para o número inteiro mais próximo.

-- =============================================================
-- Exibindo múltiplas funções de agregação em uma única consulta
-- =============================================================

-- Podemos utilizar várias funções de agregação ao mesmo tempo para obter um conjunto completo de estatísticas:

SELECT COUNT(id) AS total_registros,
       SUM(id) AS soma_total,
       MAX(id) AS maior_id,
       MIN(id) AS menor_id,
       ROUND(AVG(id), 0) AS media_id
  FROM funcionarios;

-- Retorno
/*
"total_registros"	"soma_total"	"maior_id"	"menor_id"	"media_id"
7	                28	          7	          1	          4
*/

-- Essa consulta retorna um único registro contendo todas essas informações agregadas.

/*
=========
Conclusão
=========
As funções de agregação permitem realizar cálculos estatísticos sobre conjuntos de registros, tornando as consultas mais 
poderosas para análise de dados. Agora que entendemos como calcular somas, médias, contagens e máximos/mínimos, na próxima 
aula exploraremos GROUP BY, que nos permitirá agrupar os resultados em categorias.
*/

-- ===================
-- Agrupando Consultas
-- ===================

-- Nesta aula, aprenderemos como agrupar registros em consultas para organizar os dados de maneira mais eficiente. Esse 
-- processo nos permite evitar duplicatas e aplicar funções de agregação sobre grupos de registros.

/*
Existem dois comandos principais para agrupamento:

    DISTINCT → Remove valores duplicados, listando apenas ocorrências únicas de um campo.
    GROUP BY → Agrupa registros semelhantes para aplicar funções de agregação, como COUNT() ou SUM().
*/

-- =================================
-- Removendo duplicatas com DISTINCT
-- =================================

-- Vamos começar verificando os registros da tabela funcionarios:

SELECT * FROM funcionarios;

-- Retorno
/*
"id"	"matricula"	"nome"	    "sobrenome"
1	    "M001"	    "Diogo"	    "Mascarenhas"
2	    "M002"	    "Vinícius"	"Dias"
3	    "M003"	    "Nico"	    "Steppat"
4	    "M004"	    "João"	    "Roberto"
5	    "M005"	    "Diogo"	    "Mascarenhas"
6	    "M006"	    "Alberto"	  "Martins"
7	    "M007"	    "Diogo"	    "Oliveira"
*/

-- Essa consulta retorna múltiplos nomes, incluindo três registros para "Diogo". Para listar os nomes únicos sem 
-- repetições, usamos DISTINCT:

SELECT DISTINCT nome
  FROM funcionarios
  ORDER BY nome;

-- Retorno
/*
"nome"
"Alberto"
"Diogo"
"João"
"Nico"
"Vinícius"
*/

-- Essa consulta retorna "Diogo" apenas uma vez.

-- Se adicionarmos o sobrenome ao DISTINCT, o agrupamento será baseado em ambos os campos:

SELECT DISTINCT nome, sobrenome
  FROM funcionarios
  ORDER BY nome;

-- Retorno
/*
"nome"	    "sobrenome"
"Alberto"	  "Martins"
"Diogo"	    "Mascarenhas"
"Diogo"	    "Oliveira"
"João"	    "Roberto"
"Nico"	    "Steppat"
"Vinícius"	"Dias"
*/

-- Agora, "Diogo Mascarenhas" e "Diogo Oliveira" aparecem separadamente, pois o sobrenome faz parte do critério de 
-- distinção.

-- =========================================
-- Contando registros agrupados com GROUP BY
-- =========================================

-- Agora queremos contar quantas vezes cada nome aparece. Se tentarmos usar COUNT(*) com DISTINCT, receberemos um erro:

SELECT DISTINCT
	NOME,
	SOBRENOME,
	COUNT(*)
FROM
	FUNCIONARIOS
ORDER BY
	NOME;

-- Retorno
/*
ERROR:  column "funcionarios.nome" must appear in the GROUP BY clause or be used in an aggregate function
LINE 2:  NOME,
         ^ 

SQL state: 42803
Character: 18
*/

-- Isso ocorre porque COUNT() requer um agrupamento explícito. Para corrigir, usamos GROUP BY:

SELECT
	NOME,
	SOBRENOME,
	COUNT(*)
FROM
	FUNCIONARIOS
GROUP BY
	NOME,
	SOBRENOME
ORDER BY
	NOME;

-- Retorno
/*
"nome"	    "sobrenome"	  "count"
"Alberto"	"Martins"	    1
"Diogo"	    "Mascarenhas"	2
"Diogo"	    "Oliveira"	  	1
"João"	    "Roberto"	    1
"Nico"	    "Steppat"	    1
"Vinícius"	"Dias"	      	1
*/

-- Essa consulta retorna a quantidade de registros para cada nome e sobrenome combinados.

-- Também podemos utilizar a posição da coluna no GROUP BY: 

SELECT nome, sobrenome, COUNT(*)
  FROM funcionarios
  GROUP BY 1, 2
  ORDER BY 1;

-- Retorno
/*
"nome"	    "sobrenome"	  "count"
"Alberto"	"Martins"	    1
"Diogo"	    "Mascarenhas"	2
"Diogo"	    "Oliveira"	  	1
"João"	    "Roberto"	    1
"Nico"	    "Steppat"	    1
"Vinícius"	"Dias"	      	1
*/

-- ATENÇÃO: Embora funcione, essa abordagem pode tornar consultas grandes mais difíceis de interpretar.

-- ============================
-- Agrupando registros com JOIN
-- ============================

-- Agora, aplicamos GROUP BY para contar o número de alunos em cada curso. Primeiro, listamos as matrículas existentes:

SELECT *
    FROM aluno
    JOIN aluno_curso ON aluno.id = aluno_curso.aluno_id
    JOIN curso ON curso.id = aluno_curso.curso_id;

-- Retorno
/*
"id"	"nome"		"aluno_id"	"curso_id"	"id-2"	"nome-2"
3		"Nico"		3			1			1		"HTML"
10		"Vinícius"	10			1			1		"HTML"
*/

-- Essa consulta exibe alunos e cursos vinculados. Agora, agrupamos os cursos e contamos quantos alunos estão matriculados 
-- em cada um:

SELECT curso.nome, COUNT(aluno.id)
    FROM aluno
    JOIN aluno_curso ON aluno.id = aluno_curso.aluno_id
    JOIN curso ON curso.id = aluno_curso.curso_id
    GROUP BY curso.nome
    ORDER BY curso.nome;

-- Retorno
/*
"nome"	"count"
"HTML"	2
*/

/*
=========
Conclusão
=========
As funções DISTINCT e GROUP BY são essenciais para organizar consultas e evitar duplicatas. DISTINCT remove valores 
repetidos, enquanto GROUP BY permite aplicar funções de agregação aos grupos de registros.

Agora que entendemos como agrupar consultas, na próxima aula exploraremos formas avançadas de manipulação de dados!
*/

-- =============================
-- Filtrando Consultas Agrupadas
-- =============================

-- Nesta aula, aprenderemos a filtrar consultas que envolvem agrupamentos. Quando utilizamos GROUP BY, o filtro padrão 
-- WHERE não pode ser aplicado diretamente sobre funções agregadas, pois ele atua antes da agregação. Para isso, utilizamos 
-- HAVING, que permite filtrar os registros após a agregação.

-- Verificando informações antes de filtrar
-- ========================================

-- Antes de começarmos a filtrar dados, verificamos as tabelas relacionadas para entender como os registros estão 
-- organizados:

SELECT * FROM aluno;
-- Retorno
/*
"id"	"nome"
3		"Nico"
20		"João"
10		"Vinícius"
*/

SELECT * FROM aluno_curso;
-- Retorno
/*
"aluno_id"	"curso_id"
3			1
10			1
*/

SELECT * FROM curso;
-- Retorno
/*
"id"	"nome"
1		"HTML"
2		"Javascript"
3		"CSS"
*/

-- Isso nos mostra os alunos cadastrados, as matrículas existentes e os cursos disponíveis.

-- Agora, queremos identificar os cursos sem alunos matriculados. Primeiro, listamos todos os cursos, independentemente 
-- de terem alunos ou não:

SELECT *
    FROM curso
    LEFT JOIN aluno_curso ON aluno_curso.curso_id = curso.id
    LEFT JOIN aluno ON aluno.id = aluno_curso.aluno_id;

-- Retorno
/*
"id"	"nome"	      "aluno_id"	"curso_id"	"id-2"	"nome-2"
1	    "HTML"	      3	          	1	          3	    "Nico"
1	    "HTML"	      10	        1	          10	"Vinícius"
2	    "Javascript"				
3	    "CSS"				
*/

-- Nos resultados, constatamos que o curso de Javascript não tem alunos matriculados.

-- =========================================
-- Filtrando cursos por quantidade de alunos
-- =========================================

-- Para exibir a quantidade de alunos em cada curso, utilizamos COUNT():

SELECT curso.nome,
       COUNT(aluno.id)
  FROM curso
  LEFT JOIN aluno_curso ON aluno_curso.curso_id = curso.id
  LEFT JOIN aluno ON aluno.id = aluno_curso.aluno_id
  GROUP BY curso.nome;

-- Retorno
/*
"nome"			"count"
"Javascript"	0
"CSS"			0
"HTML"			2
*/

-- Agora, queremos filtrar os cursos que não têm alunos. Podemos tentar WHERE, mas isso causará um erro:

SELECT curso.nome,
       COUNT(aluno.id)
  FROM curso
  LEFT JOIN aluno_curso ON aluno_curso.curso_id = curso.id
  LEFT JOIN aluno ON aluno.id = aluno_curso.aluno_id
  WHERE COUNT(aluno.id) = 0
  GROUP BY curso.nome;

-- Retorno
/*
ERROR:  aggregate functions are not allowed in WHERE
LINE 6:   WHERE COUNT(aluno.id) = 0 -- ERRO!
                ^ 

SQL state: 42803
Character: 176
*/

-- O erro ocorre porque WHERE não pode ser usado para filtrar funções agregadas como COUNT(). Para corrigir isso, usamos 
-- HAVING:

SELECT curso.nome,
       COUNT(aluno.id)
  FROM curso
  LEFT JOIN aluno_curso ON aluno_curso.curso_id = curso.id
  LEFT JOIN aluno ON aluno.id = aluno_curso.aluno_id
  GROUP BY curso.nome
  HAVING COUNT(aluno.id) = 0;

-- Retorno
/*
"nome"			"count"
"Javascript"	0
"CSS"			0
*/

-- Agora, o curso de Javascript é exibido corretamente, mostrando que ele não tem alunos.

-- Se quisermos listar apenas os cursos com alunos, alteramos o operador = para >:
-- HAVING COUNT(aluno.id) > 0;

SELECT curso.nome,
       COUNT(aluno.id)
  FROM curso
  LEFT JOIN aluno_curso ON aluno_curso.curso_id = curso.id
  LEFT JOIN aluno ON aluno.id = aluno_curso.aluno_id
  GROUP BY curso.nome
  HAVING COUNT(aluno.id) > 0;

-- Retorno
/*
"nome"	"count"
"HTML"	2
*/

-- Isso retorna apenas o cursos HTML.

-- ===========================================
-- Filtrando funcionários com nomes duplicados
-- ===========================================

-- Vamos agora aplicar HAVING na tabela funcionarios. Se quisermos listar funcionários cujos nomes aparecem mais de uma 
-- vez, utilizamos:

SELECT nome
  FROM funcionarios
  GROUP BY nome
  HAVING COUNT(id) > 1;

-- Retorno
/*
"nome"
"Diogo"
*/

-- O resultado mostra apenas os nomes que possuem mais de um registro. Para saber quantas vezes cada nome se repete, usamos
-- COUNT(id):

SELECT nome,
       COUNT(id)
  FROM funcionarios
  GROUP BY nome
  HAVING COUNT(id) > 1;

-- Retorno
/*
"nome"	"count"
"Diogo"	3
*/

-- O retorno indica que "Diogo" aparece três vezes.

-- Para filtrar apenas os funcionários com nomes únicos, alteramos > para =: HAVING COUNT(id) = 1;

SELECT nome,
       COUNT(id)
  FROM funcionarios
  GROUP BY nome
  HAVING COUNT(id) = 1;

-- Retorno
/*
"nome"		"count"
"Nico"		1
"João"		1
"Vinícius"	1
"Alberto"	1
*/

/*
=========
Conclusão
=========
Nesta aula, aprendemos que:

    WHERE filtra antes do agrupamento e só pode ser usado em colunas individuais.
    HAVING filtra após o agrupamento e permite filtrar por funções agregadas, como COUNT() e AVG().
    Podemos usar HAVING para identificar registros duplicados ou para excluir grupos específicos.
*/


/*
================
O que aprendemos
================
Nesta aula, aprendemos:

    # Como ordenar uma consulta
        # Ordenar utilizando os nomes de campo
        # Ordenar com mais de um campo
        # Ordenar por posição do campo
        # Ordenar por ordem Crescente e Decrescente
        # Ordenar com campos de tabelas diferentes
    # Como limitar quantidade e paginar registros de consulta
        # LIMIT
        # OFFSET
    # Como funcionam as funções de agregação
        # COUNT
        # SUM
        # MAX
        # MIN
        # AVG
    # Como funciona a função de arredondamento ROUND
    # Como funciona o agrupamento de dados
        # A diferença entre DISTINCT e GROUP BY
        # Onde utilizar o DISTINCT
        # Onde utilizar o GROUP BY
        # Como utilizar o GROUP BY com os nomes de campo
        # Como utilizar o GROUP BY por posição
    # Como funcionam os filtros por funções de agrupamento, utilizando HAVING
        # A diferença entre WHERE e HAVING
        # Como utilizar o HAVING

*/


/*
-------------------------------------------------------------------------------------------------------------------------
	FIM
-------------------------------------------------------------------------------------------------------------------------
*/