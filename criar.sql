PRAGMA foreign_keys=ON;
BEGIN TRANSACTION;
.mode columns
.headers on

-----------------------

DROP TABLE IF EXISTS Distrito;
DROP TABLE IF EXISTS Concelho;
DROP TABLE IF EXISTS Escola;
DROP TABLE IF EXISTS Aluno;
DROP TABLE IF EXISTS OndeRealiza;
DROP TABLE IF EXISTS DisciplinaExame;
DROP TABLE IF EXISTS Exame;
DROP TABLE IF EXISTS AlunoRealiza;
DROP TABLE IF EXISTS SitFreq;
DROP TABLE IF EXISTS Curso;
DROP TABLE IF EXISTS SubTipoCurso;
DROP TABLE IF EXISTS TipoCurso;


------------------------


CREATE TABLE Distrito(
	codDistrito int PRIMARY KEY,
	nome varchar(20) NOT NULL,

	CONSTRAINT check_codDistrito CHECK ((codDistrito > 0) AND (codDistrito <= 20 OR codDistrito = 99)),
	CONSTRAINT nome_distrito_unique UNIQUE (nome),
	CONSTRAINT check_nomeEstrangeiro CHECK(CASE WHEN codDistrito = '99' THEN nome = 'Estrangeiro' END)
);

CREATE TABLE Concelho(
	idConcelho int PRIMARY KEY,
	codConcelho int NOT NULL,
	nome varchar(30) NOT NULL,
	codNUTS3 char(3),
	codDistrito int NOT NULL,
   
	CONSTRAINT nome_concelho_unique UNIQUE (nome),
      	CONSTRAINT check_codConcelho CHECK (CASE WHEN codDistrito = 99 THEN codConcelho = 99 WHEN codDistrito <> 99 THEN codConcelho <> 99 END),
	CONSTRAINT foreignkey_codDistrito  FOREIGN KEY (codDistrito) REFERENCES Distrito(codDistrito) ON DELETE RESTRICT
									  	 		      ON UPDATE CASCADE
);

CREATE TABLE Escola(
	idEscola int PRIMARY KEY,
	nome varchar(100) NOT NULL,
	codDGAE int NOT NULL,               
	codDGEEC int NOT NULL,      
	tipo char(7) NOT NULL,             
	idConcelho int NOT NULL,   

	CONSTRAINT codDGAE_unique UNIQUE (codDGAE),
	CONSTRAINT codDGEEC_unique UNIQUE (codDGEEC),
	CONSTRAINT check_tipo_escola CHECK(tipo = 'PÚBLICO' OR tipo = 'PRIVADO'), 
	CONSTRAINT foreignkey_idConcelho FOREIGN KEY (idConcelho) REFERENCES Concelho(idConcelho) ON DELETE RESTRICT
									  			  ON UPDATE CASCADE	    
);

CREATE TABLE TipoCurso(
	codTipoCurso char(1) PRIMARY KEY,			
	nome varchar(100) NOT NULL, 	  
	anoEscInicio int  NOT NULL,
	anoEscFinal int   NOT NULL,

	CONSTRAINT check_codTipoCurso CHECK (codTipoCurso IN ('C','E','N','P','Q','R','T','U','V','W')),
	CONSTRAINT nome_unique UNIQUE (nome),
	CONSTRAINT anoEscFinal_maior_anoEscInicio CHECK (anoEscFinal >= anoEscInicio),
	CONSTRAINT check_anoEscInicio CHECK (anoEscInicio >= 10 AND anoEscInicio <=12),	
	CONSTRAINT check_anoEscFinal CHECK (anoEscFinal >= 10 AND anoEscFinal <=12)

);

CREATE TABLE SubTipoCurso(
	codSubTipoCurso char(3) PRIMARY KEY,
	nome varchar(100) NOT NULL, 
	codTipoCurso char(1) NOT NULL,
			  			  
	CONSTRAINT nomeSubTipoCurso_unique UNIQUE (nome),
	CONSTRAINT check_codSubTipoCurso CHECK(substr(codSubTipoCurso,1,1) = codTipoCurso),
	CONSTRAINT foreignkey_codTipoCurso FOREIGN KEY (codTipoCurso) REFERENCES TipoCurso(codTipoCurso) ON DELETE CASCADE 
									      				 ON UPDATE CASCADE
);

CREATE TABLE Curso(
	codCurso char(3) PRIMARY KEY,
	nome varchar(50) NOT NULL,   
	codSubTipoCurso char(3) NOT NULL, 
			    
	CONSTRAINT foreignkey_codSubTipoCurso FOREIGN KEY (codSubTipoCurso) REFERENCES SubTipoCurso(codSubTipoCurso) ON DELETE CASCADE
													   	     ON UPDATE CASCADE
);

