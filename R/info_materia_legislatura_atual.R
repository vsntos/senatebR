#' Lista de Mat\u00e9rias da Legislatura Atual
#'
#' Esta fun\u00e7\u00e3o realiza o scraping de um XML contendo informa\u00e7\u00f5es sobre mat\u00e9rias legislativas da legislatura atual do Senado Federal do Brasil.
#' Os dados extra\u00eddos incluem o c\u00f3digo da mat\u00e9ria, sigla e nome da casa legislativa, subtipo da mat\u00e9ria, n\u00famero e ano, descri\u00e7\u00e3o, indica\u00e7\u00e3o de tramita\u00e7\u00e3o e identifica\u00e7\u00e3o do processo.
#'
#' @return Um dataframe contendo os detalhes das mat\u00e9rias legislativas.
#' O dataframe possui as seguintes colunas:
#' \describe{
#'   \item{CodigoMateria}{C\u00f3digo da mat\u00e9ria.}
#'   \item{SiglaCasaIdentificacaoMateria}{Sigla da casa legislativa identificadora da mat\u00e9ria.}
#'   \item{NomeCasaIdentificacaoMateria}{Nome da casa legislativa identificadora da mat\u00e9ria.}
#'   \item{SiglaSubtipoMateria}{Sigla do subtipo da mat\u00e9ria.}
#'   \item{NumeroMateria}{N\u00famero da mat\u00e9ria.}
#'   \item{AnoMateria}{Ano da mat\u00e9ria.}
#'   \item{DescricaoIdentificacaoMateria}{Descri\u00e7\u00e3o da identifica\u00e7\u00e3o da mat\u00e9ria.}
#'   \item{IndicadorTramitando}{Indicador de tramita\u00e7\u00e3o da mat\u00e9ria.}
#'   \item{IdentificacaoProcesso}{Identifica\u00e7\u00e3o do processo da mat\u00e9ria.}
#' }
#'
#' @examples
#' df_materias <- materias_legislatura_atual()
#' @importFrom xml2 read_xml xml_find_all xml_text xml_find_first
#' @importFrom dplyr %>%
#' @export

materias_legislatura_atual <- function() {
  tryCatch({
    # URL do XML
    url <- "https://legis.senado.leg.br/dadosabertos/materia/legislaturaatual?tramitando=S"

    # Fa\u00e7a o download e analise o XML
    doc <- xml2::read_xml(url)

    # Extraia os dados das mat\u00e9rias
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

    # Loop sobre as mat\u00e9rias para extrair os dados
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
      IdentificacaoProcesso = processo,
      stringsAsFactors = FALSE
    )

    return(dados)

  }, error = function(e) {
    cat("Erro ao acessar o XML:", url, "\n")
    cat("Mensagem de erro:", conditionMessage(e), "\n")
    return(NULL)
  })
}

