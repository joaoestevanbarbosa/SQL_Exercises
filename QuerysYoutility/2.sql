--INSERINDO VALORES PARA VALIDAR A PESQUISA
INSERT INTO [CLIENTE]
(IdCliente, Nome, CPF, [Status])
VALUES
( 000101, 'Joao', '12345678912', 'Ativo') --ver se não está criado já que é o mesmo cliente da questao 1

INSERT INTO [CLIENTE]
(IdCliente, Nome, CPF, [Status])
VALUES
( 000103, 'Maria', '11122233344', 'Ativo')

INSERT INTO [VENDA]
(IdCliente, [Data], Tipo)
VALUES
(000103, '2011-07-01', 'Credito') --Maria compra no Crédito em 2011

INSERT INTO [VENDA]
(IdCliente, [Data], Tipo)
VALUES
(000101, '2011-09-13', 'Credito') --Joao compra no Crédito em 2011

INSERT INTO [VENDA]
(IdCliente, [Data], Tipo)
VALUES
(000103, '2011-07-01', 'Debito') --Maria compra no Débito em 2011

INSERT INTO [VENDA]
(IdCliente, [Data], Tipo)
VALUES
(000101, '2011-09-13', 'Debito') --Joao compra no Débito em 2011

--CONSULTA 2
SELECT * FROM CLIENTE INNER JOIN VENDA ON [VENDA].IdCliente = [CLIENTE].IdCliente 
WHERE [VENDA].Tipo = 'Credito' 
AND [VENDA].[Data] BETWEEN '2011-01-01' AND '2011-12-31'
AND ([CLIENTE].Nome = 'Joao' OR [CLIENTE].Nome = 'Maria')


