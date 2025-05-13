#' Processa XML de Profiss\u00f5es de Senadores
#'
#' Esta fun\u00e7\u00e3o acessa a URL da API do Senado para cada c\u00f3digo de parlamentar fornecido,
#' extrai e processa os dados de profiss\u00f5es associados a cada parlamentar.
#' Retorna um dataframe com informa\u00e7\u00f5es sobre as profiss\u00f5es, incluindo dados do
#' parlamentar e detalhes das profiss\u00f5es.
#'
#' @param codigos Um vetor de c\u00f3digos de parlamentares para os quais os dados de
#' profiss\u00f5es ser\u00e3o extra\u00eddos.
#'
#' @return Um dataframe contendo os dados das profiss\u00f5es, com as seguintes colunas:
#' \describe{
#'   \item{CodigoParlamentar}{C\u00f3digo do parlamentar}
#'   \item{NomeParlamentar}{Nome do parlamentar}
#'   \item{NomeProfissao}{Nome da profiss\u00e3o}
#'   \item{IndicadorAtividadePrincipal}{Indicador se a profiss\u00e3o \u00e9 a atividade principal}
#' }
#'
#' @examples
#' \dontrun{
#' # Exemplo de uso com c\u00f3digos fict\u00edcios
#' codigos <- c("4981", "1234")
#' df_profissoes <- processar_xml_profissoes(codigos)
#' }
#'
#' @import xml2
#' @import dplyr
#' @export
processar_xml_profissoes <- function(codigos) {
  resultados <- list()

  for (codigo in codigos) {
    url <- paste0("https://legis.senado.leg.br/dadosabertos/senador/", codigo, "/profissao")

    # Verificar se o c\u00f3digo \u00e9 num\u00e9rico e n\u00e3o muito longo
    if (!is.numeric(codigo) || nchar(codigo) > 10) {
      message("C\u00f3digo inv\u00e1lido ou muito longo: ", codigo)
      next
    }

    # Ler o XML da URL
    xml_data <- tryCatch({
      read_xml(url)
    }, error = function(e) {
      message("Erro ao ler o XML para o c\u00f3digo: ", codigo, " - ", e$message)
      return(NULL)
    })

    if (is.null(xml_data)) {
      next
    }

    # Extrair o c\u00f3digo e nome do parlamentar
    codigo_parlamentar <- xml_text(xml_find_first(xml_data, "//Codigo"))
    nome_parlamentar <- xml_text(xml_find_first(xml_data, "//Nome"))

    # Verificar se os dados foram extra\u00eddos corretamente
    if (is.na(codigo_parlamentar) || is.na(nome_parlamentar)) {
      message("Dados do parlamentar n\u00e3o encontrados para o c\u00f3digo: ", codigo)
      next
    }

    # Extrair os dados das profiss\u00f5es
    profissoes_nodes <- xml_find_all(xml_data, "//Profissao")

    if (length(profissoes_nodes) == 0) {
      message("Nenhuma profiss\u00e3o encontrada para o c\u00f3digo: ", codigo)
      next
    }

    # Fun\u00e7\u00e3o auxiliar para extrair dados de cada profiss\u00e3o
    extrair_dados_profissao <- function(node) {
      list(
        CodigoParlamentar = codigo_parlamentar,
        NomeParlamentar = nome_parlamentar,
        NomeProfissao = xml_text(xml_find_first(node, ".//NomeProfissao")),
        IndicadorAtividadePrincipal = xml_text(xml_find_first(node, ".//IndicadorAtividadePrincipal"))
      )
    }

    # Aplicar a fun\u00e7\u00e3o auxiliar a todos os n\u00f3s de profiss\u00e3o
    profissoes_list <- lapply(profissoes_nodes, extrair_dados_profissao)

    # Criar o dataframe a partir da lista de profiss\u00f5es
    df_profissoes <- bind_rows(profissoes_list)

    resultados[[as.character(codigo)]] <- df_profissoes
  }

  # Combinar todos os dataframes em um \u00fanico dataframe
  df_resultado_final <- bind_rows(resultados)

  return(df_resultado_final)
}
