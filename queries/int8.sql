.mode columns
.width 35 15
.headers on
.nullvalue NULL

//Mostrar as escolas que tiveram todas as notas superiores a 17.5

SELECT DISTINCT Escola.idEscola, Escola.nome 
FROM Escola JOIN OndeRealiza USING(idEscola) 
WHERE OndeRealiza.idAluno NOT IN (
	SELECT AlunoRealiza.idAluno 
	FROM OndeRealiza JOIN AlunoRealiza 
	WHERE notaExame <= 17.5
	);

----------------//-----------------

SELECT idEscola, min(notaExame) 
FROM AlunoRealiza JOIN OndeRealiza using(idAluno) 
group by idEscola 
having(min(notaExame) > 17.5);