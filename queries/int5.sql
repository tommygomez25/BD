.mode columns
.width 25 6
.headers on
.nullvalue NULL

--Média das notas por distrito

SELECT Distrito.nome, ROUND(avg(notaExame),2) 'media'
FROM AlunoRealiza JOIN OndeRealiza using(idAluno) JOIN Escola using(idEscola) JOIN Concelho using(idConcelho) JOIN Distrito using(codDistrito)
GROUP BY Distrito.codDistrito;