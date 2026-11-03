# R/transformacao.R

# 1. Empilha as 12 colunas de meses do ano em formato longo
empilhar_meses <- function(dados) {
  dados %>%
    pivot_longer(
      cols = -c(codigo, ano), # Ex 5: ignorar codigo e ano na pivotagem
      names_to = "mes",
      values_to = "medicao"
    ) %>%
    # Ex 4: Decisão sobre NAs (Substituindo por 0. Mude se sua decisão for outra)
    mutate(medicao = replace_na(medicao, 0)) 
}

# 2. Cruza o cadastro limpo com os dados do ano empilhados
juntar_dados <- function(cadastro, dados_empilhados) {
  inner_join(cadastro, dados_empilhados, by = "codigo")
}