#' Processa XML de Lideranças de Senadores
#'
#' Esta função acessa a URL da API do Senado para cada código de parlamentar fornecido,
#' extrai e processa os dados de lideranças associados a cada parlamentar.
#' Retorna um dataframe com informações sobre as lideranças, incluindo dados do
#' parlamentar e detalhes das lideranças.
#'
#' @param codigos Um vetor de códigos de parlamentares para os quais os dados de
#' lideranças serão extraídos.
#'
#' @return Um dataframe contendo os dados das lideranças, com as seguintes colunas:
#' \describe{
#'   \item{CodigoParlamentar}{Código do parlamentar}
#'   \item{NomeParlamentar}{Nome do parlamentar}
#'   \item{UnidadeLideranca}{Unidade da liderança}
#'   \item{CodigoPartido}{Código do partido}
#'   \item{SiglaPartido}{Sigla do partido}
#'   \item{NomePartido}{Nome do partido}
#'   \item{SiglaCasaLideranca}{Sigla da casa de liderança}
#'   \item{NomeCasaLideranca}{Nome da casa de liderança}
#'   \item{DescricaoTipoLideranca}{Descrição do tipo de liderança}
#'   \item{DataDesignacao}{Data de designação}
#'   \item{DataFim}{Data de término}
#'   \item{CodigoBloco}{Código do bloco}
#'   \item{SiglaBloco}{Sigla do bloco}
#'   \item{NomeBloco}{Nome do bloco}
#'   \item{ApelidoBloco}{Apelido do bloco}
#'   \item{NumeroOrdemViceLideranca}{Número de ordem da vice-liderança}
#' }
#'
#' @examples
#' \dontrun{
#' # Exemplo de uso com códigos fictícios
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

    # Verificar se o código é numérico e não muito longo
    if (!is.numeric(codigo) || nchar(codigo) > 10) {
      message("Código inválido ou muito longo: ", codigo)
      next
    }

    # Ler o XML da URL
    xml_data <- tryCatch({
      read_xml(url)
    }, error = function(e) {
      message("Erro ao ler o XML para o código: ", codigo, " - ", e$message)
      return(NULL)
    })

    if (is.null(xml_data)) {
      next
    }

    # Extrair o código e nome do parlamentar
    codigo_parlamentar <- xml_text(xml_find_first(xml_data, "//Codigo"))
    nome_parlamentar <- xml_text(xml_find_first(xml_data, "//Nome"))

    # Verificar se os dados foram extraídos corretamente
    if (is.na(codigo_parlamentar) || is.na(nome_parlamentar)) {
      message("Dados do parlamentar não encontrados para o código: ", codigo)
      next
    }

    # Extrair os dados das lideranças
    liderancas_nodes <- xml_find_all(xml_data, "//Lideranca")

    if (length(liderancas_nodes) == 0) {
      message("Nenhuma liderança encontrada para o código: ", codigo)
      next
    }

    # Função auxiliar para extrair dados de cada liderança
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

    # Aplicar a função auxiliar a todos os nós de liderança
    liderancas_list <- lapply(liderancas_nodes, extrair_dados_lideranca)

    # Criar o dataframe a partir da lista de lideranças
    df_liderancas <- bind_rows(liderancas_list)

    resultados[[as.character(codigo)]] <- df_liderancas
  }

  # Combinar todos os dataframes em um único dataframe
  df_resultado_final <- bind_rows(resultados)

  return(df_resultado_final)
}
