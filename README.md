# RELATÓRIO OPERACIONAL DE PRÉ-DECOLAGEM

Sistema de análise de telemetria para apoio à decisão em um cenário simulado de pré-operação de decolagem.

> Projeto desenvolvido como Atividade Integradora da FIAP.

---

## Sobre o projeto

Este projeto simula a análise de dados de telemetria em um contexto pré-operacional de decolagem, com foco em organização dos dados, análise energética, identificação de anomalias e apoio à tomada de decisão.

A partir dos dados de telemetria, o sistema:

1. Organiza e descreve os dados operacionais  
2. Classifica cada registro em três níveis de risco: **Normal**, **Atenção** ou **Crítico**  
3. Calcula a autonomia energética estimada  
4. Identifica possíveis anomalias operacionais  
5. Gera uma sugestão de ação com base na classificação de risco  
6. Explica o motivo do risco identificado  
7. Calcula um índice de prontidão operacional  
8. Gera um parecer final sobre a aptidão do sistema para operação  
9. Apresenta uma reflexão crítica sobre ética, impacto social e sustentabilidade tecnológica  

Como diferencial, o projeto não apenas classifica os dados, mas também apresenta justificativas para o risco encontrado, um índice de prontidão e uma recomendação operacional final.

---

## Estrutura do repositório

```text
RELATORIO-OPERACIONAL-DE-PRE-DECOLAGEM/
├── data/
│   └── telemetria.csv
├── docs/
├── imagens/
│   └── prints_execucao.png
├── notebook/
│   └── analise_telemetria.ipynb
├── src/
│   └── utils.py
├── README.md
└── requirements.txt
```

### Descrição dos arquivos

- `data/telemetria.csv` — base de dados sintética de telemetria  
- `notebook/analise_telemetria.ipynb` — notebook principal com código, análises e resultados  
- `src/utils.py` — funções auxiliares para classificação, autonomia, anomalias e prontidão  
- `imagens/` — prints e gráficos utilizados na documentação  
- `requirements.txt` — dependências necessárias para executar o projeto  

---

## Prints da execução

### Leitura e análise da base
![Leitura da base](imagens/prints_execucao.png)

### Gráficos e resultados
Adicione aqui outros prints do notebook, como:
- classificação de risco  
- autonomia estimada  
- índice de prontidão  
- parecer final  

---

## Como executar

### Opção 1 — Jupyter Notebook

1. Clone o repositório:

```bash
git clone https://github.com/QTAlox/RELATORIO-OPERACIONAL-DE-PRE-DECOLAGEM.git
cd RELATORIO-OPERACIONAL-DE-PRE-DECOLAGEM
```

2. Crie um ambiente virtual (opcional, mas recomendado):

```bash
python -m venv venv
```

3. Ative o ambiente:

```bash
venv\Scripts\activate
```

4. Instale as dependências:

```bash
pip install -r requirements.txt
```

5. Abra o notebook:

```bash
jupyter notebook notebook/analise_telemetria.ipynb
```

### Opção 2 — VS Code

1. Abra a pasta do projeto no VS Code  
2. Instale as extensões **Python** e **Jupyter**  
3. Selecione o interpretador Python correto  
4. Abra o arquivo `notebook/analise_telemetria.ipynb`  
5. Execute as células em sequência  

---

## Tecnologias utilizadas

| Tecnologia | Uso no projeto |
|---|---|
| Python 3 | Linguagem principal |
| Pandas | Manipulação e análise de dados |
| NumPy | Operações numéricas |
| Matplotlib | Visualização gráfica |
| Jupyter Notebook | Ambiente interativo de desenvolvimento |
| Git e GitHub | Versionamento e publicação do projeto |

---

## Parâmetros de telemetria

A base de dados foi estruturada com base em parâmetros plausíveis de operação aeroespacial, voltados para um cenário simulado de pré-decolagem.

| Sensor | μ | σ | Unidade | Referência | Comentário |
|---|---:|---:|---|---|---|
| Temperatura interna | 22 | 1.5 | °C | ISS: 18–26°C, média 21–23°C | Ambiente pressurizado com controle térmico ativo |
| Temperatura externa | 10 | 50 | °C | LEO: -65°C a +125°C | Variação extrema entre face solar e sombra da nave |
| Integridade estrutural | — | — | 0/1 | Binário: 1 = íntegro, 0 = comprometido | Sensores binários de ruptura/deformação |
| Energia | 95 | 3 | % | Carga de baterias em pré-operação | Percentual de energia disponível |
| Vibração | 0.3 | 0.1 | g | Pré-decolagem: ~0.1–0.5g | Vibrações residuais dos motores |
| Pressão dos tanques | 4.5 | 0.5 | atm | Faixa plausível de pressurização | Pressurização dos tanques de propelente |

Esses dados são **sintéticos**, mas foram modelados para representar um cenário operacional plausível.

---

## Regras de avaliação do sistema

O projeto utiliza regras lógicas para interpretar os dados:

### Crítico
- integridade estrutural comprometida  
- energia abaixo do mínimo operacional  
- vibração excessiva  
- pressão dos tanques abaixo do ideal  

### Atenção
- temperatura interna fora da faixa ideal  
- energia abaixo da faixa recomendada  
- vibração acima do esperado  
- pressão abaixo do valor ideal  

### Normal
- parâmetros dentro das condições esperadas para operação  

Além disso, o sistema também:
- identifica anomalias  
- calcula autonomia estimada  
- gera uma sugestão de ação  
- calcula um índice de prontidão operacional  
- emite um parecer final  

---

## Principais resultados gerados

Ao executar o notebook, o sistema produz:

- classificação de risco por registro  
- sugestão operacional  
- autonomia estimada em horas  
- identificação de anomalias  
- motivo do risco  
- índice de prontidão operacional  
- parecer final  
- gráficos de apoio à interpretação dos dados  

---

## Observação metodológica

Os dados utilizados neste projeto são simulados e foram estruturados com base em parâmetros plausíveis de um cenário pré-operacional de decolagem. O objetivo é demonstrar a aplicação de técnicas computacionais de organização de telemetria, análise energética, classificação de risco e apoio à decisão, sem afirmar que os dados representam medições reais de um sistema aeroespacial específico.

---

## Reflexão crítica

O uso de sistemas computacionais em cenários de pré-decolagem pode ampliar a capacidade de monitoramento e apoiar decisões mais rápidas e consistentes. No entanto, esse processo exige responsabilidade técnica, interpretação adequada dos resultados e supervisão humana, principalmente em situações críticas.

Também é importante considerar que o avanço tecnológico em contextos aeroespaciais envolve impactos sociais, custos elevados e desafios relacionados à sustentabilidade tecnológica. Assim, o uso de inteligência computacional deve ser acompanhado de reflexão ética e de critérios transparentes de decisão.

---

## Autor

Projeto desenvolvido por **Alexandre Niewelt** como parte da Atividade Integradora da FIAP.
