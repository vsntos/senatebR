#' Extrai dados de pronunciamentos de múltiplos parlamentares em diferentes anos
#'
#' Esta função extrai dados de pronunciamentos de múltiplos parlamentares para os anos fornecidos.
#' Os dados são extraídos da página do Senado Federal do Brasil.
#'
#' @param codigos_parlamentares Um vetor de códigos dos parlamentares (números inteiros).
#' @param anos Um vetor de anos (números inteiros) para os quais os pronunciamentos serão extraídos.
#'
#' @return Um dataframe contendo os dados de pronunciamentos de múltiplos parlamentares.
#' Se nenhum dado estiver disponível, retorna NULL.
#'
#' @details A função acessa as páginas do Senado para coletar informações sobre
#' pronunciamentos, incluindo data, tipo, casa, partido/UF, resumo e links dos pronunciamentos.
#' A função percorre várias páginas para cada parlamentar e ano, com um limite máximo de 100 páginas.
#'
#' @examples
#' \dontrun{
#'   codigos <- c(5672, 5386)
#'   anos <- c(2023, 2024)
#'   dados_multi <- extrair_pronunciamentos_multi(codigos_parlamentares = codigos, anos = anos)
#' }
#'
#' @import dplyr
#' @import rvest
#' @export
extrair_pronunciamentos_multi <- function(codigos_parlamentares, anos) {
  # Verificação e carregamento dos pacotes necessários
  if (!requireNamespace("rvest", quietly = TRUE)) {
    stop("Pacote 'rvest' não está instalado. Por favor, instale-o usando install.packages('rvest').")
  }
  if (!requireNamespace("dplyr", quietly = TRUE)) {
    stop("Pacote 'dplyr' não está instalado. Por favor, instale-o usando install.packages('dplyr').")
  }

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

      # Cria o loop de todas as páginas de resultados, com um limite inicial de 100
      page <- 1
      max_pages <- 100
      while (page <= max_pages) {
        # URL + a página atual após o último "/"
        url_page <- paste0(url, "/", page)

        # Ler o HTML da página
        pagina <- rvest::read_html(url_page)

        # Extrair os dados individualmente usando seletores CSS
        data_pronunciamento <- pagina %>%
          rvest::html_nodes("table.table.table-striped tbody tr td:nth-child(1) a") %>%
          rvest::html_text()

        tipo_pronunciamento <- pagina %>%
          rvest::html_nodes("table.table.table-striped tbody tr td:nth-child(2)") %>%
          rvest::html_text()

        casa <- pagina %>%
          rvest::html_nodes("table.table.table-striped tbody tr td:nth-child(3)") %>%
          rvest::html_text()

        partido_uf <- pagina %>%
          rvest::html_nodes("table.table.table-striped tbody tr td:nth-child(4)") %>%
          rvest::html_text()

        resumo_pronunciamento <- pagina %>%
          rvest::html_nodes("table.table.table-striped tbody tr td:nth-child(5)") %>%
          rvest::html_text()

        # Extrair os links dos pronunciamentos
        links_pronunciamento <- pagina %>%
          rvest::html_nodes("table.table.table-striped tbody tr td:nth-child(1) a") %>%
          rvest::html_attr("href")

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
          dados_parlamentar[[as.character(page)]] <- dados
        } else {
          # Se não houver discursos do senador na determinada página
          break
        }

        # Aumentar o número de páginas de 1 em 1
        page <- page + 1
      }

      # Combinar os dataframes de pronunciamentos de diferentes anos em um único dataframe para o parlamentar atual
      if (length(dados_parlamentar) > 0) {
        dados_completos_parlamentar <- dplyr::bind_rows(dados_parlamentar)

        # Adiciona o dataframe completo do parlamentar à lista
        lista_dados[[as.character(codigo)]] <- dados_completos_parlamentar
      }
    }
  }

  # Verifica se há dados disponíveis antes de combinar os dataframes
  if (length(lista_dados) > 0) {
    # Combinar os dataframes de todos os parlamentares em um único dataframe
    dados_completos <- dplyr::bind_rows(lista_dados)

    # Retorna o dataframe completo
    return(dados_completos)
  } else {
    # Retorna NULL se nenhum dado estiver disponível
    return(NULL)
  }
}

