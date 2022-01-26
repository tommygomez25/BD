.mode columns
.width 45 15
.headers on
.nullvalue NULL

--Média das notas dos exames, por disciplina

SELECT disciplina, round(avg(notaExame),2)'médiaExames' 
FROM (	
	SELECT AR.idExame, notaExame, disciplina, Exame.codExame 
	FROM AlunoRealiza as AR, Exame, DisciplinaExame 
	WHERE AR.idExame = Exame.idExame AND Exame.codExame = DisciplinaExame.codExame
     ) 
GROUP BY disciplina 
ORDER BY médiaExames;
