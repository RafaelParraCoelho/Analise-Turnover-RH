-- ============================================================
-- ANÁLISE DE TURNOVER - RECURSOS HUMANOS
-- ============================================================
-- Autor: Rafael Parra Coelho
-- Data: 2026-02-04
-- Objetivo: Replicar análises exploratórias em SQL
-- Dataset: IBM HR Analytics (1.470 funcionários)
-- ============================================================

-- ============================================================
-- 0. CRIAÇÃO DA TABELA (caso precise importar)
-- ============================================================

CREATE TABLE IF NOT EXISTS employees (
    Age INTEGER,
    Attrition VARCHAR(10),
    BusinessTravel VARCHAR(50),
    DailyRate INTEGER,
    Department VARCHAR(50),
    DistanceFromHome INTEGER,
    Education INTEGER,
    EducationField VARCHAR(50),
    EmployeeCount INTEGER,
    EmployeeNumber INTEGER PRIMARY KEY,
    EnvironmentSatisfaction INTEGER,
    Gender VARCHAR(10),
    HourlyRate INTEGER,
    JobInvolvement INTEGER,
    JobLevel INTEGER,
    JobRole VARCHAR(50),
    JobSatisfaction INTEGER,
    MaritalStatus VARCHAR(20),
    MonthlyIncome INTEGER,
    MonthlyRate INTEGER,
    NumCompaniesWorked INTEGER,
    Over18 VARCHAR(5),
    OverTime VARCHAR(10),
    PercentSalaryHike INTEGER,
    PerformanceRating INTEGER,
    RelationshipSatisfaction INTEGER,
    StandardHours INTEGER,
    StockOptionLevel INTEGER,
    TotalWorkingYears INTEGER,
    TrainingTimesLastYear INTEGER,
    WorkLifeBalance INTEGER,
    YearsAtCompany INTEGER,
    YearsInCurrentRole INTEGER,
    YearsSinceLastPromotion INTEGER,
    YearsWithCurrManager INTEGER
);

-- ============================================================
-- 1. VISÃO GERAL DO DATASET
-- ============================================================

-- 1.1 Total de funcionários e taxa geral de turnover
SELECT 
    COUNT(*) as total_funcionarios,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) as total_saidas,
    ROUND(
        AVG(CASE WHEN Attrition = 'Yes' THEN 1.0 ELSE 0.0 END) * 100, 
        2
    ) as taxa_turnover_pct
FROM employees;

-- 1.2 Distribuição por status
SELECT 
    Attrition,
    COUNT(*) as quantidade,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM employees), 2) as percentual
FROM employees
GROUP BY Attrition
ORDER BY quantidade DESC;

-- ============================================================
-- 2. ANÁLISE POR DEPARTAMENTO
-- ============================================================

-- 2.1 Turnover por departamento
SELECT 
    Department as departamento,
    COUNT(*) as total_funcionarios,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) as saidas,
    ROUND(
        AVG(CASE WHEN Attrition = 'Yes' THEN 1.0 ELSE 0.0 END) * 100, 
        2
    ) as taxa_turnover_pct
FROM employees
GROUP BY Department
ORDER BY taxa_turnover_pct DESC;

-- 2.2 Comparação com média geral
WITH media_geral AS (
    SELECT ROUND(AVG(CASE WHEN Attrition = 'Yes' THEN 1.0 ELSE 0.0 END) * 100, 2) as taxa
    FROM employees
)
SELECT 
    Department as departamento,
    COUNT(*) as total_funcionarios,
    ROUND(AVG(CASE WHEN Attrition = 'Yes' THEN 1.0 ELSE 0.0 END) * 100, 2) as taxa_turnover_pct,
    (SELECT taxa FROM media_geral) as media_geral,
    ROUND(
        (AVG(CASE WHEN Attrition = 'Yes' THEN 1.0 ELSE 0.0 END) * 100) - (SELECT taxa FROM media_geral),
        2
    ) as diferenca_vs_media
FROM employees
GROUP BY Department
ORDER BY taxa_turnover_pct DESC;

-- ============================================================
-- 3. ANÁLISE SALARIAL
-- ============================================================

-- 3.1 Turnover por faixa salarial
SELECT 
    CASE 
        WHEN MonthlyIncome < 3000 THEN '< R$ 3k'
        WHEN MonthlyIncome < 6000 THEN 'R$ 3k-6k'
        WHEN MonthlyIncome < 10000 THEN 'R$ 6k-10k'
        ELSE '> R$ 10k'
    END as faixa_salarial,
    COUNT(*) as total_funcionarios,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) as saidas,
    ROUND(AVG(CASE WHEN Attrition = 'Yes' THEN 1.0 ELSE 0.0 END) * 100, 2) as taxa_turnover_pct,
    ROUND(AVG(MonthlyIncome), 2) as salario_medio
