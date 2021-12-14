SELECT CLIENTE.nome, Cliente.IdCliente, 
Venda.IdVenda, Venda.[Data], venda.IdCliente,
Itens.IdItens, Itens.IdProduto, ITENS.IdVenda,
Produto.IdProduto, PRODUTO.Descricao, PRODUTO.Quantidade, PRODUTO.Valor, PRODUTO.Unidade_Medida 
FROM CLIENTE INNER JOIN VENDA ON CLIENTE.IdCliente = VENDA.IdCliente
INNER JOIN ITENS ON Cliente.idCliente = Venda.IdCliente
INNER JOIN PRODUTO ON PRODUTO.IdProduto = itens.IdProduto 
WHERE [VENDA].[Data] BETWEEN '2021-01-01' AND '2021-12-31'