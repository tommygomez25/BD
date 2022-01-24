.mode columns
.header on
.nullvalue NULL
.width 7 30 4 13 15 8

.print ''
.print 'Verificação do estado atual da tabela Aluno'
.print ''

SELECT * FROM Aluno;

.print ''
.print 'Inserção de um Aluno com data de nascimento 2008-12-28'
.print ''

insert into aluno values(106, 'Pedro Pinto', 'M', '2008-12-28', NULL, 'C60');

.print ''
.print 'Inserção de um Aluno com data de nascimento 2000-12-28'
.print ''

insert into aluno values(106, 'Pedro Pinto', 'M', '2000-12-28', NULL, 'C60');

.print ''
.print 'Verificação da inserção do aluno'
.print ''

select * from aluno where idAluno = 106;

.print ''
.print 'Atualização da data de nascimento do aluno inserido para 2008-12-28'
.print ''

update aluno set dataNascimento = '2008-12-28' where idAluno = 106;

.print ''
.print 'Atualização da data de nascimento do aluno inserido para 2002-05-23'
.print ''

update aluno set dataNascimento = '2002-05-23' where idAluno = 106;

.print ''
.print 'Verificação da atualização da data de nascimento'
.print ''

select * from aluno where idAluno = 106;
