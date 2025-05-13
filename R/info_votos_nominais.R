#' Extrai as informa\u00e7\u00f5es das vota\u00e7\u00f5es nominais por ano
#'
#' Esta fun\u00e7\u00e3o extrai as informa\u00e7\u00f5es das vota\u00e7\u00f5es nominais e retorna um data frame.
#'
#' @param anos Vetor contendo os anos das vota\u00e7\u00f5es a serem extra\u00eddas
#'
#' @return Um data frame com as informa\u00e7\u00f5es das vota\u00e7\u00f5es nominais
#'
#' @examples
#' # Exemplo de uso
#' anos <- c(2023, 2024)
#' dados_votacoes <- extrair_votacoes_nominais_por_ano(anos)
#'
#' @importFrom xml2 read_xml xml_find_all xml_text xml_name xml_children xml_find_first
#' @importFrom dplyr bind_rows
#' @importFrom tidyr unnest
#'
#' @export
extrair_votacoes_nominais_por_ano <- function(anos) {
  # Fun\u00e7\u00e3o interna para extrair informa\u00e7\u00f5es de uma vota\u00e7\u00e3o nominal
  extrair_info_votacao_nominal <- function(votacao_node) {
    # Extrai os n\u00f3s filhos da vota\u00e7\u00e3o
    filhos <- xml2::xml_children(votacao_node)

    # Extrai as informa\u00e7\u00f5es da vota\u00e7\u00e3o
    info_votacao <- sapply(filhos, function(x) xml2::xml_text(x, trim = TRUE))

    # Define os nomes das colunas
    nomes_colunas <- sapply(filhos, xml2::xml_name)

    # Define os nomes das colunas \u00fanicos
    nomes_colunas <- make.unique(nomes_colunas)

    # Atribui os nomes das colunas ao vetor de informa\u00e7\u00f5es da vota\u00e7\u00e3o
    names(info_votacao) <- nomes_colunas

    # Se a vari\u00e1vel 'Votos' estiver presente, processa-a
    if ("Votos" %in% nomes_colunas) {
      # Extrai informa\u00e7\u00f5es aninhadas da vari\u00e1vel 'Votos'
      votos <- xml2::xml_find_all(votacao_node, ".//VotoParlamentar")

      # Lista para armazenar os data frames de votos
      lista_votos <- list()

      # Loop pelos n\u00f3s de votos
      for (voto_node in votos) {
        # Extrai informa\u00e7\u00f5es do voto
        info_voto <- sapply(xml2::xml_children(voto_node), xml2::xml_text, trim = TRUE)

        # Define os nomes das colunas
        nomes_colunas_voto <- sapply(xml2::xml_children(voto_node), xml2::xml_name)

        # Define os nomes das colunas \u00fanicos
        nomes_colunas_voto <- make.unique(nomes_colunas_voto)

        # Atribui os nomes das colunas ao vetor de informa\u00e7\u00f5es do voto
        names(info_voto) <- nomes_colunas_voto

        # Adiciona o c\u00f3digo da sess\u00e3o ao dataframe de votos
        info_voto$CodigoSessao <- xml2::xml_text(xml2::xml_find_first(votacao_node, ".//CodigoSessao"), trim = TRUE)

        # Adiciona o data frame do voto \u00e0 lista
        lista_votos[[length(lista_votos) + 1]] <- as.data.frame(info_voto, stringsAsFactors = FALSE)
      }

      # Combina todos os data frames de votos em um \u00fanico data frame
      df_votos <- dplyr::bind_rows(lista_votos)

      # Adiciona o data frame de votos \u00e0 lista de informa\u00e7\u00f5es da vota\u00e7\u00e3o
      info_votacao$Votos <- df_votos
    }

    return(info_votacao)
  }

  # Lista para armazenar os data frames de cada ano
  lista_df <- list()

  # Loop pelos anos fornecidos
  for (ano in anos) {
    # URL do arquivo XML para o ano espec\u00edfico
    url <- paste0("https://legis.senado.leg.br/dadosabertos/dados/ListaVotacoes", ano, ".xml")

    # Carrega o arquivo XML
    doc <- xml2::read_xml(url)

    # Extrai os n\u00f3s de vota\u00e7\u00f5es
    votacoes <- xml2::xml_find_all(doc, ".//Votacao")

    # Lista para armazenar os data frames de cada vota\u00e7\u00e3o
    lista_votacoes <- list()

    # Loop pelas vota\u00e7\u00f5es
    for (votacao_node in votacoes) {
      # Extrai informa\u00e7\u00f5es da vota\u00e7\u00e3o
      info_votacao <- extrair_info_votacao_nominal(votacao_node)

      # Adiciona o data frame da vota\u00e7\u00e3o \u00e0 lista
      lista_votacoes[[length(lista_votacoes) + 1]] <- as.data.frame(info_votacao, stringsAsFactors = FALSE)
    }

    # Combina todos os data frames das vota\u00e7\u00f5es em um \u00fanico data frame
    df_votacoes <- dplyr::bind_rows(lista_votacoes)

    # Adiciona o ano como uma coluna
    df_votacoes$Ano <- ano

    # Adiciona o data frame do ano \u00e0 lista
    lista_df[[as.character(ano)]] <- df_votacoes
  }

  # Combina todos os data frames dos anos em um \u00fanico data frame
  df_votacoes_nominais <- dplyr::bind_rows(lista_df, .id = "Ano")

  # Retorna o data frame final
  return(df_votacoes_nominais)
}










