# a) Listar todos os livros publicados ap�s 2014
SELECT * FROM LIVRO WHERE YEAR(Publicacao) > 2014;



# b) Listar os 10 livros mais caros
SELECT Valor FROM LIVRO ORDER BY Valor DESC LIMIT 10;



# c) Listar as 5 editoras que mais tem livros na biblioteca
SELECT 
	CodEditora, Nome,
		(SELECT 
			COUNT(L.Editora) FROM LIVRO L 
				WHERE L.Editora = E.CodEditora) AS CONTADOR
FROM EDITORA E 
	GROUP BY CodEditora ORDER BY CONTADOR DESC LIMIT 5;
	


# d)Listar a quantidade de publica��es de cada autor
SELECT 
	CodAutor, Nome,
		(SELECT COUNT(*) FROM LIVRO L 
			WHERE L.Autor = A.CodAutor) AS CONTADOR
FROM AUTOR A 
	ORDER BY CodAutor;


# e)Listar a quantidade de publica��es de cada editora
SELECT 
	CodEditora, Nome,
		(SELECT COUNT(*) FROM LIVRO L 
			WHERE L.Editora = E.CodEditora) AS CONTADOR
FROM EDITORA E 
	ORDER BY CodEditora;
	

#f) Listar qual � o autor com mais publica��es
SELECT 
	CodAutor, Nome,
		(SELECT COUNT(*) FROM LIVRO L 
			WHERE L.Autor = A.CodAutor) AS PUBLICACOES
FROM AUTOR A 
	ORDER BY PUBLICACOES DESC LIMIT 1;


#g) Listar qual � o autor com menos ou nenhuma publica��o
SELECT A.CodAutor, A.Nome, 0 publicacoes FROM AUTOR A 
WHERE A.CodAutor NOT IN(SELECT L.Autor FROM LIVRO L)
