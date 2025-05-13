#' Processa XML de Lideran\u00e7as de Senadores
#'
#' Esta fun\u00e7\u00e3o acessa a URL da API do Senado para cada c\u00f3digo de parlamentar fornecido,
#' extrai e processa os dados de lideran\u00e7as associados a cada parlamentar.
#' Retorna um dataframe com informa\u00e7\u00f5es sobre as lideran\u00e7as, incluindo dados do
#' parlamentar e detalhes das lideran\u00e7as.
#'
#' @param codigos Um vetor de c\u00f3digos de parlamentares para os quais os dados de
#' lideran\u00e7as ser\u00e3o extra\u00eddos.
#'
#' @return Um dataframe contendo os dados das lideran\u00e7as, com as seguintes colunas:
#' \describe{
#'   \item{CodigoParlamentar}{C\u00f3digo do parlamentar}
#'   \item{NomeParlamentar}{Nome do parlamentar}
#'   \item{UnidadeLideranca}{Unidade da lideran\u00e7a}
#'   \item{CodigoPartido}{C\u00f3digo do partido}
#'   \item{SiglaPartido}{Sigla do partido}
#'   \item{NomePartido}{Nome do partido}
#'   \item{SiglaCasaLideranca}{Sigla da casa de lideran\u00e7a}
#'   \item{NomeCasaLideranca}{Nome da casa de lideran\u00e7a}
#'   \item{DescricaoTipoLideranca}{Descri\u00e7\u00e3o do tipo de lideran\u00e7a}
#'   \item{DataDesignacao}{Data de designa\u00e7\u00e3o}
#'   \item{DataFim}{Data de t\u00e9rmino}
#'   \item{CodigoBloco}{C\u00f3digo do bloco}
#'   \item{SiglaBloco}{Sigla do bloco}
#'   \item{NomeBloco}{Nome do bloco}
#'   \item{ApelidoBloco}{Apelido do bloco}
#'   \item{NumeroOrdemViceLideranca}{N\u00famero de ordem da vice-lideran\u00e7a}
#' }
#'
#' @examples
#' \dontrun{
#' # Exemplo de uso com c\u00f3digos fict\u00edcios
#' codigos <- c("123456", "654321")
#' df_liderancas <- processar_xml_liderancas(codigos)
#' }
#'
#' @import xml2
#' @import dplyr
#' @export
processar_xml_liderancas <- function(codigos) {
  resultados <- list()

  for (codigo in codigos) {
    url <- paste0("https://legis.senado.leg.br/dadosabertos/senador/", codigo, "/liderancas")

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

    # Extrair os dados das lideran\u00e7as
    liderancas_nodes <- xml_find_all(xml_data, "//Lideranca")

    if (length(liderancas_nodes) == 0) {
      message("Nenhuma lideran\u00e7a encontrada para o c\u00f3digo: ", codigo)
      next
    }

    # Fun\u00e7\u00e3o auxiliar para extrair dados de cada lideran\u00e7a
    extrair_dados_lideranca <- function(node) {
      list(
        CodigoParlamentar = codigo_parlamentar,
        NomeParlamentar = nome_parlamentar,
        UnidadeLideranca = xml_text(xml_find_first(node, ".//UnidadeLideranca")),
        CodigoPartido = xml_text(xml_find_first(node, ".//Partido/CodigoPartido")),
        SiglaPartido = xml_text(xml_find_first(node, ".//Partido/SiglaPartido")),
        NomePartido = xml_text(xml_find_first(node, ".//Partido/NomePartido")),
        SiglaCasaLideranca = xml_text(xml_find_first(node, ".//SiglaCasaLideranca")),
        NomeCasaLideranca = xml_text(xml_find_first(node, ".//NomeCasaLideranca")),
        DescricaoTipoLideranca = xml_text(xml_find_first(node, ".//DescricaoTipoLideranca")),
        DataDesignacao = xml_text(xml_find_first(node, ".//DataDesignacao")),
        DataFim = xml_text(xml_find_first(node, ".//DataFim")),
        CodigoBloco = xml_text(xml_find_first(node, ".//Bloco/CodigoBloco")),
        SiglaBloco = xml_text(xml_find_first(node, ".//Bloco/SiglaBloco")),
        NomeBloco = xml_text(xml_find_first(node, ".//Bloco/NomeBloco")),
        ApelidoBloco = xml_text(xml_find_first(node, ".//Bloco/ApelidoBloco")),
        NumeroOrdemViceLideranca = xml_text(xml_find_first(node, ".//NumeroOrdemViceLideranca"))
      )
    }

    # Aplicar a fun\u00e7\u00e3o auxiliar a todos os n\u00f3s de lideran\u00e7a
    liderancas_list <- lapply(liderancas_nodes, extrair_dados_lideranca)

    # Criar o dataframe a partir da lista de lideran\u00e7as
    df_liderancas <- bind_rows(liderancas_list)

    resultados[[as.character(codigo)]] <- df_liderancas
  }

  # Combinar todos os dataframes em um \u00fanico dataframe
  df_resultado_final <- bind_rows(resultados)

  return(df_resultado_final)
}
