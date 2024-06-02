USE Hospital;

INSERT INTO Medico (Nome_medico, Data_nascimento, Endereco, Telefone, Email, Tipo_medico, CRM) VALUES 
('Dr. João Silva', '1980-05-10', 'Rua dos Médicos, 123', '+55 11 91234-5678', 'joao.silva@gmail.com', 'Especialista', 'CRM12345'),
('Dr. Maria Santos', '1975-08-20', 'Av. das Flores, 456', '+55 11 92345-6789', 'maria.santos@gmail.com', 'Especialista', 'CRM54321'),
('Dr. José Oliveira', '1990-03-15', 'Travessa das Palmeiras, 789', '+55 11 93456-7890', 'jose.oliveira@gmail.com', 'Generalista', 'CRM67890'),
('Dr. Ana Rodrigues', '1988-11-25', 'Rua das Águias, 321', '+55 11 94567-8901', 'ana.rodrigues@gmail.com', 'Especialista', 'CRM09876'),
('Dr. Carlos Martins', '1972-06-30', 'Praça das Oliveiras, 987', '+55 11 95678-9012', 'carlos.martins@gmail.com', 'Generalista', 'CRM45678'),
('Dra. Laura Ferreira', '1985-09-12', 'Avenida dos Girassóis, 654', '+55 11 96789-0123', 'laura.ferreira@gmail.com', 'Especialista', 'CRM65432'),
('Dr. Paulo Mendes', '1982-04-03', 'Alameda das Rosas, 789', '+55 11 97890-1234', 'paulo.mendes@gmail.com', 'Especialista', 'CRM23456'),
('Dra. Fernanda Almeida', '1979-12-08', 'Rua das Violetas, 210', '+55 11 98901-2345', 'fernanda.almeida@gmail.com', 'Generalista', 'CRM78901'),
('Dr. Ricardo Pereira', '1983-07-17', 'Travessa dos Cravos, 876', '+55 11 90012-3456', 'ricardo.pereira@gmail.com', 'Especialista', 'CRM34567'),
('Dra. Juliana Costa', '1970-01-05', 'Praça das Orquídeas, 543', '+55 11 91123-4567', 'juliana.costa@gmail.com', 'Generalista', 'CRM01234'),
('Dr. Marcos Oliveira', '1980-07-20', 'Rua Diamante, 789', '+55 11 93333-4444', 'marcos.oliveira@example.com', 'Especialista', 'CRM98765'),
('Dr. Pedro Silva', '1978-11-25', 'Rua Esmeralda, 321', '+55 11 95555-6854', 'pedro.silva@example.com', 'Residente', 'CRM58921');

INSERT INTO especialidade (Nome_especialidade) VALUES 
('Pediatria'),
('Clínica Geral'),
('Gastrenterologia'),
('Dermatologia'),
('Cardiologia'),
('Neurologia'),
('Oftalmologia');

INSERT INTO Convenio (Nome_convenio, CNPJ, Tempo_carencia, Convenio_numero_carteira) VALUES 
('Unimed', '12345678000123', 90, 'UNIMED123456'),
('Amil', '23456789000134', 60, 'AMIL234567'),
('Bradesco Saúde', '34567890000145', 45, 'BRADESCO345678'),
('NotreDame Intermédica', '45678900000156', 30, 'NOTREDAME456789'),
('Porto Seguro Saúde', '56789000000167', 15, 'PORTO567890');

