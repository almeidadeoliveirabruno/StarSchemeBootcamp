CREATE DATABASE DESAFIO_BOOTCAMP_STARSCHEMA
USE DESAFIO_BOOTCAMP_STARSCHEMA

CREATE TABLE ALUNO(
	IDALUNO INT NOT NULL PRIMARY KEY
)

CREATE TABLE Departamento(
	IDdepartamento INT NOT NULL PRIMARY KEY,
	NOME VARCHAR(45),
	CAMPUS VARCHAR(45),
	ID_PROFESSOR_CORDENADOR INT
)

CREATE TABLE PROFESSOR (
	IDprofessor INT NOT NULL PRIMARY KEY,
	Departamentoid_departamento INT,
	FOREIGN KEY (Departamentoid_departamento) REFERENCES DEPARTAMENTO(IDdepartamento)
)

ALTER TABLE DEPARTAMENTO ADD CONSTRAINT fk_professor FOREIGN KEY (ID_PROFESSOR_CORDENADOR) REFERENCES Professor(IDprofessor);

CREATE TABLE DISCIPLINA(
	idDISCIPLINA INT NOT NUll PRIMARY KEY,
	Professor_idProfessor INT,
	FOREIGN KEY (Professor_idProfessor) REFERENCES PROFESSOR(Idprofessor)
)

CREATE TABLE MATRICULADO (
	Aluno_idaluno INT,
	Disciplina_idDisciplina INT,
	PRIMARY KEY (Aluno_idaluno, Disciplina_idDisciplina),
	FOREIGN KEY(Aluno_idaluno) REFERENCES Aluno(idAluno),
	FOREIGN KEY(Disciplina_idDisciplina) REFERENCES Disciplina(idDISCIPLINA)
)

CREATE TABLE CURSO (
	idCurso INT PRIMARY KEY,
	Departamento_iddepartamento INT
)

CREATE TABLE DISCIPLINAeCURSO(
	Disciplina_idDisciplina INT,
	Curso_idCurso INT,
	Primary KEY(Disciplina_idDisciplina,Curso_idCurso),
	FOREIGN KEY (Curso_idCurso) REFERENCES CURSO (idCurso),
	FOREIGN KEY (Disciplina_idDisciplina) REFERENCES Disciplina(idDisciplina)
)

CREATE TABLE PRE_REQUISITOS(
	idpre_requisitos INT NOT NULL PRIMARY KEY
)

CREATE TABLE PRE_REQUISITOS_DAS_DISCIPLINAS(
	Disciplina_idDisciplina INT,
	pre_requisitos_idpre_requisitos INT,
	PRIMARY KEY (Disciplina_idDisciplina, pre_requisitos_idpre_requisitos),
	FOREIGN KEY (Disciplina_idDisciplina) REFERENCES Disciplina(idDISCIPLINA),
	FOREIGN KEY (pre_requisitos_idpre_requisitos) REFERENCES PRE_REQUISITOS(idpre_requisitos)
)