USE Hospital;

-- 01. Todos os dados e o valor médio das consultas do ano de 2020 e das que foram feitas sob convênio.
SELECT Consulta.*, 
       (SELECT AVG(valor_consulta)
        FROM Consulta
        WHERE YEAR(data_consulta) = 2020 AND Id_convenio IS NOT NULL) AS valor_medio
FROM Consulta
WHERE YEAR(data_consulta) = 2020 AND Id_convenio IS NOT NULL;

-- 02. Todos os dados das internações que tiveram data de alta maior que a data prevista para a alta.
SELECT * FROM internacao
WHERE Data_efetiva_alta > Data_prevista_alta;

-- 03. Receituário completo da primeira consulta registrada com receituário associado.
SELECT Receita.*
FROM Receita
JOIN Consulta ON Receita.id_consulta = Consulta.id_consulta
ORDER BY Consulta.data_consulta ASC
LIMIT 1;

-- 04. Todos os dados da consulta de maior valor e também da de menor valor (ambas as consultas não foram realizadas sob convênio).
SELECT *
FROM Consulta
WHERE Id_convenio IS NULL
ORDER BY Valor_consulta DESC
LIMIT 1;

SELECT *
FROM Consulta
WHERE Id_convenio IS NULL
ORDER BY Valor_consulta ASC
LIMIT 1;

-- 05. Todos os dados das internações em seus respectivos quartos, calculando o total da internação a partir do valor de diária do quarto e o número de dias entre a entrada e a alta.
SELECT Internacao.*, 
DATEDIFF(Internacao.data_efetiva_alta, Internacao.data_internacao) AS dias_internacao,
(DATEDIFF(Internacao.data_efetiva_alta, Internacao.data_internacao) * Tipo_de_quarto.Valor_diario_tipo_quarto) AS valor_total_internacao
FROM Internacao
JOIN Quarto ON Internacao.Id_quarto = Quarto.Id_quarto
JOIN Tipo_de_Quarto ON Quarto.Id_tipo_quarto = Tipo_de_quarto.Id_tipo_quarto;

-- 06. Data, procedimento e número de quarto de internações em quartos do tipo “apartamento”.
SELECT Internacao.Data_internacao, Internacao.Descricao_procedimentos, Quarto.Numeracao_quarto
FROM Internacao
JOIN Quarto ON Internacao.Id_quarto = Quarto.Id_quarto
JOIN Tipo_de_Quarto ON Quarto.Id_tipo_quarto = Tipo_de_quarto.Id_tipo_quarto
WHERE Tipo_de_Quarto.Descricao_tipo_quarto = 'Apartamento';

-- 07. Nome do paciente, data da consulta e especialidade de todas as consultas em que os pacientes eram menores de 18 anos na data da consulta e cuja especialidade não seja “pediatria”, ordenando por data de realização da consulta.
SELECT Paciente.Nome_paciente, Consulta.Data_consulta, Especialidade.Nome_especialidade
FROM Consulta
JOIN Paciente ON Consulta.Id_paciente = Paciente.Id_paciente
JOIN Especialidade ON Consulta.Id_especialidade = Especialidade.Id_especialidade
WHERE TIMESTAMPDIFF(YEAR, Paciente.Data_nascimento, Consulta.Data_consulta) < 18
AND Especialidade.Nome_especialidade != 'Pediatria'
ORDER BY Consulta.Data_consulta ASC;

-- 08. Nome do paciente, nome do médico, data da internação e procedimentos das internações realizadas por médicos da especialidade “gastroenterologia”, que tenham acontecido em “enfermaria”.
SELECT Paciente.Nome_paciente, Medico.Nome_medico, Internacao.Data_internacao, Internacao.Descricao_procedimentos
FROM Internacao
JOIN Paciente ON Internacao.Id_paciente = Paciente.Id_paciente
JOIN Medico ON Internacao.Id_medico = Medico.Id_medico
JOIN Medico_Especialidade ON Medico.Id_medico = Medico_Especialidade.Id_medico
JOIN Especialidade ON Medico_Especialidade.Id_especialidade = Especialidade.Id_especialidade
JOIN Quarto ON Internacao.Id_quarto = Quarto.Id_quarto
JOIN Tipo_de_Quarto ON Quarto.Id_tipo_quarto = Tipo_de_Quarto.Id_tipo_quarto
WHERE Especialidade.Nome_especialidade = 'Gastrenterologia'
AND Tipo_de_Quarto.Descricao_tipo_quarto = 'Enfermaria';

-- 09. Os nomes dos médicos, seus CRMs e a quantidade de consultas que cada um realizou.
SELECT Medico.Nome_medico, Medico.CRM, COUNT(Consulta.Id_consulta) AS quantidade_consultas
FROM Medico
LEFT JOIN Consulta ON Medico.Id_medico = Consulta.Id_medico
GROUP BY Medico.Nome_medico, Medico.CRM;

-- 10. Todos os médicos que tenham "Gabriel" no nome. 
SELECT Nome_medico
FROM Medico
WHERE Nome_medico LIKE '%Gabriel%';

-- 11. Os nomes, CREs e número de internações de enfermeiros que participaram de mais de uma internação.
SELECT Enfermeiro.Nome_enfermeiro, Enfermeiro.CRE, COUNT(Internacao.Id_internacao) AS quantidade_internacoes
FROM Internacao
LEFT JOIN Internacao_Enfermeiro ON Internacao_Enfermeiro.Id_internacao = Internacao.Id_internacao
LEFT JOIN Enfermeiro ON Internacao_Enfermeiro.Id_enfermeiro = Enfermeiro.Id_enfermeiro
GROUP BY Enfermeiro.Nome_enfermeiro, Enfermeiro.CRE
HAVING COUNT(Internacao.Id_internacao) > 1;

