#' Processa XML de Apartes de Senadores
#'
#' Esta função acessa a URL da API do Senado para cada código de parlamentar fornecido,
#' extrai e processa os dados dos apartes associados a cada parlamentar.
#' Retorna um dataframe com informações sobre os apartes, incluindo dados do
#' parlamentar e detalhes dos apartes.
#'
#' @param codigos Um vetor de códigos de parlamentares para os quais os dados de
#' apartes serão extraídos.
#'
#' @return Um dataframe contendo os dados dos apartes, com as seguintes colunas:
#' \describe{
#'   \item{CodigoParlamentar}{Código do parlamentar}
#'   \item{NomeParlamentar}{Nome do parlamentar}
#'   \item{CodigoPronunciamento}{Código do pronunciamento}
#'   \item{TipoUsoPalavra}{Tipo de uso da palavra}
#'   \item{DataPronunciamento}{Data do pronunciamento}
#'   \item{SiglaPartidoParlamentarNaData}{Sigla do partido do parlamentar na data}
#'   \item{UfParlamentarNaData}{UF do parlamentar na data}
#'   \item{SiglaCasaPronunciamento}{Sigla da casa do pronunciamento}
#'   \item{NomeCasaPronunciamento}{Nome da casa do pronunciamento}
#'   \item{TextoResumo}{Resumo do texto do pronunciamento}
#'   \item{Indexacao}{Indexação do pronunciamento}
#'   \item{UrlTexto}{URL do texto do pronunciamento}
#'   \item{UrlTextoBinario}{URL do texto binário do pronunciamento}
#'   \item{CodigoSessao}{Código da sessão plenária}
#'   \item{NomeCasaSessao}{Nome da casa da sessão}
#'   \item{DataSessao}{Data da sessão}
#'   \item{HoraInicioSessao}{Hora de início da sessão}
#'   \item{OradorCodigo}{Código do orador}
#'   \item{OradorNome}{Nome do orador}
#'   \item{PublicacaoData}{Data da publicação}
#'   \item{PublicacaoUrl}{URL da publicação}
#' }
#'
#' @examples
#' \dontrun{
#' # Exemplo de uso com códigos fictícios
#' codigos <- c("4763", "1234")
#' df_apartes <- processar_xml_apartes(codigos)
#' }
#'
#' @import xml2
#' @import dplyr
#' @export
processar_xml_apartes <- function(codigos) {
  resultados <- list()

  for (codigo in codigos) {
    url <- paste0("https://legis.senado.leg.br/dadosabertos/senador/", codigo, "/apartes")

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

    # Extrair informações do parlamentar
    codigo_parlamentar <- xml_text(xml_find_first(xml_data, "//CodigoParlamentar"))
    nome_parlamentar <- xml_text(xml_find_first(xml_data, "//NomeParlamentar"))

    # Verificar se os dados foram extraídos corretamente
    if (is.na(codigo_parlamentar) || is.na(nome_parlamentar)) {
      message("Dados do parlamentar não encontrados para o código: ", codigo)
      next
    }

    # Extrair os dados dos apartes
    apartes_nodes <- xml_find_all(xml_data, "//Aparte")

    if (length(apartes_nodes) == 0) {
      message("Nenhum aparte encontrado para o código: ", codigo)
      next
    }

    # Função auxiliar para extrair dados de cada aparte
    extrair_dados_aparte <- function(node) {
      list(
        CodigoParlamentar = codigo_parlamentar,
        NomeParlamentar = nome_parlamentar,
        CodigoPronunciamento = xml_text(xml_find_first(node, ".//CodigoPronunciamento")),
        TipoUsoPalavra = xml_text(xml_find_first(node, ".//TipoUsoPalavra/Descricao")),
        DataPronunciamento = xml_text(xml_find_first(node, ".//DataPronunciamento")),
        SiglaPartidoParlamentarNaData = xml_text(xml_find_first(node, ".//SiglaPartidoParlamentarNaData")),
        UfParlamentarNaData = xml_text(xml_find_first(node, ".//UfParlamentarNaData")),
        SiglaCasaPronunciamento = xml_text(xml_find_first(node, ".//SiglaCasaPronunciamento")),
        NomeCasaPronunciamento = xml_text(xml_find_first(node, ".//NomeCasaPronunciamento")),
        TextoResumo = xml_text(xml_find_first(node, ".//TextoResumo")),
        Indexacao = xml_text(xml_find_first(node, ".//Indexacao")),
        UrlTexto = xml_text(xml_find_first(node, ".//UrlTexto")),
        UrlTextoBinario = xml_text(xml_find_first(node, ".//UrlTextoBinario")),
        CodigoSessao = xml_text(xml_find_first(node, ".//SessaoPlenaria/CodigoSessao")),
        NomeCasaSessao = xml_text(xml_find_first(node, ".//SessaoPlenaria/NomeCasaSessao")),
        DataSessao = xml_text(xml_find_first(node, ".//SessaoPlenaria/DataSessao")),
        HoraInicioSessao = xml_text(xml_find_first(node, ".//SessaoPlenaria/HoraInicioSessao")),
        OradorCodigo = xml_text(xml_find_first(node, ".//Orador/CodigoParlamentar")),
        OradorNome = xml_text(xml_find_first(node, ".//Orador/NomeParlamentar")),
        PublicacaoData = xml_text(xml_find_first(node, ".//Publicacoes/Publicacao/DataPublicacao")),
        PublicacaoUrl = xml_text(xml_find_first(node, ".//Publicacoes/Publicacao/UrlDiario"))
      )
    }

    # Aplicar a função auxiliar a todos os nós de aparte
    apartes_list <- lapply(apartes_nodes, extrair_dados_aparte)

    # Criar o dataframe a partir da lista de apartes
    df_apartes <- bind_rows(apartes_list)

    resultados[[as.character(codigo)]] <- df_apartes
  }

  # Combinar todos os dataframes em um único dataframe
  df_resultado_final <- bind_rows(resultados)

  return(df_resultado_final)
}
