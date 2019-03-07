/* Considere o esquema abaixo para construir as expressões seguintes, usando a linguagem SQL:

Agencias (CodigoAg, NomeAg, CidadeAg)
Clientes (CodigoCli, Nome, rua, cidade)
Depositos (CodigoAg, NumeroCont, CodigoCli, saldo)
	CodigoAg referencia Agencias
	CodigoCli referencia Clientes
Emprestimos (CodigoAg, CodigoCli, NumeroEmp, quantia)
	CodigoAg referencia Agencias
	CodigoCli referencia Clientes*/

-- 1. Selecionar todos os clientes que possuam conta no banco, sobrenome “Souza” e que residam em Januária,
--    exibindo seus dados pessoais e seu saldo.

-- SELECT Clientes.CodigoCli, Clientes.Nome, Clientes.rua, Clientes.cidade, Depositos.saldo
-- FROM Clientes, Depositos
-- WHERE Clientes.Nome LIKE "%Souza%" && Clientes.Cidade LIKE "%Januária%" && Clientes.CodigoCli = Depositos.CodigoCli

-- 2. Selecione o nome e o valor emprestado dos três clientes com menores
--    empréstimos no banco.

-- SELECT Clientes.Nome, Emprestimos.quantia
-- FROM clientes, emprestimos
-- WHERE Clientes.CodigoCli = Emprestimos.CodigoCli 
-- ORDER BY quantia LIMIT 3

-- 3. Selecione todos os dépositos realizados em agências de Uberlândia ou Uberaba.
-- SELECT *
-- FROM depositos, agencias
-- WHERE Depositos.CodigoAg = Agencias.CodigoAg && CidadeAg LIKE "%Uberlândia%" || CidadeAg LIKE "%Uberaba%"

-- 4. Selecione todos os clientes que se chamem Paulo ou Paula, sem utilizar AND/OR em sua consulta.
-- SELECT Clientes.Nome
-- FROM Clientes
-- WHERE Clientes.Nome LIKE "%Paul_ %" 

-- 5. Selecione todas as cidades que possuam agências com média de saldo maior que 2000,
--    exibindo também esta média no resultado.

-- SELECT CidadeAg, AVG(saldo)
-- FROM agencias, depositos
-- WHERE Agencias.CodigoAg = Depositos.CodigoAg
-- GROUP BY Agencias.CodigoAg 
-- HAVING AVG(saldo) > 2000

-- 6. Selecionar todos os clientes que possuam conta e empréstimo no banco.
-- SELECT DISTINCT Clientes.CodigoCli
-- FROM clientes, emprestimos, depositos
-- WHERE Clientes.CodigoCli = Emprestimos.CodigoCli && Depositos.CodigoCli = Clientes.CodigoCli

-- 7. Selecione o nome e o saldo dos clientes que possuem empréstimo menor que 1000,
--    ordenado pelos clientes que possuírem o maior saldo.
-- SELECT Clientes.Nome, Depositos.saldo
-- FROM clientes, depositos, emprestimos
-- WHERE Clientes.CodigoCli = Depositos.CodigoCli && Clientes.CodigoCli = Emprestimos.CodigoCli && Emprestimos.quantia < 1000
-- ORDER BY saldo DESC