FROM employees
GROUP BY 
    CASE 
        WHEN MonthlyIncome < 3000 THEN '< R$ 3k'
        WHEN MonthlyIncome < 6000 THEN 'R$ 3k-6k'
        WHEN MonthlyIncome < 10000 THEN 'R$ 6k-10k'
        ELSE '> R$ 10k'
    END
ORDER BY salario_medio;

-- 3.2 Estatísticas salariais por status de attrition
SELECT 
    Attrition,
    COUNT(*) as quantidade,
    ROUND(MIN(MonthlyIncome), 2) as salario_minimo,
    ROUND(AVG(MonthlyIncome), 2) as salario_medio,
    ROUND(MAX(MonthlyIncome), 2) as salario_maximo,
    ROUND(
        (MAX(MonthlyIncome) - MIN(MonthlyIncome)) / 4.0, 
        2
    ) as amplitude_interquartil
FROM employees
GROUP BY Attrition;

-- ============================================================
-- 4. ANÁLISE DE SATISFAÇÃO E OVERTIME
-- ============================================================

-- 4.1 Turnover por nível de satisfação
SELECT 
    JobSatisfaction as nivel_satisfacao,
    COUNT(*) as total_funcionarios,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) as saidas,
    ROUND(AVG(CASE WHEN Attrition = 'Yes' THEN 1.0 ELSE 0.0 END) * 100, 2) as taxa_turnover_pct
FROM employees
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction;

-- 4.2 Turnover por overtime
SELECT 
    OverTime as overtime,
    COUNT(*) as total_funcionarios,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) as saidas,
    ROUND(AVG(CASE WHEN Attrition = 'Yes' THEN 1.0 ELSE 0.0 END) * 100, 2) as taxa_turnover_pct
FROM employees
GROUP BY OverTime
ORDER BY taxa_turnover_pct DESC;

-- 4.3 Combinação crítica: Overtime x Satisfação
SELECT 
    OverTime,
    JobSatisfaction,
    COUNT(*) as total_funcionarios,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) as saidas,
    ROUND(AVG(CASE WHEN Attrition = 'Yes' THEN 1.0 ELSE 0.0 END) * 100, 2) as taxa_turnover_pct
FROM employees
GROUP BY OverTime, JobSatisfaction
ORDER BY taxa_turnover_pct DESC
LIMIT 10;

-- ============================================================
-- 5. PERFIL DE RISCO
-- ============================================================

-- 5.1 Calcular score de risco e classificar
WITH risk_score AS (
    SELECT 
        EmployeeNumber,
        Attrition,
        Department,
        JobSatisfaction,
        MonthlyIncome,
        OverTime,
        (CASE WHEN OverTime = 'Yes' THEN 40 ELSE 0 END) +
        (CASE WHEN JobSatisfaction <= 2 THEN 30 ELSE 0 END) +
        (CASE WHEN MonthlyIncome < 4000 THEN 20 ELSE 0 END) +
        (CASE WHEN Department = 'Sales' THEN 10 ELSE 0 END) as score
    FROM employees
),
risk_classification AS (
    SELECT 
        *,
        CASE 
            WHEN score >= 70 THEN 'Risco Altíssimo'
            WHEN score >= 50 THEN 'Risco Alto'
            WHEN score >= 30 THEN 'Risco Médio'
            ELSE 'Risco Baixo'
        END as perfil_risco
    FROM risk_score
)
SELECT 
    perfil_risco,
    COUNT(*) as total_funcionarios,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) as saidas,
    ROUND(AVG(CASE WHEN Attrition = 'Yes' THEN 1.0 ELSE 0.0 END) * 100, 2) as taxa_turnover_pct
FROM risk_classification
GROUP BY perfil_risco
ORDER BY 
    CASE perfil_risco
        WHEN 'Risco Baixo' THEN 1
        WHEN 'Risco Médio' THEN 2
        WHEN 'Risco Alto' THEN 3
        WHEN 'Risco Altíssimo' THEN 4
    END;

