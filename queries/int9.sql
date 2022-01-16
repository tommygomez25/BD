SELECT Aluno.nome
FROM (SELECT idAluno FROM AlunoRealiza JOIN Exame using(idExame) JOIN DisciplinaExame using(codExame) WHERE disciplina = 'Português Língua Segunda'
INTERSECT
      SELECT idAluno FROM AlunoRealiza JOIN Exame using(idExame) JOIN DisciplinaExame using(codExame) WHERE disciplina = 'Alemão' ) ids, Aluno
WHERE ids.idAluno = Aluno.idAluno;