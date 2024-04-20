#' Lista de Assuntos
#'
#' Esta função realiza o scraping de um XML contendo informações sobre assuntos legislativos do Senado Federal do Brasil.
#' Os dados extraídos incluem código do assunto, assunto geral, assunto específico, data de início e data de fim.
#'
#' @param url URL do XML contendo os dados dos assuntos. Por padrão, é usado o URL fornecido pelo Senado Federal.
#' @return Um dataframe contendo os detalhes dos assuntos legislativos.
#'
#' @examples
#' df_assuntos = info_materia_assuntos()
#'
#' @importFrom xml2 read_xml xml_find_all xml_text
#' @export

info_materia_assuntos <- function(url = "https://legis.senado.leg.br/dadosabertos/dados/ListaAssuntos.xml") {
  # Faça o download e analise o XML
  doc <- xml2::read_xml(url)

  # Extraia os dados dos assuntos
  assuntos <- xml2::xml_find_all(doc, ".//Assunto")

  # Inicialize vetores para armazenar os dados
  codigo <- character()
  assunto_geral <- character()
  assunto_especifico <- character()
  data_inicio <- character()
  data_fim <- character()

  # Loop sobre os assuntos para extrair os dados
  for (assunto in assuntos) {
    codigo <- c(codigo, xml2::xml_text(xml2::xml_find_first(assunto, ".//Codigo")))
    assunto_geral <- c(assunto_geral, xml2::xml_text(xml2::xml_find_first(assunto, ".//AssuntoGeral")))
    assunto_especifico <- c(assunto_especifico, xml2::xml_text(xml2::xml_find_first(assunto, ".//AssuntoEspecifico")))
    data_inicio <- c(data_inicio, xml2::xml_text(xml2::xml_find_first(assunto, ".//DataInicio")))
    data_fim <- c(data_fim, xml2::xml_text(xml2::xml_find_first(assunto, ".//DataFim", xml2::xml_missing())))
  }

  # Crie um dataframe com os dados
  dados <- data.frame(
    Codigo = codigo,
    AssuntoGeral = assunto_geral,
    AssuntoEspecifico = assunto_especifico,
    DataInicio = data_inicio,
    DataFim = data_fim
  )

  return(dados)
}