-- 5.2 Listar funcionários em risco altíssimo (AÇÃO URGENTE)
WITH risk_score AS (
    SELECT 
        EmployeeNumber,
        Age,
        Department,
        JobRole,
        JobSatisfaction,
        MonthlyIncome,
        OverTime,
        YearsAtCompany,
        Attrition,
        (CASE WHEN OverTime = 'Yes' THEN 40 ELSE 0 END) +
        (CASE WHEN JobSatisfaction <= 2 THEN 30 ELSE 0 END) +
        (CASE WHEN MonthlyIncome < 4000 THEN 20 ELSE 0 END) +
        (CASE WHEN Department = 'Sales' THEN 10 ELSE 0 END) as score
    FROM employees
)
SELECT 
    EmployeeNumber,
    Age,
    Department,
    JobRole,
    MonthlyIncome,
    JobSatisfaction,
    OverTime,
    YearsAtCompany,
    score,
    'RISCO ALTÍSSIMO' as alerta
FROM risk_score
WHERE score >= 70 AND Attrition = 'No'  -- Apenas funcionários ativos
ORDER BY score DESC, MonthlyIncome ASC;

-- ============================================================
-- 6. CUSTO DO TURNOVER
-- ============================================================

-- 6.1 Custo estimado por departamento
WITH turnover_stats AS (
    SELECT 
        Department,
        COUNT(*) as total_funcionarios,
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) as qtd_saidas,
        ROUND(AVG(MonthlyIncome), 2) as salario_medio
    FROM employees
    GROUP BY Department
)
SELECT 
    Department,
    total_funcionarios,
    qtd_saidas,
    salario_medio,
    ROUND(salario_medio * 6 * qtd_saidas, 2) as custo_estimado_turnover_anual
    -- Custo = 6 meses de salário (recrutamento + treinamento + perda produtividade)
FROM turnover_stats
ORDER BY custo_estimado_turnover_anual DESC;

-- 6.2 Custo total da empresa
SELECT 
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) as total_saidas,
    ROUND(AVG(MonthlyIncome), 2) as salario_medio_saidas,
    ROUND(
        AVG(MonthlyIncome) * 6 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END),
        2
    ) as custo_total_estimado
FROM employees
WHERE Attrition = 'Yes';

-- ============================================================
-- 7. ANÁLISES COMPLEMENTARES
-- ============================================================

-- 7.1 Turnover por tempo de empresa
SELECT 
    CASE 
        WHEN YearsAtCompany < 2 THEN '< 2 anos'
        WHEN YearsAtCompany < 5 THEN '2-5 anos'
        WHEN YearsAtCompany < 10 THEN '5-10 anos'
        ELSE '> 10 anos'
    END as tempo_empresa,
    COUNT(*) as total_funcionarios,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) as saidas,
    ROUND(AVG(CASE WHEN Attrition = 'Yes' THEN 1.0 ELSE 0.0 END) * 100, 2) as taxa_turnover_pct
FROM employees
GROUP BY 
    CASE 
        WHEN YearsAtCompany < 2 THEN '< 2 anos'
        WHEN YearsAtCompany < 5 THEN '2-5 anos'
        WHEN YearsAtCompany < 10 THEN '5-10 anos'
        ELSE '> 10 anos'
    END
ORDER BY taxa_turnover_pct DESC;

-- 7.2 Turnover por idade
SELECT 
    CASE 
        WHEN Age < 25 THEN '< 25 anos'
        WHEN Age < 35 THEN '25-35 anos'
        WHEN Age < 45 THEN '35-45 anos'
        ELSE '> 45 anos'
    END as faixa_etaria,
    COUNT(*) as total_funcionarios,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) as saidas,
    ROUND(AVG(CASE WHEN Attrition = 'Yes' THEN 1.0 ELSE 0.0 END) * 100, 2) as taxa_turnover_pct,
    ROUND(AVG(Age), 1) as idade_media
FROM employees
GROUP BY 
    CASE 
        WHEN Age < 25 THEN '< 25 anos'
        WHEN Age < 35 THEN '25-35 anos'
        WHEN Age < 45 THEN '35-45 anos'
        ELSE '> 45 anos'
    END
ORDER BY idade_media;

-- 7.3 Top 10 cargos com maior turnover
SELECT 
    JobRole as cargo,
    COUNT(*) as total_funcionarios,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) as saidas,
    ROUND(AVG(CASE WHEN Attrition = 'Yes' THEN 1.0 ELSE 0.0 END) * 100, 2) as taxa_turnover_pct
FROM employees
GROUP BY JobRole
HAVING COUNT(*) >= 10  -- Apenas cargos com amostra significativa
ORDER BY taxa_turnover_pct DESC
LIMIT 10;

-- ============================================================
-- FIM DAS QUERIES
-- ============================================================