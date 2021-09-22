#10 livros mais caros
SELECT L.Cod, L.Titulo, A.CodAutor, A.Nome, L.Valor, E.CodEditora, E.Nome FROM LIVRO L
INNER JOIN AUTOR A ON L.Autor = A.CodAutor
INNER JOIN EDITORA E ON L.Editora = E.CodEditora
GROUP BY L.Cod ORDER BY L.Valor DESC LIMIT 10;


#5 editoras que mais tem livros na biblioteca
SELECT E.CodEditora AS CODIGO_EDITORA, E.Nome AS NOME_EDITORA, COUNT(*) AS NUM_LIVROS FROM EDITORA E 
INNER JOIN LIVRO L ON E.CodEditora = L.Editora
GROUP BY E.CodEditora ORDER BY NUM_LIVROS DESC LIMIT 5;