#' Extrair os tipos de decis\u00e3o de uma URL espec\u00edfica
#'
#' Esta fun\u00e7\u00e3o realiza o scraping sobre os tipos de decis\u00e3o e extrai os dados relevantes.
#'
#' @param url A URL do XML que cont\u00e9m os tipos de decis\u00e3o.
#' @return Um dataframe contendo os tipos de decis\u00e3o.
#' @importFrom xml2 read_xml xml_find_all xml_text xml_find_first
#' @export
#' @examples
#' df_tipos_decisao <- extrair_tipos_decisao()
extrair_tipos_decisao <- function(url = "https://legis.senado.leg.br/dadosabertos/dados/ListaTiposDecisao.xml") {
  # Fa\u00e7a o download e analise o XML
  doc <- xml2::read_xml(url)

  # Extrair os dados dos tipos de decis\u00e3o
  tipos <- xml2::xml_find_all(doc, ".//TipoDecisao")

  # Inicializar vetores para armazenar os dados
  sigla <- character()
  descricao <- character()

  # Loop sobre os tipos de decis\u00e3o para extrair os dados
  for (tipo in tipos) {
    sigla <- c(sigla, xml2::xml_text(xml2::xml_find_first(tipo, ".//Sigla")))
    descricao <- c(descricao, xml2::xml_text(xml2::xml_find_first(tipo, ".//Descricao")))
  }

  # Criar um dataframe com os dados
  dados <- data.frame(
    Sigla = sigla,
    Descricao = descricao,
    stringsAsFactors = FALSE
  )

  return(dados)
}

