#' Extrair as situa\u00e7\u00f5es da tramita\u00e7\u00e3o
#'
#' Esta fun\u00e7\u00e3o realiza o scraping de uma p\u00e1gina XML contendo informa\u00e7\u00f5es sobre as situa\u00e7\u00f5es da tramita\u00e7\u00e3o das mat\u00e9rias e extrai os dados relevantes.
#'
#' @param url URL do arquivo XML que cont\u00e9m as informa\u00e7\u00f5es das situa\u00e7\u00f5es da tramita\u00e7\u00e3o. Padr\u00e3o \u00e9 "https://legis.senado.leg.br/dadosabertos/dados/ListaSituacoes.xml".
#'
#' @return Um dataframe contendo as situa\u00e7\u00f5es da tramita\u00e7\u00e3o.
#'
#' @examples
#' # Extrair as situa\u00e7\u00f5es da tramita\u00e7\u00e3o a partir da URL padr\u00e3o
#' df_materias_tramitacao <- extrair_situacoes_tramitacao()
#'
#' @importFrom xml2 read_xml xml_find_all xml_text xml_find_first
#' @export
extrair_situacoes_tramitacao <- function(url = "https://legis.senado.leg.br/dadosabertos/dados/ListaSituacoes.xml") {
  requireNamespace("xml2", quietly = TRUE)

  # Fa\u00e7a o download e analise o XML
  doc <- xml2::read_xml(url)

  # Extrair os dados das situa\u00e7\u00f5es da tramita\u00e7\u00e3o
  situacoes <- xml2::xml_find_all(doc, ".//Situacao")

  # Inicializar vetores para armazenar os dados
  codigo <- character()
  sigla <- character()
  descricao <- character()
  data_criacao <- character()

  # Loop sobre as situa\u00e7\u00f5es da tramita\u00e7\u00e3o para extrair os dados
  for (situacao in situacoes) {
    codigo <- c(codigo, xml2::xml_text(xml2::xml_find_first(situacao, ".//Codigo")))
    sigla <- c(sigla, xml2::xml_text(xml2::xml_find_first(situacao, ".//Sigla")))
    descricao <- c(descricao, xml2::xml_text(xml2::xml_find_first(situacao, ".//Descricao")))
    data_criacao <- c(data_criacao, xml2::xml_text(xml2::xml_find_first(situacao, ".//DataCriacao")))
  }

  # Criar um dataframe com os dados
  dados <- data.frame(
    Codigo = codigo,
    Sigla = sigla,
    Descricao = descricao,
    DataCriacao = data_criacao,
    stringsAsFactors = FALSE
  )

  return(dados)
}
