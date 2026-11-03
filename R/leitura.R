# R/leitura.R

# Função para ler o cadastro corrigindo os acentos
ler_cadastro <- function(caminho) {
  read_csv2(
    caminho,
    # O encoding "latin1" ou "ISO-8859-1" costuma resolver problemas de acentuação em dados brasileiros
    locale = locale(encoding = "latin1"),
    show_col_types = FALSE,
    lazy = FALSE
  )
}

# Função para ler os dados do ano com os tipos exigidos (codigo <chr>, meses <dbl>)
ler_todos_anos <- function(arquivos) {
  arquivos %>%
    set_names() %>%
    purrr::map_dfr(~ read_delim(
      .x,
      delim = ";",
      locale = locale(decimal_mark = ",", grouping_mark = "."),
      col_types = cols(codigo = col_character(), .default = col_double()),
      na = c("", "NA", "-"), # <- Esta linha resolve o aviso
      lazy = FALSE
    ), .id = "origem") %>%
    mutate(ano = parse_number(basename(origem))) %>%
    select(-origem)
}