INSERT INTO Paciente (Nome_paciente, Data_nascimento, Endereco, Telefone, Email, CPF, RG, Id_convenio) VALUES 
('Alice Pereira', '1985-01-15', 'Rua das Acácias, 101', '+55 11 91234-5678', 'alice.pereira@gmail.com', '12345678901', 'MG1234567', 1),
('Bruno Silva', '1978-03-22', 'Avenida Central, 202', '+55 11 92345-6789', 'bruno.silva@gmail.com', '23456789012', 'SP2345678', 2),
('Carla Souza', '1990-07-30', 'Travessa das Flores, 303', '+55 11 93456-7890', 'carla.souza@gmail.com', '34567890123', 'RJ3456789', 3),
('Daniel Costa', '1982-11-14', 'Praça das Árvores, 404', '+55 11 94567-8901', 'daniel.costa@gmail.com', '45678901234', 'BA4567890', 4),
('Elaine Ramos', '1995-05-25', 'Alameda dos Pássaros, 505', '+55 11 95678-9012', 'elaine.ramos@gmail.com', '56789012345', 'RS5678901', 5),
('Fabio Almeida', '1970-09-05', 'Rua das Palmeiras, 606', '+55 11 96789-0123', 'fabio.almeida@gmail.com', '67890123456', 'PR6789012', 1),
('Gabriela Lima', '1988-02-18', 'Avenida das Nações, 707', '+55 11 97890-1234', 'gabriela.lima@gmail.com', '78901234567', 'SC7890123', 2),
('Henrique Duarte', '1975-12-28', 'Praça do Sol, 808', '+55 11 98901-2345', 'henrique.duarte@gmail.com', '89012345678', 'PE8901234', 3),
('Isadora Martins', '1992-08-09', 'Travessa das Estrelas, 909', '+55 11 90012-3456', 'isadora.martins@gmail.com', '90123456789', 'GO9012345', 4),
('Jorge Mendes', '1980-04-21', 'Rua das Laranjeiras, 1010', '+55 11 91123-4567', 'jorge.mendes@gmail.com', '01234567890', 'AM0123456', 5),
('Karla Oliveira', '1983-11-11', 'Avenida das Montanhas, 1111', '+55 11 92234-5678', 'karla.oliveira@gmail.com', '12345098765', 'AC1234567', 1),
('Lucas Barbosa', '1977-06-19', 'Praça do Lago, 1212', '+55 11 93345-6789', 'lucas.barbosa@gmail.com', '23456109876', 'RO2345678', 2),
('Mariana Teixeira', '1991-10-10', 'Alameda das Árvores, 1313', '+55 11 94456-7890', 'mariana.teixeira@gmail.com', '34567210987', 'TO3456789', 3),
('Nicolas Souza', '1973-01-03', 'Rua do Rio, 1414', '+55 11 95567-8901', 'nicolas.souza@gmail.com', '45678321098', 'PI4567890', 4),
('Olivia Santos', '1993-07-22', 'Avenida das Águas, 1515', '+55 11 96678-9012', 'olivia.santos@gmail.com', '56789432109', 'RR5678901', 5);

INSERT INTO Consulta (Data_consulta, Hora_consulta, Id_medico, Id_paciente, Valor_consulta, Id_especialidade) VALUES 
('2015-02-15', '10:30:00', 1, 1, 200, 2),
('2016-04-22', '14:00:00', 2, 2, 250, 3),
('2017-05-05', '09:00:00', 3, 3, 300, 4),
('2018-06-17', '11:45:00', 4, 4, 220, 5),
('2019-07-19', '13:30:00', 5, 5, 180, 6),
('2020-08-25', '15:15:00', 6, 6, 190, 7),
('2021-09-30', '16:00:00', 7, 7, 210, 1),
('2021-10-05', '17:00:00', 8, 8, 230, 2),
('2021-11-11', '08:30:00', 9, 9, 240, 3),
('2021-12-15', '10:00:00', 10, 10, 250, 4),
('2022-01-10', '11:00:00', 1, 11, 260, 5),
('2022-02-18', '09:30:00', 2, 12, 270, 6),
('2022-03-22', '12:00:00', 3, 13, 280, 7),
('2022-04-28', '13:00:00', 4, 14, 290, 1),
('2022-05-05', '14:00:00', 5, 15, 300, 2),
('2022-06-10', '15:00:00', 6, 1, 310, 3),
('2022-07-15', '16:00:00', 7, 2, 320, 4),
('2022-08-20', '17:00:00', 8, 3, 330, 5),
('2022-09-25', '08:00:00', 9, 4, 340, 6),
('2022-10-30', '09:00:00', 10, 5, 350, 7);

