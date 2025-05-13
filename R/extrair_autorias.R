#' Coleta de Dados de Parlamentares no Senado
#'
#' Esta fun\u00e7\u00e3o coleta dados de parlamentares no Senado Federal usando a API de dados abertos.
#' Ela permite que voc\u00ea colete informa\u00e7\u00f5es sobre as comiss\u00f5es associadas a um ou mais parlamentares.
#'
#' @param cod_parlamentares Um vetor de strings contendo os c\u00f3digos dos parlamentares para os quais os dados devem ser coletados.
#'
#' @return Um data frame contendo as informa\u00e7\u00f5es das comiss\u00f5es associadas a cada parlamentar, incluindo:
#' \itemize{
#'   \item \code{CodigoParlamentar}: C\u00f3digo do parlamentar.
#'   \item \code{Sigla}: Sigla da comiss\u00e3o.
#'   \item \code{Comissao}: Nome completo da comiss\u00e3o.
#'   \item \code{Nome}: Nome do parlamentar.
#'   \item \code{Codigo}: C\u00f3digo do parlamentar.
#'   \item \code{SiglaPartido}: Sigla do partido ao qual o parlamentar pertence.
#'   \item \code{URL}: URL do perfil do parlamentar no site do Senado.
#'   \item \code{Foto}: URL da foto oficial do parlamentar.
#'   \item \code{Uf}: Unidade Federativa (UF) do parlamentar.
#'   \item \code{Quantidade}: Quantidade de mat\u00e9rias atribu\u00eddas ao parlamentar na comiss\u00e3o.
#' }
#'
#' @examples
#' # Coletar dados de m\u00faltiplos parlamentares
#' codigos_parlamentares <- c("5672", "1234", "5678")
#' dados_resultantes <- coletar_autorias_parlamentares(codigos_parlamentares)
#' print(dados_resultantes)
#'
#' @export
coletar_autorias_parlamentares <- function(cod_parlamentares) {

  # Fun\u00e7\u00e3o interna para coletar dados de um \u00fanico parlamentar
  coletar_dados_parlamentar <- function(cod_parlamentar) {
    # Construir a URL com base no c\u00f3digo do parlamentar
    url <- paste0("https://legis.senado.leg.br/dadosabertos/materia/distribuicao/autoria?codParlamentar=", cod_parlamentar)

    # Ler o conte\u00fado XML da URL
    xml_data <- xml2::read_xml(url)

    # Extrair as informa\u00e7\u00f5es de cada comiss\u00e3o
    comissoes <- xml2::xml_find_all(xml_data, "//Comissao")

    # Verificar se comiss\u00f5es foram encontradas
    if (length(comissoes) == 0) {
      return(data.frame(
        CodigoParlamentar = cod_parlamentar,
        Sigla = NA,
        Comissao = NA,
        Nome = NA,
        Codigo = NA,
        SiglaPartido = NA,
        URL = NA,
        Foto = NA,
        Uf = NA,
        Quantidade = NA,
        stringsAsFactors = FALSE
      ))
    }

    # Criar um data frame para armazenar os dados
    data <- data.frame(
      CodigoParlamentar = cod_parlamentar,
      Sigla = xml2::xml_text(xml2::xml_find_all(comissoes, "Sigla")),
      Comissao = xml2::xml_text(xml2::xml_find_all(comissoes, "Comissao")),
      Nome = xml2::xml_text(xml2::xml_find_all(comissoes, ".//Parlamentar/Nome")),
      Codigo = xml2::xml_text(xml2::xml_find_all(comissoes, ".//Parlamentar/Codigo")),
      SiglaPartido = xml2::xml_text(xml2::xml_find_all(comissoes, ".//Parlamentar/SiglaPartido")),
      URL = xml2::xml_text(xml2::xml_find_all(comissoes, ".//Parlamentar/URL")),
      Foto = xml2::xml_text(xml2::xml_find_all(comissoes, ".//Parlamentar/Foto")),
      Uf = xml2::xml_text(xml2::xml_find_all(comissoes, ".//Parlamentar/Uf")),
      Quantidade = xml2::xml_text(xml2::xml_find_all(comissoes, ".//Parlamentar/Quantidade")),
      stringsAsFactors = FALSE
    )

    return(data)
  }

  # Aplicar a fun\u00e7\u00e3o em cada c\u00f3digo de parlamentar e combinar os resultados
  dados_completos <- dplyr::bind_rows(lapply(cod_parlamentares, coletar_dados_parlamentar))

  return(dados_completos)
}
