--4.1 Voc� � respons�vel por controlar os dados de clientes e de produtos da sua empresa.
--O que voc� precisar� fazer � confirmar se:

--a) Existem 2517 produtos cadastrados na base e, se n�o tiver, voc� dever� reportar ao seu gestor 
--para saber se existe alguma defasagem no controle dos produtos

--b) At� o m�s passado, a empresa tinha um total de 19500 clientes na base de controle.
--Verifique se esse n�mero aumentou ou reduziu.

select * from ContosoRetailDW.dbo.DimProduct

select * from ContosoRetailDW.dbo.DimCustomer
--a base tem 18869 clientes cadastrados. Ou seja, menos que o m�s anterior