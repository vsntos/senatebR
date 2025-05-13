#' Extrair as siglas ativas de mat\u00e9rias de uma URL espec\u00edfica
#'
#' Esta fun\u00e7\u00e3o realiza o scraping de uma p\u00e1gina XML contendo informa\u00e7\u00f5es sobre as siglas ativas de mat\u00e9rias e extrai os dados relevantes.
#'
#' @param url A URL do XML que cont\u00e9m as siglas ativas de mat\u00e9rias.
#' @return Um dataframe contendo as siglas ativas de mat\u00e9rias.
#' @importFrom xml2 read_xml xml_find_all xml_text xml_find_first
#' @export
#' @examples
#' extrair_siglas_ativas()
extrair_siglas_ativas <- function(url = "https://legis.senado.leg.br/dadosabertos/dados/ListaSiglas.xml") {
  # Fa\u00e7a o download e analise o XML
  doc <- xml2::read_xml(url)

  # Extrair os dados das siglas ativas de mat\u00e9rias
  siglas <- xml2::xml_find_all(doc, ".//Siglas")

  # Inicializar vetores para armazenar os dados
  sigla <- character()
  descricao <- character()
  data_inicio <- character()
  data_fim <- character()

  # Loop sobre as siglas ativas de mat\u00e9rias para extrair os dados
  for (sigla_node in siglas) {
    sigla <- c(sigla, xml2::xml_text(xml2::xml_find_first(sigla_node, ".//Sigla")))
    descricao <- c(descricao, xml2::xml_text(xml2::xml_find_first(sigla_node, ".//Descricao")))
    data_inicio <- c(data_inicio, xml2::xml_text(xml2::xml_find_first(sigla_node, ".//DataInicio")))
    data_fim <- c(data_fim, xml2::xml_text(xml2::xml_find_first(sigla_node, ".//DataFim")))
  }

  # Criar um dataframe com os dados
  dados <- data.frame(
    Sigla = sigla,
    Descricao = descricao,
    DataInicio = data_inicio,
    DataFim = data_fim,
    stringsAsFactors = FALSE
  )

  return(dados)
}


