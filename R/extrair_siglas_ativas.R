#' Extrair as siglas ativas de matérias de uma URL específica
#'
#' Esta função realiza o scraping de uma página XML contendo informações sobre as siglas ativas de matérias e extrai os dados relevantes.
#'
#' @param url A URL do XML contendo as siglas ativas de matérias. Por padrão, é utilizada a URL "https://legis.senado.leg.br/dadosabertos/dados/ListaSiglas.xml".
#' @return Um dataframe contendo as siglas ativas de matérias.
#' @importFrom xml2 read_xml xml_find_all xml_text xml_find_first
#' @export
#' @examples
#' # Extrair as siglas ativas de matérias a partir da URL padrão
#' extrair_siglas_ativas()
#'
#' # Extrair as siglas ativas de matérias a partir de uma URL específica
#' extrair_siglas_ativas("https://legis.senado.leg.br/dadosabertos/dados/OutraListaSiglas.xml")
extrair_siglas_ativas <- function(url = "https://legis.senado.leg.br/dadosabertos/dados/ListaSiglas.xml") {
  # Faça o download e analise o XML
  doc <- xml2::read_xml(url)

  # Extrair os dados das siglas ativas de matérias
  siglas <- xml2::xml_find_all(doc, ".//Siglas")

  # Inicializar vetores para armazenar os dados
  sigla <- character()
  descricao <- character()
  data_inicio <- character()
  data_fim <- character()

  # Loop sobre as siglas ativas de matérias para extrair os dados
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

