# 📉 Análise de Turnover em RH | Projeto de People Analytics  

![Python](https://img.shields.io/badge/Python-3.11-blue)
![Pandas](https://img.shields.io/badge/Pandas-2.0-green)
![SQL](https://img.shields.io/badge/SQL-PostgreSQL-orange)
![PowerBI](https://img.shields.io/badge/PowerBI-Dashboard-yellow)
![Status](https://img.shields.io/badge/Status-Concluído-success)

Projeto de análise de dados focado em **identificar fatores de risco de turnover (attrition)** e propor **estratégias baseadas em dados para retenção de talentos**.

---

## 📌 Problema de Negócio  

A rotatividade de funcionários (turnover) é um dos maiores desafios estratégicos de Recursos Humanos, podendo custar entre **6 e 9 meses de salário por funcionário substituído**.  

Este projeto analisa uma empresa de tecnologia com **1.470 funcionários** e uma taxa de turnover de **16,1%**, acima da média do setor (12–13%).  

🎯 **Objetivo:** Identificar fatores de risco e propor estratégias para reduzir o turnover em **30%**, gerando uma economia potencial de **R$ 10,6 milhões por ano**.

---

## 📊 Dataset  

- **Fonte:** IBM HR Analytics Dataset (Kaggle)  
- **Registros:** 1.470 funcionários  
- **Variáveis:** 35 variáveis (idade, salário, satisfação, overtime, desempenho, departamento, etc.)  
- **Tipo:** Dataset sintético baseado em cenários corporativos reais  

---

## 🧠 Abordagem Analítica  

- Análise Exploratória de Dados (EDA)  
- Engenharia de features e segmentação  
- Consultas SQL para KPIs de RH  
- Simulação de impacto financeiro  
- Dashboard executivo no Power BI  

---

## 🔎 Principais Insights  

### 🔥 Overtime é o principal fator de turnover  
- Turnover com overtime: **30,5%**  
- Turnover sem overtime: **10,4%**  
➡ Overtime aumenta o risco de saída em **194%**

---

### 💼 Departamento de Vendas com maior rotatividade  
| Departamento | Taxa de Turnover |
|--------------|------------------|
| Sales | 20,6% |
| HR | 19,0% |
| R&D | 13,8% |

➡ Vendas apresenta **28% mais turnover que a média da empresa**

---

### 💰 Salário impacta diretamente na retenção  
- < R$ 3.000 → 23% de turnover  
- R$ 3.000 – 6.000 → 15%  
- > R$ 10.000 → 8%  
➡ Cada aumento de R$ 1.000 reduz ~2% o risco de saída

---

### 😊 Satisfação no trabalho  
- Satisfação nível 1 → 23% turnover  
- Satisfação nível 4 → 11% turnover  
➡ Diferença de 12 pontos percentuais entre extremos  

---

### ⚠ Segmentação de Risco  

| Nível de Risco | Probabilidade de Turnover |
|----------------|---------------------------|
| Alto (Overtime + Baixa satisfação + Baixo salário) | **85%** |
| Médio (2 fatores de risco) | 42% |
| Baixo (1 fator de risco) | 18% |
| Mínimo | 7% |

---

## 💡 Recomendações de Negócio  

### 1️⃣ Política de Overtime (Alta Prioridade)  
- Limitar overtime a no máximo 10h/mês  
- Redução esperada: **10% no turnover geral**  
- Economia estimada: **R$ 3,6M/ano**

---

### 2️⃣ Estratégia de Ajuste Salarial  
- Aumento de 15% para cargos críticos com baixa remuneração  
- Investimento: R$ 1,2M/ano  
- ROI estimado: **3,75x em redução de custos com turnover**

---

### 3️⃣ Programa de Desenvolvimento em Vendas  
- Mentoria estruturada  
- Plano de carreira  
- Redução de pressão por metas  
- Redução esperada do turnover em Sales: **20,6% → 14%**

---

### 4️⃣ Pesquisa de Satisfação Trimestral  
- Intervenção preventiva de RH  
- Custo estimado: R$ 50k/ano  
- Estratégia de detecção precoce de churn  

---

### 5️⃣ Monitoramento de Risco de Turnover  
- Identificação de ~200 funcionários em alto risco  
- Potencial retenção de até **70% dos casos críticos**

---

## 🛠 Tecnologias Utilizadas  

- **Python:** pandas, numpy, matplotlib, seaborn  
- **SQL:** PostgreSQL  
- **BI:** Power BI  
- **Notebooks:** Jupyter  
- **Versionamento:** Git & GitHub  

---

## 🏗 Estrutura do Projeto  

```bash
Analise-Turnover-RH/
├── data/
│   └── raw/
├── notebooks/
│   ├─── 01_exploracao_inicial.ipynb
│   └─── 02_analise_exploratoria.ipynb
├── sql/
│   └── hr_kpis.sql
├── dashboard/
│   ├── turnover_HR.pbix
│    └── prtinrs/
│       ├── screenshot_overview.png
│       ├── screenshot_analise_detalhada.png
│       ├── screenshot_perfil_risco.png
│       └── view_execuitiva
├── README.md
└── .gitignore

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
- [x] Queries SQL
- [x] Dashboard Power BI
- [x] Apresentação executiva

## 📧 Contato

Para dúvidas ou sugestões: rafael.parra.coelho@hotmail.com
