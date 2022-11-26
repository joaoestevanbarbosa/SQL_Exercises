/*4.4. A empresa CONTOSO precisa fazer contato com os fonecedores de produtos para repor o estoque.
Utilize um comando SQL para retornar apenas os nomes dos fonrcedores da tabela dimProduct e renomeie essa nova coluna da tabela*/

SELECT
	DISTINCT Manufacturer AS 'PRODUTOR'
FROM 
	[ContosoRetailDW].dbo.dimProduct