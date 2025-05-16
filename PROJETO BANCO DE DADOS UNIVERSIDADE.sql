CREATE DATABASE FaculdadeNovo;
GO

USE FaculdadeNovo;
GO


CREATE TABLE Departamento (
    cod_departamento INT PRIMARY KEY IDENTITY(1,1),
    nome_departamento VARCHAR(100) NOT NULL
);
GO

INSERT INTO Departamento (nome_departamento) VALUES
('Engenharia'),
('Direito'),
('Medicina'),
('Arquitetura'),
('Ciências da Computação');
GO


CREATE TABLE Endereco (
    cod_endereco INT PRIMARY KEY IDENTITY(1,1),
    nome_rua VARCHAR(255) NOT NULL,
    numero INT NOT NULL,
    complemento VARCHAR(50) NULL,
    bairro VARCHAR(100) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    estado VARCHAR(100) NOT NULL,
    CEP VARCHAR(10) NOT NULL
);
GO

INSERT INTO Endereco (nome_rua, numero, complemento, bairro, cidade, estado, CEP) VALUES
('Rua A', 100, NULL, 'Centro', 'São Paulo', 'SP', '01000-000'),
('Rua B', 200, 'Apto 101', 'Jardim', 'Rio de Janeiro', 'RJ', '20000-000'),
('Rua C', 300, NULL, 'Vila Nova', 'Belo Horizonte', 'MG', '30000-000'),
('Rua D', 400, 'Casa', 'Centro', 'Curitiba', 'PR', '40000-000'),
('Rua E', 500, 'Bloco 2', 'Boa Vista', 'Porto Alegre', 'RS', '50000-000');
GO


CREATE TABLE Curso (
    cod_curso INT PRIMARY KEY IDENTITY(1,1),
    nome_curso VARCHAR(255) NOT NULL,
    tipo VARCHAR(255) NOT NULL,
    duracao_meses INT NOT NULL,
    cod_departamento INT NOT NULL,
    turno VARCHAR(50) NOT NULL,
    carga_horaria_total INT NOT NULL,
    modalidade VARCHAR(50) NOT NULL,
    FOREIGN KEY (cod_departamento) REFERENCES Departamento(cod_departamento)
);
GO

INSERT INTO Curso (nome_curso, tipo, duracao_meses, cod_departamento, turno, carga_horaria_total, modalidade) VALUES
('Engenharia Civil', 'Presencial', 60, 1, 'Integral', 4000, 'Presencial'),
('Direito', 'Presencial', 48, 2, 'Noturno', 3200, 'Presencial'),
('Medicina', 'Presencial', 72, 3, 'Integral', 5000, 'Presencial'),
('Arquitetura', 'Presencial', 60, 4, 'Integral', 4200, 'Presencial'),
('Ciência da Computação', 'Presencial', 48, 5, 'Integral', 3500, 'Presencial');
GO


CREATE TABLE Disciplina (
    cod_disciplina INT PRIMARY KEY IDENTITY(1,1),
    nome_disciplina VARCHAR(255) NOT NULL,
    ementa TEXT NOT NULL,
    cod_departamento INT NOT NULL,
    carga_horaria_total INT NOT NULL,
    FOREIGN KEY (cod_departamento) REFERENCES Departamento(cod_departamento)
);
GO

INSERT INTO Disciplina (nome_disciplina, ementa, cod_departamento, carga_horaria_total) VALUES
('Cálculo I', 'Funções, limites, derivadas.', 1, 80),
('Direito Constitucional', 'Princípios constitucionais.', 2, 60),
('Anatomia Humana', 'Estudo do corpo humano.', 3, 100),
('Desenho Técnico', 'Fundamentos do desenho.', 4, 70),
('Programação', 'Introdução à programação.', 5, 90);
GO


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
    titulacao VARCHAR(50) NOT NULL,
    email_pessoal VARCHAR(255) NULL,
    email_corporativo VARCHAR(255) NULL,
    cod_departamento INT NOT NULL,
    status_professor VARCHAR(50) NOT NULL,
    cod_endereco INT NOT NULL,
    FOREIGN KEY (cod_departamento) REFERENCES Departamento(cod_departamento),
    FOREIGN KEY (cod_endereco) REFERENCES Endereco(cod_endereco)
);
GO

