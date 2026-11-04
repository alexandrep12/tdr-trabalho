library(dplyr)
library(magrittr)
library(readr)
library(tidyr)
# 1. Empilha as 12 colunas de meses do ano em formato longo
empilhar_meses <- function(dados) {
  dados |>
    pivot_longer(
      cols = -c(.data$codigo, .data$ano),
      # Ex 5: ignorar codigo e ano na pivotagem
      names_to = "mes",
      values_to = "medicao"
    ) |>
    mutate(.data$medicao <- replace_na(.data$medicao, 0))
}

# 2. Cruza o cadastro limpo com os dados do ano empilhados
juntar_dados <- function(cadastro, dados_empilhados) {
  inner_join(cadastro, dados_empilhados, by = "codigo")
}
