#' Extrair informações das matérias em tramitação de uma URL específica
#'
#' Esta função realiza o scraping de uma página XML contendo informações sobre as matérias em tramitação e extrai os dados relevantes.
#'
#' @param url A URL do XML contendo as matérias em tramitação. Por padrão, é utilizada a URL "https://legis.senado.leg.br/dadosabertos/materia/tramitando".
#' @return Um dataframe contendo informações das matérias em tramitação.
#' O dataframe possui as seguintes colunas:
#' \describe{
#'   \item{CodigoMateria}{Código da matéria.}
#'   \item{SiglaCasaIdentificacaoMateria}{Sigla da casa legislativa à qual a matéria pertence.}
#'   \item{NomeCasaIdentificacaoMateria}{Nome da casa legislativa à qual a matéria pertence.}
#'   \item{SiglaSubtipoMateria}{Sigla do subtipo da matéria.}
#'   \item{NumeroMateria}{Número da matéria.}
#'   \item{AnoMateria}{Ano da matéria.}
#'   \item{DescricaoObjetivoProcesso}{Descrição do objetivo do processo legislativo da matéria.}
#'   \item{DescricaoIdentificacaoMateria}{Descrição da identificação da matéria.}
#'   \item{IndicadorTramitando}{Indicador de se a matéria está tramitando ou não.}
#'   \item{Ementa}{Ementa da matéria.}
#'   \item{Autor}{Autor da matéria.}
#'   \item{DataApresentacao}{Data de apresentação da matéria.}
#' }
#'
#' @importFrom xml2 read_xml xml_find_all xml_text xml_find_first
#' @export
#'
#' @examples
#' # Extrair informações das matérias em tramitação a partir da URL padrão
#' extrair_materias_tramitando()
#'
extrair_materias_tramitando <- function(url = "https://legis.senado.leg.br/dadosabertos/materia/tramitando") {
  # Faça o download e analise o XML
  doc <- xml2::read_xml(url)

  # Extrair os dados das matérias em tramitação
  materias <- xml2::xml_find_all(doc, ".//Materia")

  # Inicializar vetores para armazenar os dados
  codigo <- character()
  sigla_casa <- character()
  nome_casa <- character()
  sigla_subtipo <- character()
  numero <- character()
  ano <- character()
  descricao_processo <- character()
  descricao_materia <- character()
  indicador_tramitando <- character()
  ementa <- character()
  autor <- character()
  data_apresentacao <- character()

  # Loop sobre as matérias em tramitação para extrair os dados
  for (materia_node in materias) {
    codigo <- c(codigo, xml2::xml_text(xml2::xml_find_first(materia_node, ".//CodigoMateria")))
    sigla_casa <- c(sigla_casa, xml2::xml_text(xml2::xml_find_first(materia_node, ".//SiglaCasaIdentificacaoMateria")))
    nome_casa <- c(nome_casa, xml2::xml_text(xml2::xml_find_first(materia_node, ".//NomeCasaIdentificacaoMateria")))
    sigla_subtipo <- c(sigla_subtipo, xml2::xml_text(xml2::xml_find_first(materia_node, ".//SiglaSubtipoMateria")))
    numero <- c(numero, xml2::xml_text(xml2::xml_find_first(materia_node, ".//NumeroMateria")))
    ano <- c(ano, xml2::xml_text(xml2::xml_find_first(materia_node, ".//AnoMateria")))
    descricao_processo <- c(descricao_processo, xml2::xml_text(xml2::xml_find_first(materia_node, ".//DescricaoObjetivoProcesso")))
    descricao_materia <- c(descricao_materia, xml2::xml_text(xml2::xml_find_first(materia_node, ".//DescricaoIdentificacaoMateria")))
    indicador_tramitando <- c(indicador_tramitando, xml2::xml_text(xml2::xml_find_first(materia_node, ".//IndicadorTramitando")))
    ementa <- c(ementa, xml2::xml_text(xml2::xml_find_first(materia_node, ".//Ementa")))
    autor <- c(autor, xml2::xml_text(xml2::xml_find_first(materia_node, ".//Autor")))
    data_apresentacao <- c(data_apresentacao, xml2::xml_text(xml2::xml_find_first(materia_node, ".//DataApresentacao")))
  }

  # Criar um dataframe com os dados
  dados <- data.frame(
    CodigoMateria = codigo,
    SiglaCasaIdentificacaoMateria = sigla_casa,
    NomeCasaIdentificacaoMateria = nome_casa,
    SiglaSubtipoMateria = sigla_subtipo,
    NumeroMateria = numero,
    AnoMateria = ano,
    DescricaoObjetivoProcesso = descricao_processo,
    DescricaoIdentificacaoMateria = descricao_materia,
    IndicadorTramitando = indicador_tramitando,
    Ementa = ementa,
    Autor = autor,
    DataApresentacao = data_apresentacao,
    stringsAsFactors = FALSE
  )

  return(dados)
}

