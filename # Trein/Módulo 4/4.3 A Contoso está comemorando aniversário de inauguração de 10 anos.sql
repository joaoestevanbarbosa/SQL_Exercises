--4.3 A Contoso est� comemorando anivers�rio de inaugura��o de 10 anos e pretende fazer uma a��o de premia��o para os clientes.
--A empresa quer presentear os primeiros clientes desde a inaugura��o.

--a) Contoso decidiu presentear os primeiros 100 clientes da hist�ria com um vale compras.
--Utilize um comando em SQL para retornar todas as colunas em tabela com estes clientes na tabela dimCustomer

--b) Puxar os primeiros 10% dos clientes para ganhar um vale compras. 
--Utilize um comando em SQL para retornar todas as colunas em tabela com estes clientes na tabela dimCustomer

--c) Adaptar a letra A para retornar apenas as primeiras 100 linhas, mas para as colunas FirstName, EmailAddress, BirthDate.

--d) Renomear as colunas da letra C.

--select 
--	top 100 * 
--from 
--	ContosoRetailDW.dbo.DimCustomer

--select 
--	top 10 PERCENT *
--from 
--	ContosoRetailDW.dbo.DimCustomer


select 
	top 100 FirstName 'Nome', 
	EmailAddress 'E-mail', 
	BirthDate 'Data de Nascimento'
from 
	ContosoRetailDW.dbo.DimCustomer