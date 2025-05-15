CREATE DATABASE Faculdade;
USE Faculdade;


CREATE TABLE Departamento (
    cod_departamento INT PRIMARY KEY IDENTITY(1,1),
    nome_departamento VARCHAR(100) NOT NULL
);


CREATE TABLE Endereco (
    cod_Endereco INT PRIMARY KEY IDENTITY(1,1),
    nome_rua VARCHAR(255) NOT NULL,
    numero INT NOT NULL,
    complemento VARCHAR(50) NULL,
    bairro VARCHAR(100) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    estado VARCHAR(100) NOT NULL,
    CEP VARCHAR(10) NOT NULL
);


CREATE TABLE Curso (
    cod_Curso INT PRIMARY KEY IDENTITY(1,1),
    nome_Curso VARCHAR(255) NOT NULL,
    tipo VARCHAR(255) NOT NULL,
    duracao_meses INT NOT NULL,
    cod_departamento INT NOT NULL,
    turno VARCHAR(50) NOT NULL,
    carga_horaria_total INT NOT NULL,
    modalidade VARCHAR(50) NOT NULL,
    FOREIGN KEY (cod_departamento) REFERENCES Departamento(cod_departamento)
);


CREATE TABLE Disciplina (
    Cod_Disciplina INT PRIMARY KEY IDENTITY(1,1),
    nome_Disciplina VARCHAR(255) NOT NULL,
    Ementa TEXT NOT NULL,
    Cod_Departamento INT NOT NULL,
    Carga_Horaria_Total INT NOT NULL,
    FOREIGN KEY (Cod_Departamento) REFERENCES Departamento(cod_departamento)
);


CREATE TABLE Professor (
    cod_professor INT PRIMARY KEY IDENTITY(1,1),
    nome_professor VARCHAR(255) NOT NULL,
    sobrenome_professor VARCHAR(255) NOT NULL,
    data_nascimento DATE NOT NULL,
    identificacao_genero VARCHAR(50) NULL,
    data_contratacao DATE NOT NULL,
    tipo_vinculo VARCHAR(50) NOT NULL,
    CPF VARCHAR(14) NOT NULL UNIQUE,
    RG VARCHAR(20) NOT NULL UNIQUE,
    TITULACAO VARCHAR(50) NOT NULL,
    email_pessoal VARCHAR(255) NULL,
    email_corporativo VARCHAR(255) NULL,
    cod_departamento INT NOT NULL,
    status_professor VARCHAR(50) NOT NULL,
    cod_endereco INT NOT NULL,
    FOREIGN KEY (cod_departamento) REFERENCES Departamento(cod_departamento),
    FOREIGN KEY (cod_endereco) REFERENCES Endereco(cod_Endereco)
);


CREATE TABLE Aluno (
    ra_Aluno INT PRIMARY KEY NOT NULL,
    nome_Aluno VARCHAR(255) NOT NULL,
    sobrenome_Aluno VARCHAR(255) NOT NULL,
    data_nascimento DATE NOT NULL,
    identificacao_genero VARCHAR(50) NULL,
    CPF VARCHAR(14) NOT NULL UNIQUE,
    RG VARCHAR(20) NOT NULL UNIQUE,
    nacionalidade VARCHAR(100) NOT NULL,
    estado_civil VARCHAR(50) NOT NULL,
    naturalidade VARCHAR(100) NOT NULL,
    deficiencia VARCHAR(255) NOT NULL,
    data_ingresso DATE NOT NULL,
    email_pessoal VARCHAR(255) NULL,
    email_corporativo VARCHAR(255) NULL,
    status_Aluno VARCHAR(50) NOT NULL,
    nome_mae VARCHAR(255) NOT NULL,
    nome_pai VARCHAR(255) NULL,
    cod_endereco INT NOT NULL,
    cod_curso INT NOT NULL,
    FOREIGN KEY (cod_endereco) REFERENCES Endereco(cod_Endereco),
    FOREIGN KEY (cod_curso) REFERENCES Curso(cod_Curso)
);


