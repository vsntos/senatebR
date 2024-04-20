#' Extrair os tipos de decisão de uma URL específica
#'
#' Esta função realiza o scraping de uma página XML contendo informações sobre os tipos de decisão e extrai os dados relevantes.
#'
#' @param url A URL do XML contendo os tipos de decisão. Por padrão, é utilizada a URL "https://legis.senado.leg.br/dadosabertos/dados/ListaTiposDecisao.xml".
#' @return Um dataframe contendo os tipos de decisão.
#' @importFrom xml2 read_xml xml_find_all xml_text xml_find_first
#' @export
#' @examples
#' # Extrair os tipos de decisão a partir da URL padrão
#' df_tipos_decisao <- extrair_tipos_decisao()
#'
#' # Extrair os tipos de decisão a partir de uma URL específica
#' df_tipos_decisao <- extrair_tipos_decisao("https://legis.senado.leg.br/dadosabertos/dados/OutraListaTiposDecisao.xml")
extrair_tipos_decisao <- function(url = "https://legis.senado.leg.br/dadosabertos/dados/ListaTiposDecisao.xml") {
  # Faça o download e analise o XML
  doc <- xml2::read_xml(url)

  # Extrair os dados dos tipos de decisão
  tipos <- xml2::xml_find_all(doc, ".//TipoDecisao")

  # Inicializar vetores para armazenar os dados
  sigla <- character()
  descricao <- character()

  # Loop sobre os tipos de decisão para extrair os dados
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
