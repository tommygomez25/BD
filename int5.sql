.mode columns
.width 25 6
.headers on
.nullvalue NULL


SELECT Distrito.nome, ROUND(avg(notaExame),2) 'media'
FROM AlunoRealiza, OndeRealiza, Escola, Concelho, Distrito
WHERE AlunoRealiza.idAluno = OndeRealiza.idAluno AND OndeRealiza.idEscola = Escola.idEscola AND Escola.idConcelho = Concelho.idConcelho AND Concelho.codDistrito = Distrito.codDistrito
GROUP BY Distrito.codDistrito;