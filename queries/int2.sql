.mode columns
.width 10 13
.headers on
.nullvalue NULL

SELECT positiva.anoLetivo, ROUND((CAST(numPositivas as REAL)/CAST (numTotal as REAL) * 100.0),2) 'positivas(%)'
FROM(( 
	SELECT count(idAluno) numPositivas, anoLetivo FROM AlunoRealiza, Exame 	
	WHERE notaExame >= 9.5 AND AlunoRealiza.idExame = Exame.idExame 
	GROUP BY anoLetivo) 
	as positiva,
    ( 
	SELECT count(*) numTotal, anoLetivo 
	FROM AlunoRealiza, Exame 
	WHERE AlunoRealiza.idExame = Exame.idExame 
	GROUP BY anoLetivo) 
	as total)
WHERE positiva.anoLetivo = total.anoLetivo;