#' Extrair os tipos de comparecimento em vota\u00e7\u00e3o de uma URL espec\u00edfica
#'
#' Esta fun\u00e7\u00e3o realiza o scraping de uma p\u00e1gina XML contendo informa\u00e7\u00f5es sobre os tipos de comparecimento em vota\u00e7\u00e3o e extrai os dados relevantes.
#'
#' @param url A URL do XML que cont\u00e9m os tipos de comparecimento em vota\u00e7\u00e3o.
#' @return Um dataframe contendo os tipos de comparecimento em vota\u00e7\u00e3o.
#' @importFrom xml2 read_xml xml_find_all xml_text xml_find_first
#' @export
#' @examples
#' df_tipos_comparecimento <- extrair_tipos_comparecimento()
extrair_tipos_comparecimento <- function(url = "https://legis.senado.leg.br/dadosabertos/dados/ListaTiposComparecimento.xml") {
  # Fa\u00e7a o download e analise o XML
  doc <- xml2::read_xml(url)

  # Extrair os dados dos tipos de comparecimento em vota\u00e7\u00e3o
  tipos_comparecimento <- xml2::xml_find_all(doc, ".//TipoComparecimento")

  # Inicializar vetores para armazenar os dados
  sigla <- character()
  descricao <- character()

  # Loop sobre os tipos de comparecimento em vota\u00e7\u00e3o para extrair os dados
  for (tipo_node in tipos_comparecimento) {
    sigla <- c(sigla, xml2::xml_text(xml2::xml_find_first(tipo_node, ".//Sigla")))
    descricao <- c(descricao, xml2::xml_text(xml2::xml_find_first(tipo_node, ".//Descricao")))
  }

  # Criar um dataframe com os dados
  dados <- data.frame(
    Sigla = sigla,
    Descricao = descricao,
    stringsAsFactors = FALSE
  )

  return(dados)
}
