.mode columns
.width auto
.headers on
.nullvalue NULL

//Valor absoluto da diferença entre as médias das Escolas Publicas e das Escolas Privadas

SELECT ABS(mediaPublica.media - mediaPrivada.media) Difereça 
FROM( 
	SELECT AVG(notaExame) media FROM AlunoRealiza,OndeRealiza, Escola  WHERE AlunoRealiza.idAluno = OndeRealiza.idAluno AND Escola.tipo = 'PÚBLICO' AND OndeRealiza.idEscola = Escola.idEscola) AS mediaPublica, 
( 
	SELECT AVG(notaExame) media FROM AlunoRealiza,OndeRealiza, Escola  WHERE AlunoRealiza.idAluno = OndeRealiza.idAluno AND Escola.tipo = 'PRIVADO' AND OndeRealiza.idEscola = Escola.idEscola ) AS mediaPrivada;