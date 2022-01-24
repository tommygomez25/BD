.mode columns
.header on
.nullvalue NULL
PRAGMA foreign_keys = ON;

--Após a criação de uma nova disicplina de exame, é preciso criar dois exames no ano letivo mais recente
--sendo um da 1ª fase e outro da 2ª fase

CREATE TRIGGER IF NOT EXISTS InsertExame
AFTER INSERT ON DisciplinaExame
FOR EACH ROW
BEGIN
INSERT INTO Exame VALUES ( (select count(*) from exame) + 1, 1, '2020/2021', '2021-01-01', NEW.codExame);
INSERT INTO Exame VALUES ( (select count(*) from exame) + 22, 2, '2020/2021', '2021-01-01', NEW.codExame);
END;

--Se um aluno que foi a um exame da 1ª fase

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




