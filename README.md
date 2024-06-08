# 🏥 O Hospital Fundamental
Sistema de Gestão Hospitalar

## 📄 Sobre o Projeto
Este projeto visa criar um sistema de banco de dados para um pequeno hospital local, substituindo o uso atual de planilhas e arquivos físicos. Será feita uma análise das necessidades do hospital para sugerir uma estrutura de banco de dados eficiente, facilitando a gestão de pacientes, médicos, prontuários, agendamentos e outros aspectos fundamentais.

> ### Parte 1
> **Modelo Conceitual**

## 📊 Entidades
Aqui estão as entidades principais do sistema:

- 🩺 **Médico**
- 🏷️ **Especialidade**
- 👥 **Paciente**
- 📑 **Convênio**
- 📅 **Consulta**
- 💊 **Receita**
- 💉 **Medicamento**

## 🔗 Relacionamentos
Os principais relacionamentos entre as entidades são:

- **Médico - Especialidade**: Um médico pode ter uma ou mais especialidades, e uma especialidade pode ser associada a muitos médicos.
- **Paciente - Convênio**: Um paciente pode ter um convênio, e um convênio pode ser associado a muitos pacientes.
- **Consulta - Médico - Paciente**: Uma consulta é realizada por um médico para um paciente.
- **Consulta - Receita**: Uma consulta pode ter uma receita associada.
- **Receita - Medicamento**: Uma receita pode incluir um ou mais medicamentos, e um medicamento pode estar presente em muitas receitas.

## 🌐 Diagrama Entidade-Relacionamento
![Hospital_ModelagemConceitual](Hospital_ModelagemConceitual.jpg)


> ### Parte 2
> **Atualização do Diagrama** <br/>
> **Modelo Lógico**

## 📊 Entidades Atualizadas
Aqui estão as entidades atualizadas do sistema:

- 🛏️ **Internação**
- 🏨 **Quarto**
- 🛏️ **Tipo de Quarto**
- 👩‍⚕️ **Enfermeiro**

## 🔗 Relacionamentos Atualizados
Os relacionamentos atualizados entre as entidades são:

- **Internação - Paciente**: Um paciente pode ter múltiplas internações.
- **Internação - Médico**: Uma internação é vinculada a um único médico responsável.
- **Internação - Quarto**: Uma internação é vinculada a um quarto.
- **Quarto - Tipo de Quarto**: Um quarto pertence a um tipo de quarto.
- **Internação - Enfermeiro**: Vários enfermeiros podem estar responsáveis por uma internação.

## 🌐 Diagrama Entidade-Relacionamento Atualizado
![Hospital_ModelagemConceitual_Atualizado](Hospital_ModelagemConceitual_Atualizado.jpg)

## 🌐 Modelo Lógico
![Hospital_ModelagemLogica](Hospital_Modelagem_Logica.png)


> ### Parte 3
> **Alimentação do Database** <br/>
> **Modelo Físico** 

## 🌐 Modelo Físico
Nesta etapa, foram desenvolvidos scripts SQL para criar e povoar as tabelas do banco de dados do Hospital Fundamental, de acordo com o modelo lógico.

## 🥼 Criação do Banco de Dados 
Exemplo da criação da Tabela Espcialidade:

