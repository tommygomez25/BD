.mode columns
.header on
.nullvalue NULL
PRAGMA foreign_keys = ON;

CREATE TRIGGER IF NOT EXISTS InsertExame
AFTER INSERT ON DisciplinaExame
FOR EACH ROW
BEGIN
INSERT INTO Exame VALUES ( (select count(*) from exame) + 1, 1, '2020/2021', '01-01-2021', NEW.codExame);
INSERT INTO Exame VALUES ( (select count(*) from exame) + 22, 2, '2020/2021', '01-01-2021', NEW.codExame);
END;


CREATE TRIGGER IF NOT EXISTS InsertAlunoReprovado
AFTER INSERT ON AlunoRealiza
FOR EACH ROW
WHEN( (SELECT fase FROM Exame where idExame = NEW.idExame) = 1 AND NEW.paraAprov = 'S' AND NEW.notaExame < 9.5)
BEGIN
INSERT INTO AlunoRealiza VALUES(NEW.idAluno, NEW.idExame + 22, NEW.sitFrequencia, NEW.serInterno, 0.0, NEW.paraAprov, NEW.paraMelhoria, NEW.ProvaIngresso, NEW.CFCEPE); 
--ids de exames de 1 e 2 fase da mesma disciplina e do mesmo ano letivo diferem em 22
END;


CREATE TRIGGER IF NOT EXISTS UpdateAlunoReprovado
AFTER UPDATE ON AlunoRealiza
FOR EACH ROW
WHEN( (SELECT fase FROM Exame where idExame = NEW.idExame) = 1 AND NEW.paraAprov = 'S' AND NEW.notaExame < 9.5 )
BEGIN
INSERT INTO AlunoRealiza VALUES(NEW.idAluno, NEW.idExame + 22, NEW.sitFrequencia, NEW.serInterno, 0.0, NEW.paraAprov, NEW.paraMelhoria, NEW.ProvaIngresso, NEW.CFCEPE); 
--ids de exames de 1 e 2 fase da mesma disciplina e do mesmo ano letivo diferem em 50
END;




