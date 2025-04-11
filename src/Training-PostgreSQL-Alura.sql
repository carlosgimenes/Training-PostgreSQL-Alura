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
SELECT NOW();

-- Criando o Banco de Dados "alura"
CREATE DATABASE alura;

-- Listando os Bancos de Dados
SELECT datname FROM pg_database;

-- Excluindo o Banco de Dados "alura"
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

-- Tabela aluno

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
SELECT * FROM aluno;

-- Excluindo uma Tabela
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


-- Visualizando regsitro incluido na tabela
SELECT * FROM aluno;

-- Atualizando um registro na tabela

/*
Primeiramente, vamos selecionar os dados da tabela utilizando o SELECT * FROM. É fundamental usar o WHERE para filtrar os registros 
que serão atualizados, evitando alterações em todos os dados. No nosso caso, utilizaremos o campo id como filtro. Atualmente temos 
apenas uma entrada, mas ao trabalhar com várias, esse comando retornará apenas o registro específico.
*/

SELECT *
    FROM aluno
WHERE id = 1;

/*
Após filtrar os dados que desejamos alterar, utilizamos o comando UPDATE nome_da_tabela para realizar a atualização. Com o SET, 
especificamos os campos a serem modificados e os novos valores. No exemplo abaixo, alteramos o valor de todos os campos para fixar 
a sintaxe do UPDATE, similar à do INSERT. Copiaremos todos os campos e atribuímos novos valores:
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
SELECT * FROM aluno;

-- Excluindo um registro da tabela

/*
Aplicando o DELETE na tabela aluno
Vamos aplicar esse comando ao nosso banco de dados, onde o registro do "Nico" está presente. Antes de excluir o dado, é fundamental 
utilizar o SELECT para verificar se o filtro está correto. Isso evita a exclusão inadvertida de registros. No exemplo abaixo, filtramos 
os registros com o nome Nico:
*/

SELECT *
    FROM aluno 
    WHERE nome = 'Nico';

/*
Se utilizarmos um nome diferente, não haverá nenhum retorno, pois atualmente só temos o registro de "Nico". Por isso, sempre que for 
excluir um dado, execute o SELECT antes para confirmar os resultados. Após validar o filtro, basta substituir o comando SELECT * por 
DELETE e executar a exclusão:
*/

DELETE FROM aluno 
    WHERE nome = 'Nico';

/*
Agora, ao usar novamente o comando SELECT * FROM aluno para buscar o registro de "Nico", não haverá retorno, pois ele foi removido 
da tabela. Note que, se omitirmos o filtro WHERE e executarmos apenas DELETE FROM nome_da_tabela, todos os registros da tabela serão 
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

/*
Antes de aprendermos sobre os filtros, precisamos aprender outra coisa importante, que é a seleção de campos específicos do banco de dados.

Até o momento, nossas seleções incluíam todos os campos da tabela. Agora vamos descobrir como filtrar um campo e como atribuir um alias para ele.

Começaremos criando um registro no nosso banco de dados, porque na nossa última aula o deixamos vazio. Basta retornar no nosso código de INSERT 
e executá-lo novamente.
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
SELECT * FROM aluno;

/*
Para retornar apenas os dados da coluna "nome", executamos o comando SELECT nome FROM aluno;, e assim veremos só os registros de nome. Se quisermos 
os resultados de mais campos, como "nome", "idade" e "matriculado_em", informamos esses campos, separados por vírgula, após o SELECT.
*/

SELECT nome,
       idade,
       matriculado_em
    FROM aluno;

/*
A partir dessa seleção, podemos usar o comando AS, ou seja, um alias, para trocar o nome de exibição dos campos na tabela. Se escrevermos SELECT 
matriculado_em AS quando_se_matriculou, essa coluna aparecerá com o nome "quando_se_matriculou".

O alias também pode ser usado para atribuir nomes com espaço para os campos, o que pode ser útil, por exemplo, para elaborar um relatório. Nesses 
casos, os novos nomes precisam estar entre aspas duplas " ", ou o programa não irá reconhecê-los e aparecerá uma mensagem de erro de sintaxe.
*/

SELECT nome AS "Nome do Aluno",
       idade,
       matriculado_em AS quando_se_matriculou
    FROM aluno;

-- Filtrando registros de campos do tipo texto

/*
Começaremos a trabalhar com filtros e, para isso, precisamos incluir mais dados na tabela, que até o momento só tem o usuário "Diogo".

Incluiremos apenas nomes, porque os filtros que aprenderemos podem ser usados com todos os campos do tipo texto, ou seja, VARCHAR, CHAR e TEXT.

Usaremos o comando INSERT INTO para incluir os novos nomes.
*/

INSERT INTO aluno (nome) VALUES ('Vinícius Dias');
INSERT INTO aluno (nome) VALUES ('Nico Steppat');
INSERT INTO aluno (nome) VALUES ('João Roberto');
INSERT INTO aluno (nome) VALUES ('Diego');

/*
Após executarmos esse script para incluirmos todos esses nomes no nosso registro, começaremos a conhecer os filtros, que funcionam a partir do 
WHERE nome_do_campo .

O primeiro filtro que aprenderemos é o "igual", representado pelo símbolo = e usado para pesquisar um texto específico.
*/

SELECT *
    FROM aluno
 WHERE nome = 'Diogo';