CREATE TABLE Telefone_Aluno (
    Cod_Telefone INT PRIMARY KEY IDENTITY(1,1),
    RA_Aluno INT NOT NULL,
    num_Telefone VARCHAR(15) NOT NULL,
    tipo_Telefone VARCHAR(30) NOT NULL,
    FOREIGN KEY (RA_Aluno) REFERENCES Aluno(ra_Aluno)
);


CREATE TABLE Telefone_Professor (
    Cod_Telefone_Professor INT PRIMARY KEY IDENTITY(1,1),
    Cod_Professor INT NOT NULL,
    num_Telefone VARCHAR(15) NOT NULL,
    tipo_Telefone VARCHAR(30) NOT NULL,
    FOREIGN KEY (Cod_Professor) REFERENCES Professor(cod_professor)
);


CREATE TABLE Turma (
    Cod_Turma INT PRIMARY KEY IDENTITY(1,1),
    Cod_curso INT NOT NULL,
    sala VARCHAR(50) NOT NULL,
    ano INT NOT NULL,
    semestre INT NOT NULL,
    Cod_Disciplina INT NOT NULL,
    Cod_Professor INT NOT NULL,
    periodo VARCHAR(50) NOT NULL,
    Numero_Alunos INT NOT NULL,
    FOREIGN KEY (Cod_curso) REFERENCES Curso(cod_Curso),
    FOREIGN KEY (Cod_Disciplina) REFERENCES Disciplina(Cod_Disciplina),
    FOREIGN KEY (Cod_Professor) REFERENCES Professor(cod_professor)
);


CREATE TABLE Historico (
    cod_Disciplina INT,
    ra_Aluno INT,
    ano INT,
    semestre INT,
    nota DECIMAL(4,2),
    frequencia DECIMAL(5,2),
    situacao VARCHAR(20) NOT NULL,
    PRIMARY KEY (cod_Disciplina, ra_Aluno, ano, semestre),
    FOREIGN KEY (cod_Disciplina) REFERENCES Disciplina(Cod_Disciplina),
    FOREIGN KEY (ra_Aluno) REFERENCES Aluno(ra_Aluno)
);


CREATE TABLE Disciplina_PreRequisito (
    cod_Disciplina INT NOT NULL,
    cod_PreRequisito INT NOT NULL,
    PRIMARY KEY (cod_Disciplina, cod_PreRequisito),
    FOREIGN KEY (cod_Disciplina) REFERENCES Disciplina(Cod_Disciplina),
    FOREIGN KEY (cod_PreRequisito) REFERENCES Disciplina(Cod_Disciplina)
);


CREATE TABLE Matricula (
    cod_Matricula INT PRIMARY KEY IDENTITY(1,1),
    ra_Aluno INT NOT NULL,
    cod_Turma INT NOT NULL,
    data_Matricula DATE NOT NULL,
    data_Cancelamento DATE NULL,
    motivo_Cancelamento TEXT NULL,
    status_Matricula VARCHAR(50) NOT NULL,
    FOREIGN KEY (ra_Aluno) REFERENCES Aluno(ra_Aluno),
    FOREIGN KEY (cod_Turma) REFERENCES Turma(Cod_Turma)
);


CREATE TABLE Curso_Disciplina (
    cod_Curso INT NOT NULL,
    cod_Disciplina INT NOT NULL,
    tipo_Disciplina VARCHAR(50) NOT NULL,
    PRIMARY KEY (cod_Curso, cod_Disciplina),
    FOREIGN KEY (cod_Curso) REFERENCES Curso(cod_Curso),
    FOREIGN KEY (cod_Disciplina) REFERENCES Disciplina(Cod_Disciplina),
    CHECK (tipo_Disciplina IN ('Obrigatória', 'Optativa'))
);


CREATE TABLE Professor_Disciplina (
    cod_Professor INT NOT NULL,
    cod_Disciplina INT NOT NULL,
    PRIMARY KEY (cod_Professor, cod_Disciplina),
    FOREIGN KEY (cod_Professor) REFERENCES Professor(cod_professor),
    FOREIGN KEY (cod_Disciplina) REFERENCES Disciplina(Cod_Disciplina)
);


select * from Historico;
