.mode columns
.width 47 9
.headers on
.nullvalue NULL

--Cursos e número de alunos desses cursos que foram à 2ª fase, sendo esse número superior a 1

SELECT curso.nome ,count(*) numAlunos 
FROM Aluno JOIN Curso using(codCurso) 
WHERE idAluno in ( 
        SELECT idAluno 
        FROM Aluno JOIN AlunoRealiza using(idAluno) JOIN Exame using(idExame) 
        WHERE fase = '2')
GROUP BY codCurso 
HAVING numAlunos > 1 
ORDER BY numAlunos;