INSERT INTO Receita (Id_consulta, Data_receita, Descricao_receita) VALUES 
(1, '2015-02-15', 'Receita para tratamento de hipertensão'),
(2, '2016-04-22', 'Receita para tratamento de diabetes'),
(3, '2017-05-05', 'Receita para tratamento de asma'),
(4, '2018-06-17', 'Receita para tratamento de colesterol alto'),
(5, '2019-07-19', 'Receita para tratamento de gripe'),
(6, '2020-08-25', 'Receita para tratamento de alergia'),
(7, '2021-09-30', 'Receita para tratamento de dor de cabeça'),
(8, '2021-10-05', 'Receita para tratamento de dor nas costas'),
(9, '2021-11-11', 'Receita para tratamento de infecção urinária'),
(10, '2021-12-15', 'Receita para tratamento de ansiedade'),
(11, '2022-01-10', 'Receita para tratamento de hipertensão'),
(12, '2022-02-18', 'Receita para tratamento de diabetes'),
(13, '2022-03-22', 'Receita para tratamento de asma'),
(14, '2022-04-28', 'Receita para tratamento de colesterol alto'),
(15, '2022-05-05', 'Receita para tratamento de gripe'),
(16, '2022-06-10', 'Receita para tratamento de alergia'),
(17, '2022-07-15', 'Receita para tratamento de dor de cabeça'),
(18, '2022-08-20', 'Receita para tratamento de dor nas costas'),
(19, '2022-09-25', 'Receita para tratamento de infecção urinária'),
(20, '2022-10-30', 'Receita para tratamento de ansiedade');

INSERT INTO Medicamento (Nome_medicamento, Quantidade, Instrucoes_uso) VALUES 
('Losartana', 30, 'Tomar um comprimido por dia'),
('Metformina', 60, 'Tomar dois comprimidos por dia'),
('Salbutamol', 1, 'Inalar duas vezes ao dia'),
('Sinvastatina', 30, 'Tomar um comprimido à noite'),
('Paracetamol', 20, 'Tomar um comprimido a cada 6 horas se necessário'),
('Loratadina', 30, 'Tomar um comprimido por dia'),
('Ibuprofeno', 20, 'Tomar um comprimido a cada 8 horas se necessário'),
('Ciclobenzaprina', 30, 'Tomar um comprimido à noite'),
('Nitrofurantoína', 40, 'Tomar um comprimido a cada 6 horas'),
('Clonazepam', 30, 'Tomar um comprimido à noite'),
('Atenolol', 30, 'Tomar um comprimido por dia'),
('Glibenclamida', 60, 'Tomar dois comprimidos por dia'),
('Budesonida', 1, 'Inalar duas vezes ao dia'),
('Atorvastatina', 30, 'Tomar um comprimido à noite'),
('Amoxicilina', 20, 'Tomar um comprimido a cada 8 horas'),
('Cetirizina', 30, 'Tomar um comprimido por dia'),
('Dipirona', 20, 'Tomar um comprimido a cada 6 horas se necessário'),
('Nimesulida', 20, 'Tomar um comprimido a cada 12 horas se necessário'),
('Ciprofloxacino', 40, 'Tomar um comprimido a cada 12 horas'),
('Diazepam', 30, 'Tomar um comprimido à noite');

INSERT INTO Receita_Medicamento (Id_receita, Id_medicamento) VALUES 
(1, 1), 
(1, 11),
(2, 2), 
(2, 12),
(3, 3), 
(3, 13),
(4, 4), 
(4, 14),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9), 
(9, 19),
(10, 10), 
(10, 20),
(11, 1), 
(11, 11),
(12, 2), 
(12, 12),
(13, 3), 
(13, 13),
(14, 4), 
(14, 14),
(15, 5),
(16, 6),
(17, 7),
(18, 8),
(19, 9), 
(19, 19),
(20, 10), 
(20, 20);

