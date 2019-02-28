-- 1. Quais os códigos dos exemplares do livro com o título “Código de Da Vinci” ? 

SELECT IdExemplar
FROM livros, exemplares
WHERE exemplares.IdLivro = livros.IdLivro && livros.Titulo = "Código da Vinci";

-- 2. Quais os títulos dos exemplares, ordenados alfabeticamente, requisitados no mês de
-- Janeiro de 2004?! 

SELECT titulo
FROM requisicoes, exemplares, livros
WHERE requisicoes.IdExemplar = exemplares.IdExemplar && exemplares.IdLivro = livros.IdLivro && requisicoes.DataRequisicao LIKE "2004-01-%"
ORDER BY titulo;

-- 3. Que códigos de exemplares é que não foram requisitados em Janeiro de 2004?

SELECT exemplares.IdExemplar
FROM exemplares, requisicoes
WHERE requisicoes.IdExemplar = exemplares.IdExemplar && NOT requisicoes.DataRequisicao LIKE "2004-01-%"

-- 4. Código, nome dos autores e quantidades de livros que escreveram livros para a
-- Editora “FCA”? 

SELECT autores.IdAutor, autores.Nome, COUNT(*)
FROM autores, livrosautores, livros, editoras
WHERE autores.IdAutor = livrosautores.IdAutor && livrosautores.IdLivro = livros.IdLivro && livros.IdEditora = editoras.IdEditora && editoras.Nome = "FCA"
GROUP BY livros.IdLivro 

-- 5. Quais os valores das multas pagas no mês de Outubro de 2004 em livros contendo a
-- palavra-chave “Informática” ?!

SELECT ValorMulta
FROM requisicoes, exemplares, livros, livrospalavras, palavraschave
WHERE requisicoes.IdExemplar = exemplares.IdExemplar && exemplares.IdLivro = livros.IdLivro 
      && livros.IdLivro = livrospalavras.IdLivro && livrospalavras.IdPalavra = palavraschave.IdPalavra
      && palavraschave.IdPalavra = "Informática" && requisicoes.DataRealEntrega LIKE "2004-10-%"

-- 6. Que Leitores requistaram todos os livros da Editora “Centro Atlântico”? 

-- 7. Quais os livros para os quais a biblioteca adquiriu pelo menos um exemplar no
--    mesmo ano da sua edição. 

SELECT DISTINCT livros.Titulo
FROM livros, exemplares
WHERE exemplares.IdLivro = livros.IdLivro && livros.Ano = YEAR(exemplares.DataAquisicao)

-- 8. Quais os códigos e nomes de Leitores que nunca tiveram uma multa por entrega de livro fora de prazo?! 

SELECT leitor.IdLeitor, leitor.Nome, ValorMulta, COUNT(*)
FROM requisicoes, leitor
WHERE requisicoes.IdLeitor = leitor.IdLeitor && NOT leitor.IdLeitor IN (
	  SELECT DISTINCT leitor.IdLeitor
      FROM leitor, requisicoes
      WHERE leitor.IdLeitor = requisicoes.IdLeitor && requisicoes.valorMulta > 0
      )
GROUP BY leitor.idLeitor

-- 9. Quantas requisições foram efetuadas em Fevereiro de 2004?! 

SELECT COUNT(*)
FROM requisicoes
WHERE requisicoes.DataRequisicao LIKE "2004-02-%"

-- 10.Qual o somatório total das multas pagas em 2003?!

SELECT SUM(requisicoes.ValorMulta)
FROM requisicoes
WHERE YEAR(requisicoes.DataRealEntrega) = 2003

-- 11. Qual o valor máximo de uma multa paga em cada ano?! 

SELECT MAX(requisicoes.ValorMulta), YEAR(requisicoes.DataRealEntrega)
FROM requisicoes
GROUP BY YEAR(requisicoes.DataRealEntrega)