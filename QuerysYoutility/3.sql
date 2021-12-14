--INSERINDO VALORES PARA VALIDAR A PESQUISA
INSERT INTO [VENDA]
(IdCliente, [Data], Tipo)
VALUES
(000101, '2011-07-01', 'A vista') --Joao compra A vista

INSERT INTO [VENDA]
(IdCliente, [Data], Tipo)
VALUES
(000102, '2012-07-01', 'A vista') --Jane compra A vista

INSERT INTO [VENDA]
(IdCliente, [Data], Tipo)
VALUES
(000103, '2011-07-01', 'A vista') --Maria compra A vista

INSERT INTO [CLIENTE]
(IdCliente, Nome, CPF, [Status])
VALUES
(000104, 'Frizas', '12345678912', 'Liberado') --Frizas com status liberado

INSERT INTO [VENDA]
(IdCliente, [Data], Tipo)
VALUES
(000104, '2017-07-04', 'A vista') --Frizas compra A vista

--CONSULTA 3
SELECT COUNT(IdVenda) AS QUANTIDADE FROM VENDA 
		INNER JOIN CLIENTE ON [VENDA].IdCliente = [CLIENTE].IdCliente 
		WHERE CLIENTE.[Status] = 'Liberado'
		AND VENDA.Tipo = 'A vista'
		


