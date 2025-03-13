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

---Dia 13/03

CREATE TABLE departamentos(
    id_departamentos INT,
    nome_departamento char(50),
);
INSERT departamentos VALUES(1,'RH'),(2,'TI'),(3,'FINANCEIRO'),(4,'DIRETORIA');

CREATE TABLE funcionarios(
    id_funcionarios INT,
    nome_funcionario char(50),
    id_gerente INT,
    id_departamento INT
)
INSERT funcionarios VALUES (1,'José',null,4),(2,'Pedro',1,3),(3,'Maria',1,1);

SELECT funcionarios.nome_funcionario, departamentos.nome_departamento
FROM funcionarios
    FULL JOIN departamentos ON (funcionarios.id_departamento=departamentos.id_departamentos)

SELECT funcionarios.nome_funcionario, departamentos.nome_departamento
FROM funcionarios
    CROSS JOIN departamentos

    SELECT funcionarios.id_funcionarios,funcionarios.nome_funcionario, funcionarios.id_gerente,Chefe.nome_funcionario AS NomeChefe 
    FROM funcionarios
    LEFT JOIN funcionarios AS Chefe
    ON (funcionarios.id_gerente= Chefe.id_funcionarios)

    SELECT funcionarios.id_funcionarios,funcionarios.nome_funcionario, funcionarios.id_gerente,Chefe.nome_funcionario
    CASE 
    WHEN Chefe.nome_fun
    
    ---NAO USE FULL JOIN

---SELECT * FROM funcionarios


---INSERT funcionarios VALUES(4,'Mateus',1,null);
