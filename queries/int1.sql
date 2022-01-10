.mode columns
.width 45 15
.headers on
.nullvalue NULL

SELECT disciplina, round(avg(notaExame),2)'average_exams' 
FROM (	
	SELECT AR.idExame, notaExame, disciplina, Exame.codExame 
	FROM AlunoRealiza as AR, Exame, DisciplinaExame 
	WHERE AR.idExame = Exame.idExame AND Exame.codExame = DisciplinaExame.codExame
     ) 
GROUP BY disciplina 
ORDER BY average_exams;