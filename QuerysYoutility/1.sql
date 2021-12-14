--INSERINDO VALORES PARA VALIDAR A PESQUISA
INSERT INTO [CLIENTE]
(IdCliente, Nome, CPF, [Status])
VALUES
( 000101, 'Joao', '12345678912', 'Ativo')

INSERT INTO [VENDA]
(IdCliente, [Data], Tipo)
VALUES
(000101, '2010-01-01', 'Parcelado')

INSERT INTO [VENDA]
(IdCliente, [Data], Tipo)
VALUES
(000101, '2010-08-10', 'A Vista')

INSERT INTO [VENDA]
(IdCliente, [Data], Tipo)
VALUES
(000101, '2021-01-01', 'Parcelado')

INSERT INTO [CLIENTE]
(IdCliente, Nome, CPF, [Status])
VALUES
( 000102, 'Jane', '98765432198', 'Ativo')

INSERT INTO [VENDA]
(IdCliente, [Data], Tipo)
VALUES
(000102, '2021-01-01', 'Parcelado')

INSERT INTO [VENDA]
(IdCliente, [Data], Tipo)
VALUES
(000102, '2010-08-10', 'A Vista')


--CONSULTA 1
SELECT * FROM CLIENTE INNER JOIN VENDA ON [VENDA].IdCliente = [CLIENTE].IdCliente 
WHERE [CLIENTE].IdCliente = 000101 
AND [VENDA].[Data] BETWEEN '2010-01-01' AND '2010-12-31'
ORDER BY [VENDA].[Data];
