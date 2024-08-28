#' Processa XML de Profissões de Senadores
#'
#' Esta função acessa a URL da API do Senado para cada código de parlamentar fornecido,
#' extrai e processa os dados de profissões associados a cada parlamentar.
#' Retorna um dataframe com informações sobre as profissões, incluindo dados do
#' parlamentar e detalhes das profissões.
#'
#' @param codigos Um vetor de códigos de parlamentares para os quais os dados de
#' profissões serão extraídos.
#'
#' @return Um dataframe contendo os dados das profissões, com as seguintes colunas:
#' \describe{
#'   \item{CodigoParlamentar}{Código do parlamentar}
#'   \item{NomeParlamentar}{Nome do parlamentar}
#'   \item{NomeProfissao}{Nome da profissão}
#'   \item{IndicadorAtividadePrincipal}{Indicador se a profissão é a atividade principal}
#' }
#'
#' @examples
#' \dontrun{
#' # Exemplo de uso com códigos fictícios
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

    # Extrair os dados das profissões
    profissoes_nodes <- xml_find_all(xml_data, "//Profissao")

    if (length(profissoes_nodes) == 0) {
      message("Nenhuma profissão encontrada para o código: ", codigo)
      next
    }

    # Função auxiliar para extrair dados de cada profissão
    extrair_dados_profissao <- function(node) {
      list(
        CodigoParlamentar = codigo_parlamentar,
        NomeParlamentar = nome_parlamentar,
        NomeProfissao = xml_text(xml_find_first(node, ".//NomeProfissao")),
        IndicadorAtividadePrincipal = xml_text(xml_find_first(node, ".//IndicadorAtividadePrincipal"))
      )
    }

    # Aplicar a função auxiliar a todos os nós de profissão
    profissoes_list <- lapply(profissoes_nodes, extrair_dados_profissao)

    # Criar o dataframe a partir da lista de profissões
    df_profissoes <- bind_rows(profissoes_list)

    resultados[[as.character(codigo)]] <- df_profissoes
  }

  # Combinar todos os dataframes em um único dataframe
  df_resultado_final <- bind_rows(resultados)

  return(df_resultado_final)
}
