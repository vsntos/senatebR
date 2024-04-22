#' Extrair as situações da tramitação
#'
#' Esta função realiza o scraping de uma página XML contendo informações sobre as situações da tramitação das matérias e extrai os dados relevantes.
#'
#' @param url A URL do XML contendo as situações da tramitação. Por padrão, é utilizada a URL "https://legis.senado.leg.br/dadosabertos/dados/ListaSituacoes.xml".
#' @return Um dataframe contendo as situações da tramitação.
#'
#' @examples
#' # Extrair as situações da tramitação a partir da URL padrão
#' extrair_situacoes_tramitacao()
#'
#'
#' @importFrom xml2 read_xml xml_find_all xml_text xml_find_first
#' @export
extrair_situacoes_tramitacao <- function(url = "https://legis.senado.leg.br/dadosabertos/dados/ListaSituacoes.xml") {
  # Faça o download e analise o XML
  doc <- xml2::read_xml(url)

  # Extrair os dados das situações da tramitação
  situacoes <- xml2::xml_find_all(doc, ".//Situacao")

  # Inicializar vetores para armazenar os dados
  codigo <- character()
  sigla <- character()
  descricao <- character()
  data_criacao <- character()

  # Loop sobre as situações da tramitação para extrair os dados
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