INSERT INTO Professor (nome_professor, sobrenome_professor, data_nascimento, identificacao_genero, data_contratacao, tipo_vinculo, CPF, RG, titulacao, email_pessoal, email_corporativo, cod_departamento, status_professor, cod_endereco) VALUES
('João', 'Silva', '1975-03-10', 'Masculino', '2005-08-01', 'Efetivo', '111.111.111-11', 'MG123456', 'Doutor', 'joao.silva@gmail.com', 'joao.silva@faculdade.edu', 1, 'Ativo', 1),
('Maria', 'Souza', '1980-07-22', 'Feminino', '2010-01-15', 'Contrato', '222.222.222-22', 'SP234567', 'Mestre', 'maria.souza@gmail.com', 'maria.souza@faculdade.edu', 2, 'Ativo', 2),
('Carlos', 'Oliveira', '1965-05-12', 'Masculino', '2000-09-20', 'Efetivo', '333.333.333-33', 'RJ345678', 'Doutor', 'carlos.oliveira@gmail.com', 'carlos.oliveira@faculdade.edu', 3, 'Ativo', 3),
('Ana', 'Lima', '1978-11-30', 'Feminino', '2012-03-25', 'Efetivo', '444.444.444-44', 'PR456789', 'Mestre', 'ana.lima@gmail.com', 'ana.lima@faculdade.edu', 4, 'Ativo', 4),
('Marcos', 'Pereira', '1982-09-14', 'Masculino', '2015-06-10', 'Contrato', '555.555.555-55', 'RS567890', 'Doutor', 'marcos.pereira@gmail.com', 'marcos.pereira@faculdade.edu', 5, 'Ativo', 5);
GO


CREATE TABLE Aluno (
    ra_aluno INT PRIMARY KEY,
    nome_aluno VARCHAR(255) NOT NULL,
    sobrenome_aluno VARCHAR(255) NOT NULL,
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
    status_aluno VARCHAR(50) NOT NULL,
    nome_mae VARCHAR(255) NOT NULL,
    nome_pai VARCHAR(255) NULL,
    cod_endereco INT NOT NULL,
    cod_curso INT NOT NULL,
    FOREIGN KEY (cod_endereco) REFERENCES Endereco(cod_endereco),
    FOREIGN KEY (cod_curso) REFERENCES Curso(cod_curso)
);
GO

INSERT INTO Aluno (ra_aluno, nome_aluno, sobrenome_aluno, data_nascimento, identificacao_genero, CPF, RG, nacionalidade, estado_civil, naturalidade, deficiencia, data_ingresso, email_pessoal, email_corporativo, status_aluno, nome_mae, nome_pai, cod_endereco, cod_curso) VALUES
(1001, 'Lucas', 'Silva', '2000-05-10', 'Masculino', '666.666.666-66', 'MG654321', 'Brasileira', 'Solteiro', 'Belo Horizonte', 'Nenhuma', '2022-01-15', 'lucas@gmail.com', 'lucas@faculdade.edu', 'Ativo', 'Maria Silva', 'João Silva', 1, 1),
(1002, 'Ana', 'Souza', '2001-08-22', 'Feminino', '777.777.777-77', 'SP765432', 'Brasileira', 'Solteira', 'São Paulo', 'Nenhuma', '2022-01-15', 'ana@gmail.com', 'ana@faculdade.edu', 'Ativo', 'Carla Souza', NULL, 2, 2),
(1003, 'Carlos', 'Oliveira', '1999-03-12', 'Masculino', '888.888.888-88', 'RJ876543', 'Brasileira', 'Solteiro', 'Rio de Janeiro', 'Visual', '2022-01-15', 'carlos@gmail.com', 'carlos@faculdade.edu', 'Ativo', 'Patrícia Oliveira', 'Roberto Oliveira', 3, 3),
(1004, 'Juliana', 'Lima', '2000-11-30', 'Feminino', '999.999.999-99', 'PR987654', 'Brasileira', 'Casada', 'Curitiba', 'Auditiva', '2022-01-15', 'juliana@gmail.com', 'juliana@faculdade.edu', 'Ativo', 'Fernanda Lima', 'Eduardo Lima', 4, 4),
(1005, 'Marcos', 'Pereira', '1998-09-14', 'Masculino', '000.000.000-00', 'RS098765', 'Brasileira', 'Solteiro', 'Porto Alegre', 'Nenhuma', '2022-01-15', 'marcos@gmail.com', 'marcos@faculdade.edu', 'Ativo', 'Luciana Pereira', 'Carlos Pereira', 5, 5);
GO


CREATE TABLE Telefone_Aluno (
    cod_telefone INT PRIMARY KEY IDENTITY(1,1),
    ra_aluno INT NOT NULL,
    num_telefone VARCHAR(15) NOT NULL,
    tipo_telefone VARCHAR(30) NOT NULL,
    FOREIGN KEY (ra_aluno) REFERENCES Aluno(ra_aluno)
);
GO

