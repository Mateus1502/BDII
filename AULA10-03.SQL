USE MinhaCaixa;
----TRAZER NOME "ESPAÇO" SOBRENOME
----PARA OS CLIENTES QUE NÃO TEM CARTÃO DE CREDITO TRAZER NUMERO DE TELEFONE
SELECT Clientes.ClienteNome,Clientes.ClienteSobrenome,Contas.ContaNumero,Movimentos.MovimentoValor,TipoMovimentoDescricao,CartaoCredito.CartaoCodigo FROM Clientes 
INNER JOIN Contas 
    ON (Clientes.ClienteCodigo=Contas.ClienteCodigo)
        INNER JOIN Movimentos
        ON (Contas.ContaNumero=Movimentos.ContaNumero)
            INNER JOIN TipoMovimento    
                ON(Movimentos.MovimentoTipo=TipoMovimento.TipoMovimentoCodigo)
                LEFT JOIN CartaoCredito
                ON (CartaoCredito.ClienteCodigo=Clientes.ClienteCodigo)----ESSE LEFT JOIN IRÁ AMPLIAR NOSSOS DADOS, UM INNER NOS LIMITA, O LEFT TRAS TODAS AS INFOS À ESQUERDA
                CASE WHEN CartaoCodigo = NOT NULL
                FROM CartaoCredito;
ORDER BY 1;
