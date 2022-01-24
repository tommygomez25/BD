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
INSERT INTO Exame VALUES ((SELECT max(idExame) FROM Exame) + 1, 1, '2020/2021', '2021-01-01', NEW.codExame);
INSERT INTO Exame VALUES ((SELECT max(idExame) FROM Exame) + 1, 2, '2020/2021', '2021-01-01', NEW.codExame);
END;

--Quando se insere um aluno que foi a um exame da 1ª fase, para aprovação, e tirou negativa, este terá que fazer obrigatoriamente
--o exame equivalente, mas da 2ª fase

CREATE TRIGGER IF NOT EXISTS InsertAlunoReprovado
AFTER INSERT ON AlunoRealiza
FOR EACH ROW
WHEN( (SELECT fase FROM Exame where idExame = NEW.idExame) = 1 AND NEW.paraAprov = 'S' AND NEW.notaExame < 9.5)
BEGIN
INSERT INTO AlunoRealiza VALUES(NEW.idAluno,(SELECT idExame FROM Exame E1 WHERE E1.fase = 2 AND ((E1.anoLetivo, E1.codExame) IN (SELECT anoLetivo, codExame FROM Exame E2 WHERE NEW.idExame = E2.idExame))) , NEW.sitFrequencia, NEW.serInterno, 0.0, NEW.paraAprov, NEW.paraMelhoria, NEW.ProvaIngresso, NEW.CFCEPE); 
END;

--Quando se faz o update dos dados de um aluno para que ele tenha feito um exame da 1ª fase, para aprovação, 
--e que tirou negativa, este terá que fazer obrigatoriamente o exame equivalente, mas da 2ª fase

CREATE TRIGGER IF NOT EXISTS UpdateAlunoReprovado
AFTER UPDATE ON AlunoRealiza
FOR EACH ROW
WHEN( (SELECT fase FROM Exame where idExame = NEW.idExame) = 1 AND NEW.paraAprov = 'S' AND NEW.notaExame < 9.5 )
BEGIN
INSERT INTO AlunoRealiza VALUES(NEW.idAluno, (SELECT idExame FROM Exame E1 WHERE E1.fase = 2 AND ((E1.anoLetivo, E1.codExame) IN (SELECT anoLetivo, codExame FROM Exame E2 WHERE NEW.idExame = E2.idExame))), NEW.sitFrequencia, NEW.serInterno, 0.0, NEW.paraAprov, NEW.paraMelhoria, NEW.ProvaIngresso, NEW.CFCEPE); 
END;