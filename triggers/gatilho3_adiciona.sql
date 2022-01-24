.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;

CREATE TRIGGER IF NOT EXISTS insertAlunoIdadeInvalida
BEFORE INSERT ON Aluno
FOR EACH ROW
WHEN (strftime('%J', '2021-06-01') - strftime('%J', NEW.dataNascimento)) < 5475 --numero de dias de 15 anos
BEGIN
SELECT RAISE(ABORT , 'Aluno demasiado novo para realizar exames.');
END;

CREATE TRIGGER IF NOT EXISTS updateAlunoIdadeInvalida
BEFORE UPDATE ON Aluno
FOR EACH ROW
WHEN (strftime('%J', '2021-06-01') - strftime('%J', NEW.dataNascimento)) < 5475 --numero de dias de 15 anos
BEGIN
SELECT RAISE(ABORT , 'Aluno demasiado novo para realizar exames.');
END;





