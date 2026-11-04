library(dplyr)
library(magrittr)
library(readr)
# Função para ler o cadastro corrigindo os acentos
ler_cadastro <- function(caminho) {
  read_csv2(
    caminho,
    locale = locale(encoding = "latin1"),
    show_col_types = FALSE,
    lazy = FALSE
  )
}

ler_todos_anos <- function(arquivos) {
  arquivos |>
    set_names() |>
    purrr::map_dfr(function(caminho) {
      read_delim(
        caminho,
        delim = ";",
        locale = locale(decimal_mark = ",", grouping_mark = "."),
        col_types = cols(codigo = col_character(), .default = col_double()),
        na = c("", "NA", "-"),
        lazy = FALSE
      ) |>
        mutate(ano = parse_number(basename(caminho)))
    })
}
