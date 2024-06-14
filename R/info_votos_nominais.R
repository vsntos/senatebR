#' Extrai as informações das votações nominais por ano
#'
#' Esta função extrai as informações das votações nominais e retorna um data frame.
#'
#' @param anos Vetor contendo os anos das votações a serem extraídas
#'
#' @return Um data frame com as informações das votações nominais
#'
#' @examples
#' Executa a função para extrair as votações nominais
#' anos = (2024)
#' dados_votacoes <- extrair_votacoes_nominais_por_ano(anos)
#'
#' @import xml2
#' @import dplyr
#' @import tidyr
#' @importFrom dplyr bind_rows
#' @importFrom xml2 read_xml xml_find_all xml_text xml_name xml_find_first
#'
#' @export
extrair_votacoes_nominais_por_ano <- function(anos) {
  requireNamespace("xml2", quietly = TRUE)
  requireNamespace("dplyr", quietly = TRUE)
  requireNamespace("tidyr", quietly = TRUE)

  # Função interna para extrair informações de uma votação nominal
  extrair_info_votacao_nominal <- function(votacao_node) {
    # Extrai os nós filhos da votação
    filhos <- xml2::xml_children(votacao_node)

    # Extrai as informações da votação
    info_votacao <- sapply(filhos, function(x) xml2::xml_text(x, trim = TRUE))

    # Define os nomes das colunas
    nomes_colunas <- sapply(filhos, xml2::xml_name)

    # Define os nomes das colunas únicos
    nomes_colunas <- make.unique(nomes_colunas)

    # Atribui os nomes das colunas ao vetor de informações da votação
    names(info_votacao) <- nomes_colunas

    # Se a variável 'Votos' estiver presente, processa-a
    if ("Votos" %in% nomes_colunas) {
      # Extrai informações aninhadas da variável 'Votos'
      votos <- xml2::xml_find_all(votacao_node, ".//VotoParlamentar")

      # Lista para armazenar os data frames de votos
      lista_votos <- list()

      # Loop pelos nós de votos
      for (voto_node in votos) {
        # Extrai informações do voto
        info_voto <- xml2::xml_children(voto_node) %>%
          xml2::xml_text(trim = TRUE)

        # Define os nomes das colunas
        nomes_colunas_voto <- xml2::xml_name(xml2::xml_children(voto_node))

        # Define os nomes das colunas únicos
        nomes_colunas_voto <- make.unique(nomes_colunas_voto)

        # Atribui os nomes das colunas ao vetor de informações do voto
        names(info_voto) <- nomes_colunas_voto

        # Adiciona o código da sessão ao dataframe de votos
        info_voto$CodigoSessao <- xml2::xml_text(xml2::xml_find_first(votacao_node, ".//CodigoSessao"), trim = TRUE)

        # Adiciona o data frame do voto à lista
        lista_votos[[length(lista_votos) + 1]] <- info_voto
      }

      # Combina todos os data frames de votos em um único data frame
      df_votos <- dplyr::bind_rows(lista_votos)

      # Adiciona o data frame de votos à lista de informações da votação
      info_votacao$Votos <- df_votos
    }

    return(info_votacao)
  }

  # Lista para armazenar os data frames de cada ano
  lista_df <- list()

  # Loop pelos anos fornecidos
  for (ano in anos) {
    # URL do arquivo XML para o ano específico
    url <- paste0("https://legis.senado.leg.br/dadosabertos/dados/ListaVotacoes", ano, ".xml")

    # Carrega o arquivo XML
    doc <- xml2::read_xml(url)

    # Extrai os nós de votações
    votacoes <- xml2::xml_find_all(doc, ".//Votacao")

    # Lista para armazenar os data frames de cada votação
    lista_votacoes <- list()

    # Loop pelas votações
    for (votacao_node in votacoes) {
      # Extrai informações da votação
      info_votacao <- extrair_info_votacao_nominal(votacao_node)

      # Adiciona o data frame da votação à lista
      lista_votacoes[[length(lista_votacoes) + 1]] <- info_votacao
    }

    # Combina todos os data frames das votações em um único data frame
    df_votacoes <- dplyr::bind_rows(lista_votacoes)

    # Adiciona o ano como uma coluna
    df_votacoes$Ano <- ano

    # Adiciona o data frame do ano à lista
    lista_df[[as.character(ano)]] <- df_votacoes
  }

  # Combina todos os data frames dos anos em um único data frame
  df_votacoes_nominais <- dplyr::bind_rows(lista_df, .id = "Ano")

  # Retorna o data frame final
  return(df_votacoes_nominais)
}









