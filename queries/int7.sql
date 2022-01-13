.mode columns
.width 35 10
.headers on
.nullvalue NULL

SELECT nome, notaExame
FROM AlunoRealiza AR1, Aluno
WHERE not exists ( 
	SELECT * FROM AlunoRealiza AR2
	WHERE AR2.notaExame > AR1.notaExame
	)
      AND AR1.idAluno = Aluno.idAluno;