INSERT INTO Medico_Especialidade (Id_medico, Id_especialidade) VALUES 
(1, 2),  
(2, 3),  
(4, 4),  
(6, 6),  
(7, 7),  
(9, 1),  
(11, 5); 

INSERT INTO Enfermeiro (Nome_enfermeiro, CPF, CRE) VALUES 
('Marcos Silva', '11122233344', 'CRE11185'),
('Julia Costa', '22233344455', 'CRE27422'),
('Renato Lima', '33344455566', 'CRE39633'),
('Camila Alves', '44455564677', 'CRE41244'),
('Rafael Mendes', '55564677788', 'CRE56355'),
('Bianca Rocha', '66777788899', 'CRE65156'),
('André Souza', '77788899900', 'CRE10777'),
('Sabrina Oliveira', '88899900011', 'CRE95888'),
('Pedro Ribeiro', '99900011122', 'CRE99849'),
('Tatiana Martins', '00011122233', 'CRE12500'),
('Felipe Barros', '12345678901', 'CRE12345'),
('Larissa Gonçalves', '23456789012', 'CRE23456'),
('Thiago Almeida', '34567890123', 'CRE34567'),
('Gustavo Ferreira', '56789012345', 'CRE56789'),
('Carolina Sousa', '67890123456', 'CRE67890'),
('Vitor Castro', '78901234567', 'CRE78901');

INSERT INTO Tipo_de_Quarto (Descricao_tipo_quarto, Valor_diario_tipo_quarto) VALUES
('Apartamento', 300),
('Quarto Duplo', 200),
('Enfermaria', 100);

INSERT INTO Quarto (Numeracao_quarto, Id_tipo_quarto) VALUES
('101', 1), 
('102', 1), 
('201', 2), 
('202', 2), 
('301', 3), 
('302', 3); 

ALTER TABLE medico 
ADD COLUMN Id_convenio INT,
ADD CONSTRAINT fk_medico_convenio FOREIGN KEY (Id_convenio) REFERENCES Convenio(Id_convenio);

INSERT INTO Internacao (Id_paciente, Id_medico, Id_quarto, Data_internacao, Data_prevista_alta, Data_efetiva_alta, Descricao_procedimentos) VALUES
(1, 1, 6, '2015-02-01', '2015-02-10', '2015-02-09', 'Cirurgia de apendicite'),
(2, 2, 5, '2016-03-15', '2016-03-20', '2016-03-20', 'Tratamento de pneumonia'),
(3, 3, 4, '2017-04-10', '2017-04-15', '2017-04-15', 'Tratamento de fratura óssea'),
(4, 4, 3, '2018-05-20', '2018-05-30', '2018-05-30', 'Cirurgia de hérnia'),
(1, 5, 2, '2019-06-01', '2019-06-05', '2019-06-05', 'Tratamento de infecção urinária'),
(2, 6, 1, '2020-07-15', '2020-07-25', '2020-07-25', 'Tratamento de gastrite'),
(5, 7, 6, '2021-08-20', '2021-08-30', '2021-08-30', 'Tratamento de hipertensão'),
(3, 8, 5, '2021-09-01', '2021-09-10', '2021-09-10', 'Tratamento de diabetes'),
(5, 9, 4, '2021-10-10', '2021-10-20', '2021-10-20', 'Tratamento de bronquite');

INSERT INTO Internacao_Enfermeiro (Id_internacao, Id_enfermeiro) VALUES
(19, 17),
(19, 18),
(20, 19),
(20, 20),
(21, 21),
(21, 22),
(22, 23),
(22, 24),
(23, 25),
(23, 26),
(24, 27),
(24, 28),
(25, 29),
(25, 30),
(26, 31),
(26, 32),
(27, 17),
(27, 18);

