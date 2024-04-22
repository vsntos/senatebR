#' Extrair detalhes de vetos a partir da URL específica contendo informações sobre vetos
#'
#' Esta função realiza scraping de uma página contendo informações sobre vetos e extrai detalhes como número do veto, link associado, ementa, data de sobresta, matéria vetada e norma gerada.
#'
#' @param pages O número de páginas a serem processadas.
#'
#' @return Um dataframe contendo os detalhes dos vetos.
#'
#' @examples
#' dados_vetos <- extrair_detalhes_vetos(pages = 3)
#' head(dados_vetos)
#'
#' @import rvest
#' @import dplyr
#' @importFrom rvest read_html html_nodes html_text html_attr
#' @importFrom dplyr %>%
#' @export
extrair_detalhes_vetos <- function(pages = 1) {
  # URL base contendo informações sobre vetos
  url_base <- "https://www.congressonacional.leg.br/materias/vetos/-/veto/encerradas/"

  # Inicializar um dataframe para armazenar os dados
  dados_vetos <- data.frame(
    Veto = character(),
    Link = character(),
    Ementa = character(),
    Sobresta = character(),
    Materia_Vetada = character(),
    Norma_Gerada = character(),
    stringsAsFactors = FALSE
  )

  # Iterar sobre as páginas
  for (page in 1:pages) {
    # Construir a URL da página atual
    url_pagina <- paste0(url_base, page)

    # Realizar o scraping da página
    pagina <- read_html(url_pagina)

    # Extrair os elementos da lista de resumos
    resumos <- pagina %>% html_nodes(".sf-lista-resumos__resumo")

    # Iterar sobre os elementos de resumo e extrair os dados
    for (resumo in resumos) {
      dados_vetos <- rbind(dados_vetos, data.frame(
        Veto = resumo %>% html_node("dt:contains('Veto') + dd a") %>% html_text() %>% trimws(),
        Link = resumo %>% html_node("dt:contains('Veto') + dd a") %>% html_attr("href") %>% trimws(),
        Ementa = resumo %>% html_node("dt:contains('Ementa') + dd") %>% html_text() %>% trimws(),
        Sobresta = resumo %>% html_node("dt:contains('Sobresta em') + dd") %>% html_text() %>% trimws(),
        Materia_Vetada = resumo %>% html_node("dt:contains('Matéria vetada') + dd") %>% html_text() %>% trimws(),
        Norma_Gerada = resumo %>% html_node("dt:contains('Norma gerada') + dd") %>% html_text() %>% trimws(),
        stringsAsFactors = FALSE
      ))
    }
  }

  return(dados_vetos)
}
