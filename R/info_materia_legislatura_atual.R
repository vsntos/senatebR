#' Lista de Matérias da Legislatura Atual
#'
#' Esta função realiza o scraping de um XML contendo informações sobre matérias legislativas da legislatura atual do Senado Federal do Brasil.
#' Os dados extraídos incluem o código da matéria, sigla e nome da casa legislativa, subtipo da matéria, número e ano, descrição, indicação de tramitação e identificação do processo.
#'
#' @return Um dataframe contendo os detalhes das matérias legislativas.
#'
#' @examples
#'
#' df_materias <- materias_legislatura_atual()
#'
#' @importFrom xml2 read_xml xml_find_all xml_text xml_find_first
#' @importFrom dplyr %>%
#' @export

materias_legislatura_atual <- function() {
  # URL do XML
  url <- "https://legis.senado.leg.br/dadosabertos/materia/legislaturaatual?tramitando=S"

  # Faça o download e analise o XML
  doc <- xml2::read_xml(url)

  # Extraia os dados das matérias
  materias <- xml2::xml_find_all(doc, ".//Materia")

  # Inicialize vetores para armazenar os dados
  codigo <- character()
  sigla_casa <- character()
  nome_casa <- character()
  subtipo <- character()
  numero <- character()
  ano <- character()
  descricao <- character()
  tramitando <- character()
  processo <- character()

  # Loop sobre as matérias para extrair os dados
  for (materia in materias) {
    codigo <- c(codigo, xml2::xml_text(xml2::xml_find_first(materia, ".//CodigoMateria")))
    sigla_casa <- c(sigla_casa, xml2::xml_text(xml2::xml_find_first(materia, ".//SiglaCasaIdentificacaoMateria")))
    nome_casa <- c(nome_casa, xml2::xml_text(xml2::xml_find_first(materia, ".//NomeCasaIdentificacaoMateria")))
    subtipo <- c(subtipo, xml2::xml_text(xml2::xml_find_first(materia, ".//SiglaSubtipoMateria")))
    numero <- c(numero, xml2::xml_text(xml2::xml_find_first(materia, ".//NumeroMateria")))
    ano <- c(ano, xml2::xml_text(xml2::xml_find_first(materia, ".//AnoMateria")))
    descricao <- c(descricao, xml2::xml_text(xml2::xml_find_first(materia, ".//DescricaoIdentificacaoMateria")))
    tramitando <- c(tramitando, xml2::xml_text(xml2::xml_find_first(materia, ".//IndicadorTramitando")))
    processo <- c(processo, xml2::xml_text(xml2::xml_find_first(materia, ".//IdentificacaoProcesso")))
  }

  # Crie um dataframe com os dados
  dados <- data.frame(
    CodigoMateria = codigo,
    SiglaCasaIdentificacaoMateria = sigla_casa,
    NomeCasaIdentificacaoMateria = nome_casa,
    SiglaSubtipoMateria = subtipo,
    NumeroMateria = numero,
    AnoMateria = ano,
    DescricaoIdentificacaoMateria = descricao,
    IndicadorTramitando = tramitando,
    IdentificacaoProcesso = processo
  )

  return(dados)
}
