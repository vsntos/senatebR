#' Coleta de Dados de Parlamentares no Senado
#'
#' Esta função coleta dados de parlamentares no Senado Federal usando a API de dados abertos.
#' Ela permite que você colete informações sobre as comissões associadas a um ou mais parlamentares.
#'
#' @param cod_parlamentares Um vetor de strings contendo os códigos dos parlamentares para os quais os dados devem ser coletados.
#'
#' @return Um data frame contendo as informações das comissões associadas a cada parlamentar, incluindo:
#' \itemize{
#'   \item \code{CodigoParlamentar}: Código do parlamentar.
#'   \item \code{Sigla}: Sigla da comissão.
#'   \item \code{Comissao}: Nome completo da comissão.
#'   \item \code{Nome}: Nome do parlamentar.
#'   \item \code{Codigo}: Código do parlamentar.
#'   \item \code{SiglaPartido}: Sigla do partido ao qual o parlamentar pertence.
#'   \item \code{URL}: URL do perfil do parlamentar no site do Senado.
#'   \item \code{Foto}: URL da foto oficial do parlamentar.
#'   \item \code{Uf}: Unidade Federativa (UF) do parlamentar.
#'   \item \code{Quantidade}: Quantidade de matérias atribuídas ao parlamentar na comissão.
#' }
#'
#' @examples
#' # Coletar dados de múltiplos parlamentares
#' codigos_parlamentares <- c("5672", "1234", "5678")
#' dados_resultantes <- coletar_autorias_parlamentares(codigos_parlamentares)
#' print(dados_resultantes)
#'
#' @export
coletar_autorias_parlamentares <- function(cod_parlamentares) {

  # Função interna para coletar dados de um único parlamentar
  coletar_dados_parlamentar <- function(cod_parlamentar) {
    # Construir a URL com base no código do parlamentar
    url <- paste0("https://legis.senado.leg.br/dadosabertos/materia/distribuicao/autoria?codParlamentar=", cod_parlamentar)

    # Ler o conteúdo XML da URL
    xml_data <- xml2::read_xml(url)

    # Extrair as informações de cada comissão
    comissoes <- xml2::xml_find_all(xml_data, "//Comissao")

    # Verificar se comissões foram encontradas
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

  # Aplicar a função em cada código de parlamentar e combinar os resultados
  dados_completos <- dplyr::bind_rows(lapply(cod_parlamentares, coletar_dados_parlamentar))

  return(dados_completos)
}
