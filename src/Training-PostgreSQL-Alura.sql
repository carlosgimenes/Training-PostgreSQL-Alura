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

-- Testando funcionamento do PostgreSQL
SELECT NOW();

-- Retornando o Status do Banco
\conninfo

-- Obs.: Executando pelo pgAdmin retornou erro

-- Criando o Banco de Dados "alura"
CREATE DATABASE alura;

-- Excluindo o Banco de Dados "alura"
SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname = 'alura';

DROP DATABASE alura;

\c postgres
DROP DATABASE alura;

