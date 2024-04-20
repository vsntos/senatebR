#' Extrai dados de pronunciamentos de múltiplos parlamentares em diferentes anos
#'
#' Esta função extrai dados de pronunciamentos de múltiplos parlamentares para os anos fornecidos.
#'
#' @param codigos_parlamentares Vetor de códigos dos parlamentares.
#' @param anos Vetor de anos para os quais os pronunciamentos serão extraídos.
#'
#' @return Um dataframe contendo os dados de pronunciamentos de múltiplos parlamentares.
#' Se nenhum dado estiver disponível, retorna NULL.
#'
#' @examples
#' codigo <- c(5672, 5386)
#' ano <- c(2023, 2024)
#' dados_multi <- extrair_pronunciamentos_multi(codigos_parlamentares = codigo, anos = ano)
#'
#' @import rvest
#' @import dplyr
#' @export
extrair_pronunciamentos_multi <- function(codigos_parlamentares, anos) {
  # Lista para armazenar os dataframes de pronunciamentos de cada parlamentar
  lista_dados <- list()

  # Itera sobre cada código de parlamentar
  for (codigo in codigos_parlamentares) {
    # Lista para armazenar os dataframes de pronunciamentos do parlamentar atual
    dados_parlamentar <- list()

    # Itera sobre cada ano
    for (ano in anos) {
      # URL da página com a tabela
      url <- paste0("https://www25.senado.leg.br/web/atividade/pronunciamentos/-/p/parlamentar/",
                    codigo, "/", ano)

      # Ler o HTML da página
      pagina <- read_html(url)

      # Extrair os dados individualmente usando seletores CSS
      data_pronunciamento <- pagina %>%
        html_nodes("table.table.table-striped tbody tr td:nth-child(1) a") %>%
        html_text()

      tipo_pronunciamento <- pagina %>%
        html_nodes("table.table.table-striped tbody tr td:nth-child(2)") %>%
        html_text()

      casa <- pagina %>%
        html_nodes("table.table.table-striped tbody tr td:nth-child(3)") %>%
        html_text()

      partido_uf <- pagina %>%
        html_nodes("table.table.table-striped tbody tr td:nth-child(4)") %>%
        html_text()

      resumo_pronunciamento <- pagina %>%
        html_nodes("table.table.table-striped tbody tr td:nth-child(5)") %>%
        html_text()

      # Extrair os links dos pronunciamentos
      links_pronunciamento <- pagina %>%
        html_nodes("table.table.table-striped tbody tr td:nth-child(1) a") %>%
        html_attr("href")

      # Verifica se há dados disponíveis antes de criar o dataframe
      if (length(data_pronunciamento) > 0) {
        # Combina os dados extraídos em um dataframe
        dados <- data.frame(Codigo_Parlamentar = rep(codigo, length(data_pronunciamento)),
                            Ano = rep(ano, length(data_pronunciamento)),
                            Data_Pronunciamento = data_pronunciamento,
                            Tipo_Pronunciamento = tipo_pronunciamento,
                            Casa = casa,
                            Partido_UF = partido_uf,
                            Resumo_Pronunciamento = resumo_pronunciamento,
                            Link_Pronunciamento = links_pronunciamento,
                            stringsAsFactors = FALSE)

        # Adiciona o dataframe de pronunciamentos do ano atual à lista
        dados_parlamentar[[as.character(ano)]] <- dados
      }
    }

    # Combinar os dataframes de pronunciamentos de diferentes anos em um único dataframe para o parlamentar atual
    if (length(dados_parlamentar) > 0) {
      dados_completos_parlamentar <- bind_rows(dados_parlamentar)

      # Adiciona o dataframe completo do parlamentar à lista
      lista_dados[[as.character(codigo)]] <- dados_completos_parlamentar
    }
  }

  # Verifica se há dados disponíveis antes de combinar os dataframes
  if (length(lista_dados) > 0) {
    # Combinar os dataframes de todos os parlamentares em um único dataframe
    dados_completos <- bind_rows(lista_dados)

    # Retorna o dataframe completo
    return(dados_completos)
  } else {
    # Retorna NULL se nenhum dado estiver disponível
    return(NULL)
  }
}

