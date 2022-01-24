.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;

--Quando se cria uma View que mostra a disciplina, fase e ano letivo de todos os exames

CREATE VIEW ExamesDisciplinas AS
SELECT DisciplinaExame.disciplina Exame, Exame.fase Fase, Exame.anoLetivo AnoLetivo
FROM DisciplinaExame JOIN Exame USING (codExame)
ORDER BY Exame;

--e depois se deseja inserir um novo tuplo nesta, a inserção não é feita, neste caso, na ExamesDisciplinas
--mas sim nas tabelas originais: DisciplinaExame e Exame


--Quando a disciplina não existe, é criada uma nova Disciplina de Exame (do 11º ano) e um novo Exame (dessa disciplina)

CREATE TRIGGER IF NOT EXISTS InsertOnView1
INSTEAD OF INSERT ON ExamesDisciplinas
FOR EACH ROW
WHEN NEW.Exame NOT IN (SELECT disciplina FROM DisciplinaExame)
BEGIN
INSERT INTO DisciplinaExame VALUES ((SELECT max(codExame) FROM DisciplinaExame) +1, 
				     NEW.Exame, 11);

INSERT INTO Exame VALUES((SELECT max(idExame) FROM Exame) + 1, 
			  NEW.Fase, NEW.AnoLetivo, 
    			  SUBSTR(NEW.AnoLetivo,6,4) || '-01-01', 
			  (SELECT codExame FROM DisciplinaExame WHERE disciplina = NEW.Exame));
END;

--Quando a disciplina já existe, é só adicionado um novo Exame quando não existe um exame da disciplina em questão
--com a mesma fase e ano letivo que se quer inserir

CREATE TRIGGER IF NOT EXISTS InsertOnView2
INSTEAD OF INSERT ON ExamesDisciplinas
FOR EACH ROW
WHEN (NEW.Exame IN (SELECT disciplina FROM DisciplinaExame)) 
AND NOT EXISTS (SELECT * 
		FROM Exame JOIN DisciplinaExame USING (codExame) 
		WHERE NEW.Fase = Exame.fase AND New.AnoLetivo = Exame.anoLetivo AND NEW.Exame = DisciplinaExame.disciplina)
BEGIN
INSERT OR IGNORE INTO DisciplinaExame VALUES((SELECT max(codExame) from DisciplinaExame) +1, 
					      NEW.Exame, 11);

INSERT OR IGNORE INTO Exame VALUES((SELECT max(idExame) from Exame) + 1, 
				    NEW.Fase, NEW.AnoLetivo, 
				    SUBSTR(NEW.AnoLetivo,6,4) || '-01-01', 
				    (SELECT codExame FROM DisciplinaExame WHERE disciplina = NEW.Exame));
END;

--É de notar que a data de realização dos novos Exames criados será sempre "(Ano Final do Ano Letivo)-01-01"