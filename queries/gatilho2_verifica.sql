.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;

.print ''
.print 'Inserção de nova disciplina de exame de nome Bases de Dados, código 23 e'
.print ' ano de Escolaridade 12'
.print ''

INSERT INTO DisciplinaExame VALUES(23, 'Bases de Dados', 12);

.print ''
.print 'Verificação da inserção da disciplina'
.print ''

SELECT * FROM DisciplinaExame;

.print ''
.print 'Verificação da criação de dois exames (1 e 2 fase) para essa disciplina'
.print ''

select * from Exame where codExame = 23;

.print ''
.print 'Inserção de um aluno realiza com idAluno 1, idExame 3, nota de exame 8.4 e para '
.print 'aprovação'
.print ''

INSERT INTO AlunoRealiza Values(1, 3, 'Admitido a exame', 'S', 8.4, 'S', 'N', 'S', 'N');

.print ''
.print 'Verificação da criação'
.print ''

SELECT * FROM AlunoRealiza where idAluno = 1 and idExame = 3;

.print ''
.print 'Verificação da inscrição na segunda fase'
.print ''

SELECT * FROM AlunoRealiza where idAluno = 1 and idExame = 25;

.print ''
.print 'Inserção de um aluno realiza com idAluno 1, idExame 4, nota de exame 0.0 e não para '
.print 'aprovação'
.print ''

INSERT INTO AlunoRealiza Values(1, 4, 'Admitido a exame', 'S', 0.0, 'N', 'N', 'S', 'N');

.print ''
.print 'Verificação da criação'
.print ''

SELECT * FROM AlunoRealiza where idAluno = 1 and idExame = 4;

.print ''
.print 'Atualização dos dados para: nota de Exame = 6.0 e para aprovaçao'
.print ''

UPDATE AlunoRealiza SET paraAprov = 'S', notaExame = '6.0' where idAluno = 1 and idExame = 4;

.print ''
.print 'Verificação da atualização e inscrição na 2 fase'
.print ''

SELECT * FROM AlunoRealiza where idAluno = 1 and (idExame = 4 OR idExame = 26);

.print ''
.print 'Inserção de um aluno realiza com idAluno 1, idExame 5, nota de exame 0.0 e não para '
.print 'aprovação'
.print ''

INSERT INTO AlunoRealiza Values(1, 5, 'Admitido a exame', 'S', 0.0, 'N', 'N', 'S', 'N');

.print ''
.print 'Verificação da criação'
.print ''

SELECT * FROM AlunoRealiza where idAluno = 1 and idExame = 5;

.print ''
.print 'Atualização dos dados para: nota de Exame = 12.0 e para aprovaçao'
.print ''

UPDATE AlunoRealiza SET paraAprov = 'S', notaExame = '12.0' where idAluno = 1 and idExame = 4;

.print ''
.print 'Verificação da atualização e da não inscrição na 2 fase'
.print ''

SELECT * FROM AlunoRealiza where idAluno = 1 and (idExame = 5 OR idExame = 27);

