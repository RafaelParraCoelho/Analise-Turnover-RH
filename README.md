# 📊 Análise de Turnover - Recursos Humanos

![Python](https://img.shields.io/badge/Python-3.11-blue)
![Pandas](https://img.shields.io/badge/Pandas-2.0-green)
![Status](https://img.shields.io/badge/Status-Em%20Desenvolvimento-yellow)

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

## 🛠️ Tecnologias Utilizadas

- **Python 3.11+**
  - pandas (manipulação de dados)
  - matplotlib / seaborn (visualização)
  - numpy (computação numérica)
- **SQL** (PostgreSQL)
- **Power BI** (dashboards)
- **Jupyter Notebook** (análise exploratória)

## 📁 Estrutura do Projeto
```
Analise-Turnover-RH/
├── data/
│   └── raw/              # Dados brutos
├── notebooks/
│   └── 01_exploracao_inicial.ipynb
├── sql/                  # Queries SQL (em desenvolvimento)
├── dashboard/            # Dashboards Power BI (em desenvolvimento)
├── .gitignore
└── README.md
```

## 🚀 Como Executar

1. Clone o repositório:
```bash
git clone https://github.com/RafaelParraCoelho/Analise-Turnover-RH.git
cd Analise-Turnover-RH
```

2. Instale as dependências:
```bash
pip install pandas matplotlib seaborn jupyter
```

3. Baixe o dataset do [Kaggle](https://www.kaggle.com/datasets/pavansubhasht/ibm-hr-analytics-attrition-dataset) e coloque em `data/raw/`

4. Execute o notebook:
```bash
jupyter notebook notebooks/01_exploracao_inicial.ipynb
```

## 👤 Autor

**Rafael Parra Coelho**

[![LinkedIn](https://img.shields.io/badge/LinkedIn-blue?style=flat&logo=linkedin)](https://www.linkedin.com/in/rafael-parra-coelho/)
[![GitHub](https://img.shields.io/badge/GitHub-black?style=flat&logo=github)](https://github.com/RafaelParraCoelho)
[![Portfolio](https://img.shields.io/badge/Portfolio-green?style=flat)](https://rafaelparracoelho.github.io/rafaelparra.github.io/)

## 📝 Status do Projeto

- [x] Exploração inicial dos dados
- [ ] Análise exploratória completa
- [ ] Queries SQL
- [ ] Dashboard Power BI
- [ ] Recomendações finais

## 📧 Contato

Para dúvidas ou sugestões: rparracoelho@gmail.com
