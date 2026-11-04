library(dplyr)
library(magrittr)
library(readr)
library(tidyr)
# Função para calcular estatísticas descritivas
# Ex 4.1: Resumo por Unidade
resumo_por_unidade <- function(dados) {
  dados |>
    group_by(.data$codigo, .data$nome, .data$galpao) |>
    summarise(
      meses_com_registro = sum(.data$medicao > 0),
      total_ano = sum(.data$medicao),
      media_mensal = mean(.data$medicao),
      .groups = "drop"
    ) |>
    arrange(desc(.data$media_mensal))
}

# Ex 4.2: Resumo por Categoria (Galpão)
resumo_por_categoria <- function(dados) {
  dados |>
    group_by(.data$galpao) |>
    summarise(
      qtd_unidades = n_distinct(.data$codigo),
      total_ano = sum(.data$medicao),
      media_mensal = mean(.data$medicao),
      .groups = "drop"
    )
}

# Ex 5: Tabela de Apresentação
tabela_apresentacao <- function(dados) {
  dados |>
    group_by(.data$galpao, .data$ano) |>
    summarise(total = sum(.data$medicao), .groups = "drop") |>
    pivot_wider(names_from = .data$ano, values_from = .data$total)
}
