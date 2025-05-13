#' Extrair detalhes de vetos a partir da URL espec\u00edfica contendo informa\u00e7\u00f5es sobre vetos
#'
#' Esta fun\u00e7\u00e3o realiza scraping de uma p\u00e1gina contendo informa\u00e7\u00f5es sobre vetos e extrai detalhes como n\u00famero do veto, link associado, ementa, data de sobresta, mat\u00e9ria vetada e norma gerada.
#'
#' @param pages O n\u00famero de p\u00e1ginas a serem processadas. Padr\u00e3o \u00e9 1.
#'
#' @return Um dataframe contendo os detalhes dos vetos.
#'
#' @examples
#' # Exemplo de uso
#' dados_vetos <- info_vetos(pages = 3)
#'
#' @import rvest
#' @import dplyr
#' @importFrom rvest read_html html_nodes html_text html_attr
#' @importFrom dplyr bind_rows
#'
#' @export
info_vetos <- function(pages = 1) {
  requireNamespace("rvest", quietly = TRUE)
  requireNamespace("dplyr", quietly = TRUE)

  # URL base contendo informa\u00e7\u00f5es sobre vetos
  url_base <- "https://www.congressonacional.leg.br/materias/vetos/-/veto/encerradas/"

  # Inicializar uma lista para armazenar os dataframes individuais
  lista_dataframes <- list()

  # Iterar sobre as p\u00e1ginas
  for (page in 1:pages) {
    # Construir a URL da p\u00e1gina atual
    url_pagina <- paste0(url_base, page)

    # Realizar o scraping da p\u00e1gina
    pagina <- rvest::read_html(url_pagina)

    # Extrair os elementos da lista de resumos
    resumos <- pagina %>% rvest::html_nodes(".sf-lista-resumos__resumo")

    # Iterar sobre os elementos de resumo e extrair os dados
    for (resumo in resumos) {
      veto <- resumo %>% rvest::html_node("dt:contains('Veto') + dd a") %>% rvest::html_text() %>% trimws()
      link <- resumo %>% rvest::html_node("dt:contains('Veto') + dd a") %>% rvest::html_attr("href") %>% trimws()
      ementa <- resumo %>% rvest::html_node("dt:contains('Ementa') + dd") %>% rvest::html_text() %>% trimws()
      sobresta <- resumo %>% rvest::html_node("dt:contains('Sobresta em') + dd") %>% rvest::html_text() %>% trimws()
      materia_vetada <- resumo %>% rvest::html_node("dt:contains('Mat\u00e9ria vetada') + dd") %>% rvest::html_text() %>% trimws()
      norma_gerada <- resumo %>% rvest::html_node("dt:contains('Norma gerada') + dd") %>% rvest::html_text() %>% trimws()

      # Adicionar os dados a um dataframe tempor\u00e1rio e armazenar na lista
      dados_temp <- data.frame(
        Veto = veto,
        Link = link,
        Ementa = ementa,
        Sobresta = sobresta,
        Materia_Vetada = materia_vetada,
        Norma_Gerada = norma_gerada,
        stringsAsFactors = FALSE
      )
      lista_dataframes[[length(lista_dataframes) + 1]] <- dados_temp
    }
  }

  # Combinar todos os dataframes da lista em um \u00fanico dataframe
  df_vetos <- dplyr::bind_rows(lista_dataframes)

  return(df_vetos)
}



