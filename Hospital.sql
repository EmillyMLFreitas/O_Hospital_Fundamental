DROP DATABASE IF EXISTS Hospital;

CREATE DATABASE IF NOT EXISTS Hospital;
USE Hospital;

-- Tabela Médico
CREATE TABLE IF NOT EXISTS Medico (
    Id_medico INT AUTO_INCREMENT PRIMARY KEY,
    Nome_medico VARCHAR(255),
    Data_nascimento DATE,
    Endereco VARCHAR(255),
    Telefone VARCHAR(20),
    Email VARCHAR(255),
    Tipo_medico VARCHAR(50), 
    CRM VARCHAR(20),
    Id_convenio INT,
    FOREIGN KEY (Id_convenio) REFERENCES Convenio(Id_convenio)
);

-- Tabela Especialidade
CREATE TABLE IF NOT EXISTS Especialidade (
    Id_especialidade INT AUTO_INCREMENT PRIMARY KEY,
    Nome_especialidade VARCHAR(255)
);

-- Tabela de Relacionamento Médico_Especialidade
CREATE TABLE IF NOT EXISTS Medico_Especialidade (
    Id_relacao INT AUTO_INCREMENT PRIMARY KEY,
    Id_medico INT,
    Id_especialidade INT,
    FOREIGN KEY (Id_medico) REFERENCES Medico(Id_medico),
    FOREIGN KEY (Id_especialidade) REFERENCES Especialidade(Id_especialidade)
);

-- Tabela Convênio
CREATE TABLE IF NOT EXISTS Convenio (
    Id_convenio INT AUTO_INCREMENT PRIMARY KEY,
    Nome_convenio VARCHAR(255),
    CNPJ VARCHAR(14),
    Tempo_carencia INT,
	Convenio_numero_carteira VARCHAR(50)
);

-- Tabela Paciente
CREATE TABLE IF NOT EXISTS Paciente (
    Id_paciente INT AUTO_INCREMENT PRIMARY KEY,
    Nome_paciente VARCHAR(255),
    Data_nascimento DATE,
    Endereco VARCHAR(255),
    Telefone VARCHAR(20),
    Email VARCHAR(255),
    CPF VARCHAR(11),
    RG VARCHAR(15),
    Id_convenio INT,
    FOREIGN KEY (Id_convenio) REFERENCES Convenio(Id_convenio)
);

-- Tabela Consulta
CREATE TABLE IF NOT EXISTS Consulta (
    Id_consulta INT AUTO_INCREMENT PRIMARY KEY,
    Data_consulta DATE,
    Hora_consulta TIME,
    Id_medico INT,
    Id_paciente INT,
    Valor_consulta INT,
    Id_especialidade INT,
    FOREIGN KEY (Id_medico) REFERENCES Medico(Id_medico),
    FOREIGN KEY (Id_paciente) REFERENCES Paciente(Id_paciente),
    FOREIGN KEY (Id_especialidade) REFERENCES Especialidade(Id_especialidade)
);

-- Tabela Receita
CREATE TABLE IF NOT EXISTS Receita (
    Id_receita INT AUTO_INCREMENT PRIMARY KEY,
    Id_consulta INT,
    Data_receita DATE,
    Descricao_receita TEXT,
    FOREIGN KEY (Id_consulta) REFERENCES Consulta(Id_consulta)
);

-- Tabela Medicamento
CREATE TABLE IF NOT EXISTS Medicamento (
    Id_medicamento INT AUTO_INCREMENT PRIMARY KEY,
    Nome_medicamento VARCHAR(100),
    Quantidade INT,
    Instrucoes_uso TEXT
);

-- Tabela de Relacionamento Receita_Medicamento
CREATE TABLE IF NOT EXISTS Receita_Medicamento (
    Id_relacao INT AUTO_INCREMENT PRIMARY KEY,
    Id_receita INT,
    Id_medicamento INT,
    FOREIGN KEY (Id_receita) REFERENCES Receita(Id_receita),
    FOREIGN KEY (Id_medicamento) REFERENCES Medicamento(Id_medicamento)
);

-- Tabela Tipo de Quarto
CREATE TABLE IF NOT EXISTS Tipo_de_Quarto (
    Id_tipo_quarto INT AUTO_INCREMENT PRIMARY KEY,
    Descricao_tipo_quarto TEXT,
    Valor_diario_tipo_quarto INT
);

-- Tabela Quarto
CREATE TABLE IF NOT EXISTS Quarto (
    Id_quarto INT AUTO_INCREMENT PRIMARY KEY,
    Numeracao_quarto VARCHAR(255),
    Id_tipo_quarto INT,
    FOREIGN KEY (Id_tipo_quarto) REFERENCES Tipo_de_Quarto(Id_tipo_quarto)
);

-- Tabela Internação
CREATE TABLE IF NOT EXISTS Internacao (
    Id_internacao INT AUTO_INCREMENT PRIMARY KEY,
    Id_paciente INT,
    Id_medico INT,
    Id_quarto INT,
    Data_internacao DATE,
    Data_prevista_alta DATE,
    Data_efetiva_alta DATE,
    Descricao_procedimentos TEXT,
    FOREIGN KEY (Id_paciente) REFERENCES Paciente(Id_paciente),
    FOREIGN KEY (Id_medico) REFERENCES Medico(Id_medico),
    FOREIGN KEY (Id_quarto) REFERENCES Quarto(Id_quarto)
);

-- Tabela de Relacionamento Internação_Quarto
CREATE TABLE IF NOT EXISTS Internacao_Quarto (
    Id_relacao INT AUTO_INCREMENT PRIMARY KEY,
    Id_internacao INT,
    Id_quarto INT,
    FOREIGN KEY (Id_internacao) REFERENCES Internacao(Id_internacao),
    FOREIGN KEY (Id_quarto) REFERENCES Quarto(Id_quarto)
);

-- Tabela Enfermeiro
CREATE TABLE IF NOT EXISTS Enfermeiro (
    Id_enfermeiro INT AUTO_INCREMENT PRIMARY KEY,
    Nome_enfermeiro VARCHAR(255),
    CPF VARCHAR(11),
    CRE VARCHAR(20)
);

-- Tabela de Relacionamento Internação_Enfermeiro
CREATE TABLE IF NOT EXISTS Internacao_Enfermeiro (
    Id_relacao INT AUTO_INCREMENT PRIMARY KEY,
    Id_internacao INT,
    Id_enfermeiro INT,
    FOREIGN KEY (Id_internacao) REFERENCES Internacao(Id_internacao),
    FOREIGN KEY (Id_enfermeiro) REFERENCES Enfermeiro(Id_enfermeiro)
);


