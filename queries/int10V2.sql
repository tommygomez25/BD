.mode columns
.width 7, 30, 4, 9
.headers on
.nullvalue NULL

--Alunos do sexo feminino que fizeram um exame para aprovação 
--e que passaram (nota do exame >= 9,5), mas não tiveram uma nota inferior a 17,5

CREATE VIEW PAaprovado AS 
SELECT idAluno, notaExame 
FROM AlunoRealiza 
WHERE paraAprov = 'S' AND notaExame >= 9.5;

CREATE VIEW PAaprovadoAlunoFeminino AS 
SELECT PAaprovado.idAluno, nome, sexo, notaExame 
FROM Aluno JOIN PAaprovado USING(idAluno) 
WHERE sexo = 'F';

SELECT * 
FROM PAaprovadoAlunoFeminino 
EXCEPT 
SELECT * 
FROM PAaprovadoAlunoFeminino 
WHERE notaExame >= 17.5
ORDER BY notaExame,nome;