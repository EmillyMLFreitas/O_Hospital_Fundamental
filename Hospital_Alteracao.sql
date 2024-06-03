USE Hospital;

ALTER TABLE Medico 
ADD COLUMN em_atividade BOOLEAN DEFAULT true;

UPDATE Medico
SET em_atividade = false
WHERE Id_medico IN (1,5);

UPDATE Medico
SET em_atividade = true
WHERE Id_medico NOT IN (1,5);

SELECT Id_medico, Nome_medico, em_atividade FROM MEDICO;
