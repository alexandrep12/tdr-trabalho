# _targets.R
library(targets)
library(tarchetypes)

# Carrega os scripts de funções
tar_source("R/") 

tar_option_set(
  packages = c("tidyr", "readr", "dplyr", "ggplot2", "purrr"), 
  format = "rds" 
)

list(
  tar_target(arquivo_cadastro, "dados/cadastro.csv", format = "file"),
  tar_target(arquivos_anos, c("dados/reciclaveis_2023.csv",
                              "dados/reciclaveis_2024.csv",
                              "dados/reciclaveis_2025.csv"),
             format = "file"),
  
  # Executar as funções de leitura
  tar_target(dados_cadastro, ler_cadastro(arquivo_cadastro)),
  tar_target(dados_brutos, ler_todos_anos(arquivos_anos)),
  
  
  # Pivotar (empilhar os meses) para cada ano separadamente
  tar_target(dados_longos, empilhar_meses(dados_brutos)),
  tar_target(dados_completos, juntar_dados(dados_cadastro, dados_longos)),
  
  # resumos
  tar_target(resumo_unid, resumo_por_unidade(dados_completos)),     
  tar_target(resumo_cat, resumo_por_categoria(dados_completos)),    
  tar_target(tab_final, tabela_apresentacao(dados_completos)),       
  
  
  # Renderizar o Relatório Quarto
  tar_quarto(relatorio_final, "relatorio.qmd")
)
  


  