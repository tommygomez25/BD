.mode columns
.width 8, 35, 8, 65
.headers on
.nullvalue NULL

--Mostrar os alunos e o curso em que andam

SELECT idAluno, Aluno.nome, Aluno.codCurso, Curso.nome 
FROM Aluno JOIN Curso 
USING (codCurso);
