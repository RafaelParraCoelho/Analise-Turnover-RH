# 📊 Análise de Turnover - Recursos Humanos

## 🎯 Contexto de Negócio

**Attrition (rotatividade de funcionários)** é um dos maiores desafios 
de RH, custando em média 6-9 meses de salário por funcionário substituído.

Esta empresa de tecnologia enfrenta taxa de attrition de 16.1%, 
acima da média da indústria (12-13%). Com 1.470 funcionários, 
isso representa ~237 saídas anuais.

**Impacto financeiro estimado:**
- Custo médio por substituição: R$ 150.000
- Total anual: R$ 35,5 milhões em custos de attrition

**Objetivo:** Identificar fatores de risco e recomendar ações para 
reduzir attrition em 30%, economizando R$ 10,6M/ano.

## 📂 Dataset

- **Nota:** O arquivo CSV não está incluído no repositório (>100MB).
- Você pode baixá-lo em: [IBM HR Analytics - Kaggle](https://www.kaggle.com/datasets/pavansubhasht/ibm-hr-analytics-attrition-dataset)
- **Fonte:** IBM HR Analytics (Kaggle)
- **Registros:** 1.470 funcionários
- **Variáveis:** 35 (idade, salário, departamento, satisfação, overtime, etc.)
- **Período:** Dados simulados baseados em casos reais

## 🔍 Primeiras Observações

- Taxa geral de attrition: **16.1%** (~237 saídas de 1.470 funcionários)
- Dataset balanceado: 1.233 funcionários ativos vs 237 que saíram
- Variáveis principais: Age, MonthlyIncome, Department, JobSatisfaction, OverTime
- Sem valores nulos (dados já limpos)
- Distribuição: Sales (446), R&D (961), HR (63)
