#' Fun\u00e7\u00e3o para extrair os dados de v\u00e1rias URLs
#'
#' Esta fun\u00e7\u00e3o realiza o scraping de v\u00e1rias p\u00e1ginas HTML contendo informa\u00e7\u00f5es sobre vetos do Congresso Nacional
#' e extrai os dados da tabela de partes vetadas.
#'
#' @param urls Um vetor de URLs das p\u00e1ginas a serem analisadas.
#' @return Um dataframe contendo os dados extra\u00eddos de todas as URLs fornecidas.
#' Se n\u00e3o houver tabela em alguma das p\u00e1ginas, retorna uma mensagem de aviso.
#' @export
#'
#' @examples
#' urls <- c("https://www.congressonacional.leg.br/materias/vetos/-/veto/detalhe/16110",
#'           "https://www.congressonacional.leg.br/materias/vetos/-/veto/detalhe/16049",
#'           "https://www.congressonacional.leg.br/materias/vetos/-/veto/detalhe/16029")
#' dados <- extrair_detalhes_vetos(urls)
#'
extrair_detalhes_vetos <- function(urls) {
  # Inicializar um dataframe vazio para armazenar os resultados
  dados_finais <- data.frame()

  # Iterar sobre as URLs e extrair os dados de cada uma
  for (url in urls) {
    # Realizar o scraping da p\u00e1gina
    pagina <- rvest::read_html(url)

    # Tentar extrair a tabela de partes vetadas
    tabela <- try(rvest::html_table(pagina %>% rvest::html_node(".cn-detalhe-veto--partes-vetadas")), silent = TRUE)

    # Se a tabela foi extra\u00edda com sucesso, adicionar ao dataframe final
    if (!inherits(tabela, "try-error")) {
      codigo_veto <- gsub(".*\\/([0-9]+)$", "\\1", url)
      tabela$Codigo_Veto <- codigo_veto
      dados_finais <- dplyr::bind_rows(dados_finais, tabela)
    } else {
      # Se n\u00e3o houver tabela, imprimir mensagem de aviso
      cat("Nenhuma tabela encontrada para a URL:", url, "\n")
    }
  }

  return(dados_finais)
}

