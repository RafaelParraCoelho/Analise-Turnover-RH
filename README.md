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

### 1. Overtime é o Maior Vilão (Impacto: +194% turnover)
- Funcionários **com overtime**: **30.5%** de turnover
- Funcionários **sem overtime**: **10.4%** de turnover
- **Causa:** Burnout e desbalanceamento vida-trabalho
- **Impacto:** Overtime aumenta risco de saída em 194%

### 2. Departamento de Vendas em Crise (Impacto: +28% vs média)
- **Sales:** 20.6% turnover
- **HR:** 19.0% turnover
- **R&D:** 13.8% turnover
- **Causa:** Pressão por metas + baixa satisfação
- **Impacto:** Sales tem 28% mais saídas que a média

### 3. Salário Baixo = Risco Alto
- Salário **<R$ 3.000**: 23% turnover
- Salário **R$ 3k-6k**: 15% turnover
- Salário **>R$ 10.000**: 8% turnover
- **Insight:** Cada R$ 1.000 a mais reduz ~2% o risco de saída

### 4. Satisfação no Trabalho é Crítica
- **Satisfação 1** (baixa): 23% turnover
- **Satisfação 2**: 18% turnover
- **Satisfação 3**: 15% turnover
- **Satisfação 4** (alta): 11% turnover
- **Diferença:** 12 pontos percentuais entre extremos

### 5. Perfil de Risco Identificado
- **Risco Altíssimo** (Overtime + Baixa satisfação + Salário <R$ 5k): **85%** turnover
- **Risco Alto** (2 dos 3 fatores): **42%** turnover
- **Risco Médio** (1 fator): **18%** turnover
- **Risco Baixo** (nenhum fator): **7%** turnover

## 💡 Recomendações

### 1️⃣ POLÍTICA DE OVERTIME (Prioridade: URGENTE)
**Ação:** Limitar overtime a máximo 10h/mês
- **Impacto esperado:** Redução de 10% no turnover geral
- **ROI:** Economia de R$ 3,6M/ano

### 2️⃣ AJUSTE SALARIAL CARGOS CRÍTICOS (Prioridade: ALTA)
**Ação:** Aumento de 15% para cargos com salário <R$ 4.000
- **Investimento:** R$ 1,2M/ano
- **ROI:** Economia de R$ 4,5M em turnover (retorno de 3.75x)

### 3️⃣ PROGRAMA DESENVOLVIMENTO VENDAS (Prioridade: ALTA)
**Ação:** 
- Mentoria estruturada
- Plano de carreira claro
- Redução de pressão por metas
- **Impacto esperado:** Reduzir turnover Sales de 20.6% para 14%
- **ROI:** R$ 2,1M/ano

### 4️⃣ PESQUISA SATISFAÇÃO TRIMESTRAL (Prioridade: MÉDIA)
**Ação:** Implementar pulso de clima a cada 3 meses
- **Objetivo:** Identificar insatisfação antes que vire turnover
- **Custo:** R$ 50k/ano
- **Benefício:** Intervenção preventiva

### 5️⃣ PROGRAMA DE IDENTIFICAÇÃO DE RISCO (Prioridade: ALTA)
**Ação:** Monitorar funcionários em perfil de Risco Alto/Altíssimo
- **Impacto:** Intervenção em ~200 funcionários em risco
- **ROI:** Salvar até 70% dos funcionários em risco altíssimo

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
- [x] Análise exploratória completa
- [x] Identificação de insights principais
- [x] Cálculo de impacto financeiro
- [ ] Queries SQL
- [ ] Dashboard Power BI
- [ ] Apresentação executiva

## 📧 Contato

Para dúvidas ou sugestões: rparracoelho@gmail.com
