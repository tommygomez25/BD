.mode columns
.width 8, 25, 8, 50, 8
.headers on
.nullvalue NULL

--Ver quais são os alunos que realizaram um exame numa escola do concelho de Aveiro

SELECT Aluno.idAluno AS 'idAluno', Aluno.nome AS 'nomeAluno', OndeRealiza.idEscola AS 'idEscola', Esc.nome AS 'nomeEscola',tipo 
FROM (
	(SELECT idEscola, Escola.nome, tipo 
	FROM Escola, Concelho 
	WHERE (Escola.idConcelho = Concelho.idConcelho AND Concelho.nome = 'Aveiro')) AS Esc, Aluno, OndeRealiza
     ) 
WHERE (Esc.idEscola = OndeRealiza.idEscola AND Aluno.idAluno = OndeRealiza.idAluno);