```sql
CREATE TABLE IF NOT EXISTS Especialidade (
    Id_especialidade INT AUTO_INCREMENT PRIMARY KEY,
    Nome_especialidade VARCHAR(255)
);
```
🔗 [Hospital.sql](https://github.com/EmillyMLFreitas/O_Hospital_Fundamental/blob/main/Hospital.sql)

## 🧑🏽‍⚕ Povoamento do Banco de Dados 
Exemplo da inserção de dados na Tabela Espcialidade:

```sql
INSERT INTO especialidade (Nome_especialidade) VALUES 
('Pediatria'),
('Clínica Geral'),
('Gastrenterologia'),
('Dermatologia'),
('Cardiologia'),
('Neurologia'),
('Oftalmologia');
```
🔗 [Hospital_Povoamento.sql](https://github.com/EmillyMLFreitas/O_Hospital_Fundamental/blob/main/Hospital_Povoamento.sql)

> ### Parte 4
> **Alterando o banco de dados**

## 🛠️ Alterações e Atualizações
Nesta parte, realizamos modificações no banco de dados existente para aprimorar o sistema do Hospital Fundamental.

## 🔄 Adição da Coluna "em_atividade"
Adicionada uma coluna "em_atividade" à tabela Medico, indicando se o médico está atuando ou não no hospital.

```sql
ALTER TABLE Medico 
ADD COLUMN em_atividade BOOLEAN DEFAULT true;
```

## 📝 Atualização do Status dos Médicos
Atualizados pelo menos dois médicos como inativos e os demais como ativos.

```sql
UPDATE Medico
SET em_atividade = false
WHERE Id_medico IN (1,5);
```

```sql
UPDATE Medico
SET em_atividade = true
WHERE Id_medico NOT IN (1,5);
```

🔗 [Hospital_Alteracao.sql](https://github.com/EmillyMLFreitas/O_Hospital_Fundamental/blob/main/Hospital_Alteracao.sql)

> ## Parte 5
> **Testes e Consultas**

## 🔍 Consultas
Nessa parte, exploramos o banco de dados com consultas SQL, extraindo informações cruciais e gerando relatórios para melhorar a administração hospitalar.

🔗 [Hospital_Consultas.sql](https://github.com/EmillyMLFreitas/O_Hospital_Fundamental/blob/main/Hospital_Consultas.sql)

## 🕵🏽‍♀️Consultas Realizadas

1. 📅 Todos os Dados e Valor Médio das Consultas de 2020 com Convênio
```sql
SELECT Consulta.*, 
    (SELECT AVG(valor_consulta)
    FROM Consulta
    WHERE YEAR(data_consulta) = 2020 AND Id_convenio IS NOT NULL) AS valor_medio
FROM Consulta
WHERE YEAR(data_consulta) = 2020 AND Id_convenio IS NOT NULL;
```

 **Resultados:**

| Id_consulta | Data_consulta | Hora_consulta | Id_medico | Id_paciente | Valor_consulta | Id_especialidade | Id_convenio | valor_medio |
|-------------|---------------|---------------|-----------|-------------|----------------|------------------|-------------|-------------|
| 5           | 2020-07-19    | 13:30:00      | 5         | 5           | 180            | 6                | 5           | 185.0000    |
| 6           | 2020-08-25    | 15:15:00      | 6         | 6           | 190            | 7                | 5           | 185.0000    |


2. 🏥 Internações com Data de Alta Maior que a Data Prevista
```sql
SELECT *
FROM internacao
WHERE Data_efetiva_alta > Data_prevista_alta;
```
| Id_internacao | Id_paciente | Id_medico | Id_quarto | Data_internacao | Data_prevista_alta | Data_efetiva_alta | Descricao_procedimentos      |
|---------------|-------------|-----------|-----------|-----------------|--------------------|-------------------|-----------------------------|
| 21            | 3           | 3         | 4         | 2017-04-10      | 2017-04-15         | 2017-06-15        | Tratamento de fratura óssea |
| 27            | 5           | 9         | 4         | 2021-10-10      | 2021-10-20         | 2021-11-20        | Tratamento de bronquite     |


3. 💊 Receituário Completo da Primeira Consulta Registrada
```sql
SELECT Receita.*
FROM Receita
JOIN Consulta ON Receita.id_consulta = Consulta.id_consulta
ORDER BY Consulta.data_consulta ASC
LIMIT 1;
```
**Resultados:**

| Id_receita | Id_consulta | Data_receita | Descricao_receita                  |
|------------|-------------|--------------|------------------------------------|
| 1          | 1           | 2015-02-15   | Receita para tratamento de hipertensão |


4. 💰 Consultas de Maior e Menor Valor sem Convênio
```sql
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
```

**Resultados (Maior Valor):**

| Id_consulta | Data_consulta | Hora_consulta | Id_medico | Id_paciente | Valor_consulta | Id_especialidade | Id_convenio |
|-------------|---------------|---------------|-----------|-------------|----------------|------------------|-------------|
| 20          | 2022-10-30    | 09:00:00      | 10        | 5           | 350            | 7                | NULL        |

**Resultados (Menor Valor):**
    
| Id_consulta | Data_consulta | Hora_consulta | Id_medico | Id_paciente | Valor_consulta | Id_especialidade | Id_convenio |
|-------------|---------------|---------------|-----------|-------------|----------------|------------------|-------------|
| 21          | 2023-01-15    | 10:00:00      | 1         | 16          | 150            | 2                | NULL        |

    
5. 🛏️ Internações e Valor Total Calculado
```sql
SELECT Internacao.*, 
DATEDIFF(Internacao.data_efetiva_alta, Internacao.data_internacao) AS dias_internacao,
(DATEDIFF(Internacao.data_efetiva_alta, Internacao.data_internacao) * Tipo_de_quarto.Valor_diario_tipo_quarto) AS valor_total_internacao
FROM Internacao
JOIN Quarto ON Internacao.Id_quarto = Quarto.Id_quarto
JOIN Tipo_de_Quarto ON Quarto.Id_tipo_quarto = Tipo_de_quarto.Id_tipo_quarto;
```

**Resultados:**
| Id_internacao | Id_paciente | Id_medico | Id_quarto | Data_internacao | Data_prevista_alta | Data_efetiva_alta | Descricao_procedimentos      | dias_internacao | valor_total_internacao |
|---------------|-------------|-----------|-----------|-----------------|--------------------|-------------------|-----------------------------|-----------------|-----------------------|
| 23            | 1           | 5         | 2         | 2019-06-01      | 2019-06-05         | 2019-06-05        | Tratamento de infecção urinária | 4               | 1200                  |
| 24            | 2           | 6         | 1         | 2020-07-15      | 2020-07-25         | 2020-07-25        | Tratamento de gastrite       | 10              | 3000                  |
| 21            | 3           | 3         | 4         | 2017-04-10      | 2017-04-15         | 2017-06-15        | Tratamento de fratura óssea | 66              | 13200                 |
| 27            | 5           | 9         | 4         | 2021-10-10      | 2021-10-20         | 2021-11-20        | Tratamento de bronquite     | 41              | 8200                  |
| 22            | 4           | 4         | 3         | 2018-05-20      | 2018-05-30         | 2018-05-30        | Cirurgia de hérnia          | 10              | 2000                  |
| 19            | 1           | 1         | 6         | 2015-02-01      | 2015-02-10         | 2015-02-09        | Cirurgia de apendicite      | 8               | 800                   |
| 25            | 5           | 7         | 6         | 2021-08-20      | 2021-08-30         | 2021-08-30        | Tratamento de hipertensão   | 10              | 1000                  |
| 20            | 2           | 2         | 5         | 2016-03-15      | 2016-03-20         | 2016-03-20        | Tratamento de pneumonia     | 5               | 500                   |
| 26            | 3           | 8         | 5         | 2021-09-01      | 2021-09-10         | 2021-09-10        | Tratamento de diabetes      | 9               | 900                   |


6. 🏨 Internações em Quartos do Tipo "Apartamento"
```sql
SELECT Internacao.Data_internacao, Internacao.Descricao_procedimentos, Quarto.Numeracao_quarto
FROM Internacao
JOIN Quarto ON Internacao.Id_quarto = Quarto.Id_quarto
JOIN Tipo_de_Quarto ON Quarto.Id_tipo_quarto = Tipo_de_quarto.Id_tipo_quarto
WHERE Tipo_de_Quarto.Descricao_tipo_quarto = 'Apartamento';
```

**Resultados:**
| Data_internacao | Descricao_procedimentos      | Numeracao_quarto |
|-----------------|-----------------------------|------------------|
| 2020-07-15      | Tratamento de gastrite       | 101              |
| 2019-06-01      | Tratamento de infecção urinária | 102              |


7. 👶 Consultas de Pacientes Menores de 18 Anos em Especialidades Não Pediátricas
```sql
SELECT Paciente.Nome_paciente, Consulta.Data_consulta, Especialidade.Nome_especialidade
FROM Consulta
JOIN Paciente ON Consulta.Id_paciente = Paciente.Id_paciente
JOIN Especialidade ON Consulta.Id_especialidade = Especialidade.Id_especialidade
WHERE TIMESTAMPDIFF(YEAR, Paciente.Data_nascimento, Consulta.Data_consulta) < 18
AND Especialidade.Nome_especialidade != 'Pediatria'
ORDER BY Consulta.Data_consulta ASC;
```

**Resultados:**
| Nome_paciente   | Data_consulta | Nome_especialidade |
|-----------------|---------------|--------------------|
| Paulo Lima      | 2023-01-15    | Clínica Geral      |
| Maya Santos     | 2023-02-20    | Gastrenterologia   |
| Enzo Oliveira   | 2023-03-25    | Dermatologia       |
| Amélia Costa    | 2023-04-30    | Cardiologia        |
| Gabriel Azevedo | 2023-05-15    | Neurologia         |


8. 🩺 Internações Realizadas por Médicos da Especialidade "Gastroenterologia" em "Enfermaria"
```sql
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
```

**Resultados:**
| Nome_paciente | Nome_medico     | Data_internacao | Descricao_procedimentos |
|---------------|-----------------|-----------------|-------------------------|
| Bruno Silva   | Dr. Maria Santos | 2016-03-15      | Tratamento de pneumonia |


9. 🔢 Quantidade de Consultas Realizadas por Cada Médico
```sql
SELECT Medico.Nome_medico, Medico.CRM, COUNT(Consulta.Id_consulta) AS quantidade_consultas
FROM Medico
LEFT JOIN Consulta ON Medico.Id_medico = Consulta.Id_medico
GROUP BY Medico.Nome_medico, Medico.CRM;
```

**Resultados:**
| Nome_medico           | CRM     | quantidade_consultas |
|-----------------------|---------|----------------------|
| Dr. João Silva        | CRM12345 | 3                    |
| Dr. Maria Santos      | CRM54321 | 3                    |
| Dr. José Oliveira     | CRM67890 | 3                    |
| Dr. Ana Rodrigues     | CRM09876 | 3                    |
| Dr. Carlos Martins    | CRM45678 | 3                    |
| Dra. Laura Ferreira   | CRM65432 | 2                    |
| Dr. Paulo Mendes      | CRM23456 | 2                    |
| Dra. Fernanda Almeida | CRM78901 | 2                    |
| Dr. Ricardo Pereira   | CRM34567 | 2                    |
| Dra. Juliana Costa    | CRM01234 | 2                    |
| Dr. Marcos Oliveira   | CRM98765 | 0                    |
| Dr. Pedro Silva       | CRM58921 | 0                    |
| Dr. Gabriel Costa     | CRM11223 | 0                    |
| Dra. Gabriela Silva   | CRM22334 | 0                    |
| Dr. Gabriel Augusto   | CRM33445 | 0                    |
| Dra. Gabrielly Rodrigues | CRM88990 | 0                  |


10. 👨‍⚕️ Médicos com "Gabriel" no Nome
```sql
SELECT Nome_medico
FROM Medico
WHERE Nome_medico LIKE '%Gabriel%';
```

**Resultados:**
| Nome_medico           |
|-----------------------|
| Dr. Gabriel Costa     |
| Dra. Gabriela Silva   |
| Dr. Gabriel Augusto   |
| Dra. Gabrielly Rodrigues |


11. 🏥 Enfermeiros com Mais de Uma Internação
```sql
SELECT Enfermeiro.Nome_enfermeiro, Enfermeiro.CRE, COUNT(Internacao.Id_internacao) AS quantidade_internacoes
FROM Internacao
LEFT JOIN Internacao_Enfermeiro ON Internacao_Enfermeiro.Id_internacao = Internacao.Id_internacao
LEFT JOIN Enfermeiro ON Internacao_Enfermeiro.Id_enfermeiro = Enfermeiro.Id_enfermeiro
GROUP BY Enfermeiro.Nome_enfermeiro, Enfermeiro.CRE
HAVING COUNT(Internacao.Id_internacao) > 1;
```

**Resultados:**
| Nome_enfermeiro | CRE     | quantidade_internacoes |
|------------------|---------|------------------------|
| Julia Costa      | CRE27422 | 2                      |
| Marcos Silva     | CRE11185 | 2                      |
