.mode columns
.width 10 5
.headers on
.nullvalue NULL

create view if not exists mediaPublica as 
SELECT AVG(notaExame) media, Escola.tipo tipo 
FROM AlunoRealiza,OndeRealiza, Escola  
WHERE AlunoRealiza.idAluno = OndeRealiza.idAluno AND Escola.tipo = 'PÚBLICO' AND OndeRealiza.idEscola = Escola.idEscola;

create view if not exists mediaPrivada as
SELECT AVG(notaExame) media , Escola.tipo tipo
FROM AlunoRealiza,OndeRealiza, Escola  
WHERE AlunoRealiza.idAluno = OndeRealiza.idAluno AND Escola.tipo = 'PRIVADO' AND OndeRealiza.idEscola = Escola.idEscola;


SELECT tipo, media
FROM mediaPublica
UNION
SELECT tipo, media
FROM mediaPrivada
UNION 
SELECT 'DIFERENÇA', ABS(mediaPublica.media- mediaPrivada.media)
FROM mediaPublica, mediaPrivada
order by tipo desc;
