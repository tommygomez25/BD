.mode columns
.width 25
.headers on
.nullvalue NULL

--Mostrar o nome dos Alunos que fizeram exame de 'Português Língua Segunda' e de 'Alemão'

SELECT Aluno.nome
FROM (SELECT idAluno FROM AlunoRealiza JOIN Exame using(idExame) JOIN DisciplinaExame using(codExame) WHERE disciplina = 'Português Língua Segunda'
INTERSECT
      SELECT idAluno FROM AlunoRealiza JOIN Exame using(idExame) JOIN DisciplinaExame using(codExame) WHERE disciplina = 'Alemão' ) ids, Aluno
WHERE ids.idAluno = Aluno.idAluno;