INSERT INTO Telefone_Aluno (ra_aluno, num_telefone, tipo_telefone) VALUES
(1001, '11999999999', 'Celular'),
(1002, '11988888888', 'Residencial'),
(1003, '21977777777', 'Celular'),
(1004, '41966666666', 'Celular'),
(1005, '51955555555', 'Comercial');
GO


CREATE TABLE Telefone_Professor (
    cod_telefone_professor INT PRIMARY KEY IDENTITY(1,1),
    cod_professor INT NOT NULL,
    num_telefone VARCHAR(15) NOT NULL,
    tipo_telefone VARCHAR(30) NOT NULL,
    FOREIGN KEY (cod_professor) REFERENCES Professor(cod_professor)
);
GO

INSERT INTO Telefone_Professor (cod_professor, num_telefone, tipo_telefone) VALUES
(1, '11911111111', 'Celular'),
(2, '21922222222', 'Residencial'),
(3, '31933333333', 'Celular'),
(4, '41944444444', 'Celular'),
(5, '51955555555', 'Comercial');
GO


CREATE TABLE Turma (
    cod_turma INT PRIMARY KEY IDENTITY(1,1),
    cod_curso INT NOT NULL,
    sala VARCHAR(50) NOT NULL,
    ano INT NOT NULL,
    semestre INT NOT NULL,
    cod_disciplina INT NOT NULL,
    cod_professor INT NOT NULL,
    periodo VARCHAR(50) NOT NULL,
    numero_alunos INT NOT NULL,
    FOREIGN KEY (cod_curso) REFERENCES Curso(cod_curso),
    FOREIGN KEY (cod_disciplina) REFERENCES Disciplina(cod_disciplina),
    FOREIGN KEY (cod_professor) REFERENCES Professor(cod_professor)
);
GO

INSERT INTO Turma (cod_curso, sala, ano, semestre, cod_disciplina, cod_professor, periodo, numero_alunos) VALUES
(1, 'Sala 101', 2025, 1, 1, 1, 'Manhã', 30),
(2, 'Sala 202', 2025, 1, 2, 2, 'Noite', 40),
(3, 'Sala 303', 2025, 1, 3, 3, 'Manhã', 25),
(4, 'Sala 404', 2025, 1, 4, 4, 'Tarde', 20),
(5, 'Sala 505', 2025, 1, 5, 5, 'Manhã', 35);
GO


CREATE TABLE Historico (
    cod_disciplina INT NOT NULL,
    ra_aluno INT NOT NULL,
    ano INT NOT NULL,
    semestre INT NOT NULL,
    nota DECIMAL(4,2),
    frequencia DECIMAL(5,2),
    situacao VARCHAR(20) NOT NULL,
    PRIMARY KEY (cod_disciplina, ra_aluno, ano, semestre),
    FOREIGN KEY (cod_disciplina) REFERENCES Disciplina(cod_disciplina),
    FOREIGN KEY (ra_aluno) REFERENCES Aluno(ra_aluno)
);
GO

INSERT INTO Historico (cod_disciplina, ra_aluno, ano, semestre, nota, frequencia, situacao) VALUES
(1, 1001, 2024, 2, 8.5, 90.0, 'Aprovado'),
(2, 1002, 2024, 2, 7.0, 85.0, 'Aprovado'),
(3, 1003, 2024, 2, 6.0, 80.0, 'Reprovado'),
(4, 1004, 2024, 2, 9.0, 95.0, 'Aprovado'),
(5, 1005, 2024, 2, 7.5, 88.0, 'Aprovado');
GO


CREATE TABLE Disciplina_PreRequisito (
    cod_disciplina INT NOT NULL,
    cod_prerequisito INT NOT NULL,
    PRIMARY KEY (cod_disciplina, cod_prerequisito),
    FOREIGN KEY (cod_disciplina) REFERENCES Disciplina(cod_disciplina),
    FOREIGN KEY (cod_prerequisito) REFERENCES Disciplina(cod_disciplina)
);
GO

INSERT INTO Disciplina_PreRequisito (cod_disciplina, cod_prerequisito) VALUES
(2, 1), 
(3, 1),
(4, 1),
(5, 1),
(5, 2);
GO


