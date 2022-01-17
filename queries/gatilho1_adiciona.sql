.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;

--Quando se cria um novo aluno do 12º ano, este terá que fazer obrigatoriamente o exame
--de Português do ano letivo mais recente, da 1ª fase

CREATE TRIGGER IF NOT EXISTS InsertNovoAlunoExamePT 
AFTER INSERT ON Aluno
FOR EACH ROW 
WHEN NEW.anoEscolaridade = 12
BEGIN 
    INSERT INTO AlunoRealiza VALUES(NEW.idAluno,52,NULL,'S',NULL,'N','N','N','N');
END;

--Quando se cria um novo aluno do 12º ano do curso de Ciências e Tecnologias/Ciências Socioeconómicas 
--este terá que fazer obrigatoriamente o exame de Matemática A do ano letivo mais recente, da 1ª fase

CREATE TRIGGER IF NOT EXISTS InsertNovoAlunoExameMAT
AFTER INSERT ON Aluno
FOR EACH ROW 
WHEN NEW.anoEscolaridade = 12 AND (NEW.codCurso = 'C60'OR NEW.codCurso = 'C61')
BEGIN 
    INSERT INTO AlunoRealiza VALUES(NEW.idAluno,51,NULL,'S',NULL,'N','N','N','N');
END;


--Quando se cria um novo aluno do 11º ano do curso de Ciências e Tecnologias, este terá que fazer obrigatoriamente o exame
--de Física e Química A do ano letivo mais recente, da 1ª fase

CREATE TRIGGER IF NOT EXISTS InsertNovoAlunoExameFQ
AFTER INSERT ON Aluno
FOR EACH ROW 
WHEN NEW.anoEscolaridade = 11 AND NEW.codCurso = 'C60'
BEGIN 
    INSERT INTO AlunoRealiza VALUES(NEW.idAluno,58,NULL,'S',NULL,'N','N','N','N');
END;
