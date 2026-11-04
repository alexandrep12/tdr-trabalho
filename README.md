## Instruções para reprodução:

Para reproduzir todo o pipeline de dados, os cálculos estatísticos e a geração do relatório em Quarto, é necessário seguir os passos abaixo:

### Pré-requisitos

Certifique-se de ter instalado em sua máquina: - [R](https://cloud.r-project.org/) (versão 4.4 ou superior) - [Quarto CLI](https://quarto.org/)

### Passo a passo

1.  **Abra o projeto:** Clone o repositório e abra o projeto no RStudio através do arquivo `.Rproj`.

2.  **Restaure o ambiente de dependências:** O projeto utiliza o pacote `{renv}` para garantir a reprodutibilidade exata das versões dos pacotes. No console do RStudio, execute: `renv::restore()`

3.  **Execute o pipeline e gere o relatório:** O fluxo de trabalho é orquestrado pelo {targets}. Para rodar todas as etapas de leitura, transformação e compilação do relatório em Quarto, execute no console: `targets::tar_make()`

### descrição de cada arquivo das funções

no arquivo `leitura.R` tem as funções responsáveis por importar os dados brutos.

no arquivo `resumos.R` são as funções de cálculos, resumos, agregações e tabelas de resumos.

e no arquivo `transformacao.R` as funções manipulação dos dados, limpeza, tratamento de valores ausentes, conversão de tipo e o empilhamento dos dados de anos diferentes.

### Declaração de uso de IA

foi utilizado apenas uma unica ferramenta de LLM (Gemini), usado principalmente na resolução de problemas encontrados, bem como tirar algumas dúvidas de como proceder, problemas de sintaxe, erros de compilação, erros no workflow do Github Action, com validação em cada etapa além de buscas externas na internet, no material da disciplina e documentação tanto do github como de algumas bibliotecas usadas.
