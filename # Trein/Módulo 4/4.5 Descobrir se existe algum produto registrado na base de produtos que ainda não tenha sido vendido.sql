--4.5 Descobrir se existe algum produto registrado na base de produtos que ainda não tenha sido vendido.

SELECT 
	*
FROM
	[ContosoRetailDW].dbo.dimProduct
WHERE ProductKey NOT IN 
		(
		SELECT 
			DISTINCT ProductKey
		from
			[ContosoRetailDW].dbo.factSales
		)


--SELECT 
--	*
--FROM
--	[ContosoRetailDW].dbo.factSales

--SELECT 
--	DISTINCT ProductKey
--from
--	[ContosoRetailDW].dbo.factSales
