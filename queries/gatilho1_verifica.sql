.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;

.print ''
.print 'Inserção de novo aluno do 12º ano, do curso C60 (Ciências e Tecnologias):'
.print ''

INSERT INTO Aluno VALUES(101,'Joaquim Jorge','M','2002-01-16',12,'C60');

SELECT *
FROM Aluno
WHERE idAluno = 101;

.print ''
.print 'Verificação da adição deste novo aluno em AlunoRealiza (Realiza o exame de Português e Matemática A):'
.print ''

SELECT idAluno, disciplina, sitFrequencia, serInterno, notaExame, paraAprov, paraMelhoria, provaIngresso, CFCEPE
FROM AlunoRealiza JOIN Exame USING (idExame) JOIN DisciplinaExame USING (codExame)
WHERE idAluno = 101;

.print ''
.print ''

.print ''
.print 'Inserção de novo aluno do 12º ano, do curso C61 (Ciências Socioeconómicas):'
.print ''

INSERT INTO Aluno VALUES(102,'Beatriz Silva','F','2002-06-24',12,'C61');

SELECT *
FROM Aluno
WHERE idAluno = 102;

.print ''
.print 'Verificação da adição deste novo aluno em AlunoRealiza (Realiza o exame de Português e Matemática A):'
.print ''

SELECT idAluno, disciplina, sitFrequencia, serInterno, notaExame, paraAprov, paraMelhoria, provaIngresso, CFCEPE
FROM AlunoRealiza JOIN Exame USING (idExame) JOIN DisciplinaExame USING (codExame)
WHERE idAluno = 102;

.print ''
.print ''

.print ''
.print 'Inserção de novo aluno do 12º ano, do curso C62 (Línguas e Humanidades):'
.print ''

INSERT INTO Aluno VALUES(103,'Joana Lima','F','2002-12-25',12,'C62');

SELECT *
FROM Aluno
WHERE idAluno = 103;

.print ''
.print 'Verificação da adição deste novo aluno em AlunoRealiza (Realiza apenas o exame de Português):'
.print ''

SELECT idAluno, disciplina, sitFrequencia, serInterno, notaExame, paraAprov, paraMelhoria, provaIngresso, CFCEPE
FROM AlunoRealiza JOIN Exame USING (idExame) JOIN DisciplinaExame USING (codExame)
WHERE idAluno = 103;

.print ''
.print ''

.print ''
.print 'Inserção de novo aluno do 11º ano, do curso C60 (Ciências e Tecnologias):'
.print ''

INSERT INTO Aluno VALUES(104,'José Alves','M','2003-02-05',11,'C60');

SELECT *
FROM Aluno
WHERE idAluno = 104;

.print ''
.print 'Verificação da adição deste novo aluno em AlunoRealiza (Realiza apenas o exame de Fisica e Quimica A):'
.print ''

SELECT idAluno, disciplina, sitFrequencia, serInterno, notaExame, paraAprov, paraMelhoria, provaIngresso, CFCEPE
FROM AlunoRealiza JOIN Exame USING (idExame) JOIN DisciplinaExame USING (codExame)
WHERE idAluno = 104;

.print ''
.print ''

.print ''
.print 'Inserção de novo aluno do 11º ano, do curso C61 (Ciências Socioeconómicas):'
.print ''

INSERT INTO Aluno VALUES(105,'Rui Portugal','M','2003-11-04',11,'C61');

SELECT *
FROM Aluno
WHERE idAluno = 105;

.print ''
.print 'Verificação da não adição deste novo aluno em AlunoRealiza:'
.print ''

SELECT idAluno, disciplina, sitFrequencia, serInterno, notaExame, paraAprov, paraMelhoria, provaIngresso, CFCEPE
FROM AlunoRealiza JOIN Exame USING (idExame) JOIN DisciplinaExame USING (codExame)
WHERE idAluno = 105;

.print '...'
.print ''

