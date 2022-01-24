.mode columns
.header on
.nullvalue NULL
.width 45 10 10

PRAGMA foreign_keys = ON;

.print ''
.print 'Criação de uma View em que se apresenta a disciplina, a fase e o ano letivo de cada exame existente na base de dados'
.print ''

select * from ExamesDisciplinas;

.print ''
.print 'Inserção de um exame da 1ª fase do ano letivo 2019/2020 de uma disciplina nova (Bases de Dados) na View'
.print ''

insert into ExamesDisciplinas VALUES('Bases de dados',1,'2019/2020');

.print ''
.print 'Verificação da inserção da nova disciplina na tabela DisciplinaExame'
.print ''

.width 10 25 10

select * from DisciplinaExame where disciplina = 'Bases de dados';

.print ''
.print 'Verificação da inserção do novo exame na tabela Exame'
.print ''

.width 10 10 10 15 10

select * from Exame where codExame = (select codExame from DisciplinaExame where disciplina = 'Bases de dados');

.print ''
.print 'Inserção de um exame da 2ª fase do ano letivo 2019/2020 de uma disciplina já existente (Bases de Dados) na View'
.print ''

insert into ExamesDisciplinas VALUES('Bases de dados',2,'2019/2020');

.print ''
.print 'Verificação da não inserção na tabela DisciplinaExame'
.print ''

.width 10 25 10

select * from DisciplinaExame where disciplina = 'Bases de dados';


.print ''
.print 'Verificação da inserção na tabela Exame'
.print ''

.width 10 10 10 15 10

select * from Exame where codExame = (select codExame from DisciplinaExame where disciplina = 'Bases de dados');


.print ''
.print 'Inserção de um exame já existente (2ª fase de 2019/2020) de uma disciplina também já existente (Bases de Dados) na View'
.print ''

insert into ExamesDisciplinas VALUES('Bases de Dados',2,'2019/2020');

.print ''
.print 'Verificação da não inserção na tabela DisciplinaExame'
.print ''

.width 10 25 10

select * from DisciplinaExame where disciplina = 'Bases de dados';

.print ''
.print 'Verificação da não inserção na tabela Exame'
.print ''

.width 10 10 10 15 10

select * from Exame where codExame = (select codExame from DisciplinaExame where disciplina = 'Bases de dados');