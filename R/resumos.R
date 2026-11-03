# R/resumos.R

# Função para calcular estatísticas descritivas
# Ex 4.1: Resumo por Unidade
resumo_por_unidade <- function(dados) {
  dados %>%
    group_by(codigo, nome, galpao) %>% 
    summarise(
      meses_com_registro = sum(medicao > 0), 
      total_ano = sum(medicao),
      media_mensal = mean(medicao),
      .groups = "drop"
    ) %>%
    arrange(desc(media_mensal))
}

# Ex 4.2: Resumo por Categoria (Galpão)
resumo_por_categoria <- function(dados) {
  dados %>%
    group_by(galpao) %>%
    summarise(
      qtd_unidades = n_distinct(codigo),
      total_ano = sum(medicao),
      media_mensal = mean(medicao),
      .groups = "drop"
    )
}

# Ex 5: Tabela de Apresentação
tabela_apresentacao <- function(dados) {
  dados %>%
    group_by(galpao, ano) %>%
    summarise(total = sum(medicao), .groups = "drop") %>%
    pivot_wider(names_from = ano, values_from = total) 
}