CREATE TABLE Matricula (
    cod_matricula INT PRIMARY KEY IDENTITY(1,1),
    ra_aluno INT NOT NULL,
    cod_turma INT NOT NULL,
    data_matricula DATE NOT NULL,
    data_cancelamento DATE NULL,
    motivo_cancelamento TEXT NULL,
    status_matricula VARCHAR(50) NOT NULL,
    FOREIGN KEY (ra_aluno) REFERENCES Aluno(ra_aluno),
    FOREIGN KEY (cod_turma) REFERENCES Turma(cod_turma)
);
GO

INSERT INTO Matricula (ra_aluno, cod_turma, data_matricula, data_cancelamento, motivo_cancelamento, status_matricula) VALUES
(1001, 1, '2025-01-10', NULL, NULL, 'Ativo'),
(1002, 2, '2025-01-10', NULL, NULL, 'Ativo'),
(1003, 3, '2025-01-10', NULL, NULL, 'Ativo'),
(1004, 4, '2025-01-10', NULL, NULL, 'Ativo'),
(1005, 5, '2025-01-10', NULL, NULL, 'Ativo');
GO


CREATE TABLE Curso_Disciplina (
    cod_curso INT NOT NULL,
    cod_disciplina INT NOT NULL,
    tipo_disciplina VARCHAR(50) NOT NULL CHECK (tipo_disciplina IN ('Obrigatória', 'Optativa')),
    PRIMARY KEY (cod_curso, cod_disciplina),
    FOREIGN KEY (cod_curso) REFERENCES Curso(cod_curso),
    FOREIGN KEY (cod_disciplina) REFERENCES Disciplina(cod_disciplina)
);
GO

INSERT INTO Curso_Disciplina (cod_curso, cod_disciplina, tipo_disciplina) VALUES
(1, 1, 'Obrigatória'),
(2, 2, 'Obrigatória'),
(3, 3, 'Obrigatória'),
(4, 4, 'Obrigatória'),
(5, 5, 'Obrigatória');
GO


CREATE TABLE Professor_Disciplina (
    cod_professor INT NOT NULL,
    cod_disciplina INT NOT NULL,
    PRIMARY KEY (cod_professor, cod_disciplina),
    FOREIGN KEY (cod_professor) REFERENCES Professor(cod_professor),
    FOREIGN KEY (cod_disciplina) REFERENCES Disciplina(cod_disciplina)
);
GO

INSERT INTO Professor_Disciplina (cod_professor, cod_disciplina) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);
GO


CREATE TABLE Notas (
    cod_nota INT PRIMARY KEY IDENTITY(1,1),
    ra_Aluno INT NOT NULL,
    Cod_Disciplina INT NOT NULL,
    Cod_Turma INT NOT NULL,
    Nota DECIMAL(4,2) NOT NULL,
    data_lancamento DATE NOT NULL,
    FOREIGN KEY (ra_Aluno) REFERENCES Aluno(ra_Aluno),
    FOREIGN KEY (Cod_Disciplina) REFERENCES Disciplina(Cod_Disciplina),
    FOREIGN KEY (Cod_Turma) REFERENCES Turma(Cod_Turma)
);



INSERT INTO Notas (ra_Aluno, Cod_Disciplina, Cod_Turma, Nota, data_lancamento) VALUES
(1001, 1, 1, 8.5, '2025-05-01'),
(1002, 2, 2, 7.0, '2025-05-01'),
(1003, 3, 3, 9.2, '2025-05-01'),
(1004, 4, 4, 6.8, '2025-05-01'),
(1005, 5, 5, 7.5, '2025-05-01');



SELECT 
    A.ra_Aluno,
    A.nome_Aluno,
    A.sobrenome_Aluno,
    D.Cod_Disciplina,
    D.nome_Disciplina,
    T.Cod_Turma,
    T.sala,
    N.Nota,
    N.data_lancamento
FROM Notas N
JOIN Aluno A ON N.ra_Aluno = A.ra_Aluno
JOIN Disciplina D ON N.Cod_Disciplina = D.Cod_Disciplina
JOIN Turma T ON N.Cod_Turma = T.Cod_Turma;





SELECT * FROM Departamento;
SELECT * FROM Endereco;
SELECT * FROM Curso;
SELECT * FROM Disciplina;
SELECT * FROM Professor;
SELECT * FROM Aluno;
SELECT * FROM Telefone_Aluno;
SELECT * FROM Telefone_Professor;
SELECT * FROM Turma;
SELECT * FROM Historico;
SELECT * FROM Disciplina_PreRequisito;
SELECT * FROM Matricula;
SELECT * FROM Curso_Disciplina;
SELECT * FROM Professor_Disciplina;
SELECT * FROM Notas;


