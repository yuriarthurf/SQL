# a) Listar todos os livros publicados após 2014
SELECT * FROM LIVRO WHERE YEAR(Publicacao) > 2014;



# b) Listar os 10 livros mais caros
SELECT * FROM LIVRO ORDER BY Valor DESC LIMIT 10;



# c) Listar as 5 editoras que mais tem livros na biblioteca
SELECT Editora, Nome, COUNT(*) AS CONTADOR FROM EDITORA E 
INNER JOIN 
LIVRO L 
ON 
E.CodEditora = L.Editora
GROUP BY Editora ORDER BY CONTADOR DESC LIMIT 5;



# d) Listar a quantidade de publicações de cada autor
SELECT Autor, Nome, COUNT(*) AS CONTADOR FROM AUTOR A 
INNER JOIN 
LIVRO L 
ON 
A.CodAutor = L.Autor
GROUP BY CodAutor;



# e) Listar a quantidade de publicações de cada editora
SELECT Editora, Nome, COUNT(*) AS CONTADOR FROM EDITORA E 
INNER JOIN 
LIVRO L 
ON 
E.CodEditora = L.Editora
GROUP BY EDITORA;



#f) Listar qual é o autor com mais publicações
SELECT Autor, Nome, COUNT(*) AS CONTADOR FROM AUTOR A 
INNER JOIN 
LIVRO L 
ON 
A.CodAutor = L.Autor
GROUP BY CodAutor ORDER BY CONTADOR DESC LIMIT 1;



#g) Listar qual é o autor com menos ou nenhuma publicação
SELECT Autor, Nome, COUNT(*) AS CONTADOR FROM AUTOR A 
INNER JOIN 
LIVRO L 
ON 
A.CodAutor = L.Autor
GROUP BY A.CodAutor, A.NOME
HAVING COUNT(A.CodAutor ) = (
					SELECT MIN(M.publicacoes) 
					FROM (SELECT L.Autor, COUNT(L.Autor) as publicacoes 
					FROM LIVRO L 
					GROUP BY L.Autor) M
				 )
UNION ALL 

SELECT A.CodAutor, A.Nome, 0 publicacoes FROM AUTOR A 
WHERE A.CodAutor NOT IN (SELECT L.Autor FROM LIVRO L);


