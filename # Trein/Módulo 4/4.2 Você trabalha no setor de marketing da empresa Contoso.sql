/*4.2 VOcê trabalha no setor de marketing da empresa Contoso e acaba de ter uma ideia de oferecer descontos especiais para os clientes
no dia dos seus aniversarios. Para isso, você vai precisar listar todos os clientes e as suas respectativas datas de nascimento,
além de um contato.

a) Selecione as colunas: CUstomerKey, FirstName, EmailAdress, BirthDate da tabela DimCustomer
b) Renomeie as colunas dessa tabela usando o alias (comando AS)*/

SELECT
	CustomerKey 'ID do Cliente',
	FirstName 'Nome',
	EmailAddress 'E-mail',
	BirthDate 'Data de Nascimento'
FROM
	ContosoRetailDW.dbo.DimCustomer

