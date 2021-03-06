.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;

.print ''
.print 'Inserção de um aluno realiza com idAluno 1, idExame 3, nota de exame 8.4 e para aprovação'
.print ''

INSERT INTO AlunoRealiza Values(1, 3, 'Admitido a exame', 'S', 8.4, 'S', 'N', 'S', 'N');

.print ''
.print 'Verificação da criação'
.print ''

.width 7 7 25 10 10 10 15 20 10

SELECT * FROM AlunoRealiza where idAluno = 1 and idExame = 3;

.print ''
.print 'Verificação da inscrição na segunda fase'
.print ''

SELECT * FROM AlunoRealiza where idAluno = 1 and (idExame = 3 OR idExame = 25);

.print ''
.print 'Inserção de um aluno realiza com idAluno 1, idExame 4, nota de exame nula e não para aprovação'
.print ''

INSERT INTO AlunoRealiza Values(1, 4, 'Admitido a exame', 'S', NULL, 'N', 'N', 'S', 'N');

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
.print 'Inserção de um aluno realiza com idAluno 1, idExame 5, nota de exame nula e não para aprovação'
.print ''

INSERT INTO AlunoRealiza Values(1, 5, 'Admitido a exame', 'S', NULL, 'N', 'N', 'S', 'N');

.print ''
.print 'Verificação da criação'
.print ''

SELECT * FROM AlunoRealiza where idAluno = 1 and idExame = 5;

.print ''
.print 'Atualização dos dados para: nota de Exame = 12.0 e para aprovação'
.print ''

UPDATE AlunoRealiza SET paraAprov = 'S', notaExame = '12.0' where idAluno = 1 and idExame = 5;

.print ''
.print 'Verificação da atualização e da não inscrição na 2 fase'
.print ''

SELECT * FROM AlunoRealiza where idAluno = 1 and (idExame = 5 OR idExame = 27);
