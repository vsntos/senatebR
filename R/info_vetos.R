#' Extrair detalhes de vetos a partir da URL específica contendo informações sobre vetos
#'
#' Esta função realiza scraping de uma página contendo informações sobre vetos e extrai detalhes como número do veto, link associado, ementa, data de sobresta, matéria vetada e norma gerada.
#'
#' @param pages O número de páginas a serem processadas.
#' @return Um dataframe contendo os detalhes dos vetos.
#' @import rvest
#' @import dplyr
#' @importFrom rvest read_html html_nodes html_text html_attr
#' @importFrom dplyr %>%
#' @export
extrair_detalhes_vetos <- function(pages = 1) {

  # Verificação e instalação dos pacotes, se necessário
  if (!requireNamespace("rvest", quietly = TRUE)) {
    install.packages("rvest")
  }
  if (!requireNamespace("dplyr", quietly = TRUE)) {
    install.packages("dplyr")
  }

  # Carregamento das bibliotecas
  library(rvest)
  library(dplyr)

  # URL base contendo informações sobre vetos
  url_base <- "https://www.congressonacional.leg.br/materias/vetos/-/veto/encerradas/"

  # Inicializar vetores para armazenar os dados
  vetos <- c()
  links <- c()
  ementas <- c()
  sobrestas <- c()
  materias_vetadas <- c()
  normas_geradas <- c()

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
      vetos <- c(vetos, resumo %>% html_node("dt:contains('Veto') + dd a") %>% html_text() %>% trimws())
      links <- c(links, resumo %>% html_node("dt:contains('Veto') + dd a") %>% html_attr("href") %>% trimws())
      ementas <- c(ementas, resumo %>% html_node("dt:contains('Ementa') + dd") %>% html_text() %>% trimws())
      sobrestas <- c(sobrestas, resumo %>% html_node("dt:contains('Sobresta em') + dd") %>% html_text() %>% trimws())
      materias_vetadas <- c(materias_vetadas, resumo %>% html_node("dt:contains('Matéria vetada') + dd a") %>% html_text() %>% trimws())
      normas_geradas <- c(normas_geradas, resumo %>% html_node("dt:contains('Norma gerada') + dd a") %>% html_text() %>% trimws())
    }
  }

  # Criar um dataframe com os dados coletados
  dados_vetos <- data.frame(Veto = vetos,
                            Link = links,
                            Ementa = ementas,
                            Sobresta = sobrestas,
                            Materia_Vetada = materias_vetadas,
                            Norma_Gerada = normas_geradas,
                            stringsAsFactors = FALSE)

  return(dados_vetos)
}


