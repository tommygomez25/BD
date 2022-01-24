.mode columns
.width 35 15 70
.headers on
.nullvalue NULL

--Mostrar o(s) aluno(s) com a nota máxima de cada escola

create view if not exists ARExtensao as Select AlunoRealiza.idAluno,idEscola,notaExame from AlunoRealiza join OndeRealiza using(idAluno);

SELECT Aluno.nome as nomeAluno, notaExame as melhorNota, Escola.nome as nomeEscola
FROM ARExtensao AR1, Aluno, OndeRealiza join Escola using (idEscola)
WHERE not exists ( 
	SELECT * FROM ARExtensao AR2
	WHERE AR2.notaExame > AR1.notaExame
	AND AR2.idEscola = AR1.idEscola
	)
      AND AR1.idAluno = Aluno.idAluno AND OndeRealiza.idAluno = Aluno.idAluno
GROUP BY OndeRealiza.idEscola
ORDER BY notaExame;