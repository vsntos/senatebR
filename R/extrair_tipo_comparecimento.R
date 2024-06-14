#' Extrair os tipos de comparecimento em votação de uma URL específica
#'
#' Esta função realiza o scraping de uma página XML contendo informações sobre os tipos de comparecimento em votação e extrai os dados relevantes.
#'
#' @param url A URL do XML que contém os tipos de comparecimento em votação.
#' @return Um dataframe contendo os tipos de comparecimento em votação.
#' @importFrom xml2 read_xml xml_find_all xml_text xml_find_first
#' @export
#' @examples
#' df_tipos_comparecimento <- extrair_tipos_comparecimento()
extrair_tipos_comparecimento <- function(url = "https://legis.senado.leg.br/dadosabertos/dados/ListaTiposComparecimento.xml") {
  # Faça o download e analise o XML
  doc <- xml2::read_xml(url)

  # Extrair os dados dos tipos de comparecimento em votação
  tipos_comparecimento <- xml2::xml_find_all(doc, ".//TipoComparecimento")

  # Inicializar vetores para armazenar os dados
  sigla <- character()
  descricao <- character()

  # Loop sobre os tipos de comparecimento em votação para extrair os dados
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