CREATE TABLE Aluno(
	idAluno int PRIMARY KEY,
	nome varchar(100) NOT NULL,
	sexo char(1) NOT NULL ON CONFLICT REPLACE DEFAULT '?', 
	dataNascimento date NOT NULL,
	anoEscolaridade int,
	codCurso char(3) NOT NULL,
  
	CONSTRAINT check_sexo CHECK(sexo = 'M' OR sexo = 'F' OR sexo = '?'),
	CONSTRAINT check_anoEscolaridade CHECK(anoEscolaridade = '12' OR anoEscolaridade = '11' OR anoEscolaridade = NULL)
	CONSTRAINT foreignkey_codCurso FOREIGN KEY(codCurso) REFERENCES Curso(codCurso) ON DELETE CASCADE
							   	  			ON UPDATE CASCADE
);

CREATE TABLE DisciplinaExame(
	codExame char(3) PRIMARY KEY,      
	disciplina varchar(30) NOT NULL,
	anoEscolaridade int NOT NULL,

	CONSTRAINT disciplina_unique UNIQUE (disciplina)
	CONSTRAINT check_anoEscolaridade CHECK(anoEscolaridade = 11 OR anoEscolaridade = 12) 
	
);

CREATE TABLE Exame(
	idExame int PRIMARY KEY,
	fase int NOT NULL,               
	anoLetivo char(9) NOT NULL,  
	dataRealizacao date NOT NULL,
	codExame char(3) NOT NULL,

	CONSTRAINT check_fase CHECK (fase = 1 OR 
				     fase = 2),
	CONSTRAINT check_anoLetivo CHECK (CAST (SUBSTR(anoLetivo,6,4) AS INT) = CAST(SUBSTR(anoLetivo,1,4) AS INT) + 1 AND SUBSTR(anoLetivo,5,1) = '/') ,
	CONSTRAINT check_year CHECK(strftime('%Y', dataRealizacao) = SUBSTR(anoLetivo,6,4)),
	CONSTRAINT foreignkey_codExame FOREIGN KEY(codExame) REFERENCES DisciplinaExame(codExame) ON DELETE CASCADE
									    			  ON UPDATE CASCADE                        
);

CREATE TABLE OndeRealiza(
	idAluno int PRIMARY KEY,
	idEscola int NOT NULL,
 
	CONSTRAINT foreignkey_idAluno FOREIGN KEY(idAluno) REFERENCES Aluno(idAluno)    ON DELETE CASCADE
							           			ON UPDATE CASCADE,
	CONSTRAINT foreignkey_idEscola FOREIGN KEY(idEscola) REFERENCES Escola(idEscola) ON DELETE CASCADE
								   			 ON UPDATE CASCADE
);

CREATE TABLE AlunoRealiza(
	idAluno int,
	idExame int,
	sitFrequencia varchar(20),
	serInterno char(1) NOT NULL,
	notaExame real NOT NULL ON CONFLICT REPLACE DEFAULT '0.0',
	paraAprov char(1) NOT NULL,
	paraMelhoria char(1) NOT NULL,
	provaIngresso char(1) NOT NULL,
	CFCEPE char(1) NOT NULL,
 
	CONSTRAINT check_sitFrequencia CHECK (sitFrequencia IN ('Admitido a exame', 'Anulou a matrícula', 'Excluído por faltas', 'Reprovou frequência')),
	CONSTRAINT check_serInterno CHECK (serInterno = 'S' OR serInterno = 'N'),
	CONSTRAINT check_sitFrequencia_serInterno CHECK (CASE WHEN serInterno = 'S' THEN sitFrequencia = 'Admitido a exame' END),
	CONSTRAINT check_notaExame CHECK (notaExame >= 0.0 AND notaExame <= 20.0),
	CONSTRAINT check_paraAprov CHECK (paraAprov = 'S' OR paraAprov = 'N'),
	CONSTRAINT check_paraMelhoria CHECK (paraMelhoria = 'S' OR paraMelhoria = 'N'),
	CONSTRAINT check_provaIngresso CHECK (provaIngresso = 'S' OR provaIngresso = 'N'),
	CONSTRAINT check_CFCEPE CHECK (CFCEPE = 'S' OR CFCEPE = 'N'),
	CONSTRAINT foreignkey_idAluno FOREIGN KEY(idAluno) REFERENCES Aluno(idAluno) ON DELETE CASCADE
										     ON UPDATE CASCADE,
	CONSTRAINT foreignkey_idExame FOREIGN KEY(idExame) REFERENCES Exame(idExame) ON DELETE CASCADE
										     ON UPDATE CASCADE,
	PRIMARY KEY(idAluno, idExame)

	
);

COMMIT;