#' Extrai as informações das votações nominais por ano
#'
#' Esta função extrai as informações das votações nominais de um arquivo XML fornecido
#' e retorna um data frame contendo essas informações.
#'
#' @param anos Vetor contendo os anos das votações a serem extraídas
#' @return Um data frame com as informações das votações nominais
#'
#' @examples
#' Executa a função para extrair as votações nominais
#' df_votacoes_nominais <- extrair_votacoes_nominais_por_ano(c(2018, 2019))
#'
#' @export
#' @import xml2
#' @import dplyr
#' @import tidyr
extrair_votacoes_nominais_por_ano <- function(anos) {
  require(xml2)
  require(dplyr)
  require(tidyr)

  # Função interna para extrair informações de uma votação nominal
  extrair_info_votacao_nominal <- function(votacao_node) {
    # Extrai os nós filhos da votação
    filhos <- xml_children(votacao_node)

    # Extrai as informações da votação
    info_votacao <- sapply(filhos, function(x) xml_text(x, trim = TRUE))

    # Define os nomes das colunas
    nomes_colunas <- sapply(filhos, xml_name)

    # Define os nomes das colunas únicos
    nomes_colunas <- make.unique(nomes_colunas)

    # Atribui os nomes das colunas ao vetor de informações da votação
    names(info_votacao) <- nomes_colunas

    # Se a variável 'Votos' estiver presente, processa-a
    if ("Votos" %in% nomes_colunas) {
      # Extrai informações aninhadas da variável 'Votos'
      votos <- xml_find_all(votacao_node, ".//VotoParlamentar")

      # Lista para armazenar os data frames de votos
      lista_votos <- list()

      # Loop pelos nós de votos
      for (voto_node in votos) {
        # Extrai informações do voto
        info_voto <- xml_children(voto_node) %>%
          xml_text(trim = TRUE)

        # Define os nomes das colunas
        nomes_colunas_voto <- xml_name(xml_children(voto_node))

        # Define os nomes das colunas únicos
        nomes_colunas_voto <- make.unique(nomes_colunas_voto)

        # Atribui os nomes das colunas ao vetor de informações do voto
        names(info_voto) <- nomes_colunas_voto

        # Adiciona o código da sessão ao dataframe de votos
        info_voto$CodigoSessao <- xml_text(xml_find_first(votacao_node, ".//CodigoSessao"), trim = TRUE)

        # Adiciona o data frame do voto à lista
        lista_votos[[length(lista_votos) + 1]] <- info_voto
      }

      # Combina todos os data frames de votos em um único data frame
      df_votos <- bind_rows(lista_votos)

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
    votacoes <- xml_find_all(doc, ".//Votacao")

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
    df_votacoes <- bind_rows(lista_votacoes)

    # Adiciona o ano como uma coluna
    df_votacoes$Ano <- ano

    # Adiciona o data frame do ano à lista
    lista_df[[as.character(ano)]] <- df_votacoes
  }

  # Combina todos os data frames dos anos em um único data frame
  df_votacoes_nominais <- bind_rows(lista_df, .id = "Ano")

  # Extrai os dados de votos com a inclusão da variável CodigoSessao
  df_votos_nominais <- df_votacoes_nominais$Votos

  # Adiciona a variável CodigoSessao como a primeira coluna
  df_votos_nominais <- cbind(df_votos_nominais$CodigoSessao, df_votos_nominais)

  # Retorna o data frame final
  return(df_votos_nominais)
}







