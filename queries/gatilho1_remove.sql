.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;

DROP TRIGGER IF EXISTS InsertNovoAlunoExamePT;
DROP TRIGGER IF EXISTS InsertNovoAlunoExameMAT;
DROP TRIGGER IF EXISTS InsertNovoAlunoExameFQ;