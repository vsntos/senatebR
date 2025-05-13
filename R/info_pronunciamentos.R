#' Extrai dados de pronunciamentos de m\u00faltiplos parlamentares em diferentes anos
#'
#' Esta fun\u00e7\u00e3o extrai dados de pronunciamentos de m\u00faltiplos parlamentares para os anos fornecidos.
#' Os dados s\u00e3o extra\u00eddos da p\u00e1gina do Senado Federal do Brasil.
#'
#' @param codigos_parlamentares Um vetor de c\u00f3digos dos parlamentares (n\u00fameros inteiros).
#' @param anos Um vetor de anos (n\u00fameros inteiros) para os quais os pronunciamentos ser\u00e3o extra\u00eddos.
#'
#' @return Um dataframe contendo os dados de pronunciamentos de m\u00faltiplos parlamentares.
#' Se nenhum dado estiver dispon\u00edvel, retorna NULL.
#'
#' @details A fun\u00e7\u00e3o acessa as p\u00e1ginas do Senado para coletar informa\u00e7\u00f5es sobre
#' pronunciamentos, incluindo data, tipo, casa, partido/UF, resumo e links dos pronunciamentos.
#' A fun\u00e7\u00e3o percorre v\u00e1rias p\u00e1ginas para cada parlamentar e ano, com um limite m\u00e1ximo de 100 p\u00e1ginas.
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
  # Verifica\u00e7\u00e3o e carregamento dos pacotes necess\u00e1rios
  if (!requireNamespace("rvest", quietly = TRUE)) {
    stop("Pacote 'rvest' n\u00e3o est\u00e1 instalado. Por favor, instale-o usando install.packages('rvest').")
  }
  if (!requireNamespace("dplyr", quietly = TRUE)) {
    stop("Pacote 'dplyr' n\u00e3o est\u00e1 instalado. Por favor, instale-o usando install.packages('dplyr').")
  }

  # Lista para armazenar os dataframes de pronunciamentos de cada parlamentar
  lista_dados <- list()

  # Itera sobre cada c\u00f3digo de parlamentar
  for (codigo in codigos_parlamentares) {
    # Lista para armazenar os dataframes de pronunciamentos do parlamentar atual
    dados_parlamentar <- list()

    # Itera sobre cada ano
    for (ano in anos) {
      # URL da p\u00e1gina com a tabela
      url <- paste0("https://www25.senado.leg.br/web/atividade/pronunciamentos/-/p/parlamentar/",
                    codigo, "/", ano)

      # Cria o loop de todas as p\u00e1ginas de resultados, com um limite
      page <- 1
      max_pages <- 1000
      while (page <= max_pages) {
        # URL + a p\u00e1gina atual ap\u00f3s o \u00faltimo "/"
        url_page <- paste0(url, "/", page)

        # Ler o HTML da p\u00e1gina
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

        # Verifica se h\u00e1 dados dispon\u00edveis antes de criar o dataframe
        if (length(data_pronunciamento) > 0) {
          # Combina os dados extra\u00eddos em um dataframe
          dados <- data.frame(Codigo_Parlamentar = rep(codigo, length(data_pronunciamento)),
                              Ano = rep(ano, length(data_pronunciamento)),
                              Data_Pronunciamento = data_pronunciamento,
                              Tipo_Pronunciamento = tipo_pronunciamento,
                              Casa = casa,
                              Partido_UF = partido_uf,
                              Resumo_Pronunciamento = resumo_pronunciamento,
                              Link_Pronunciamento = links_pronunciamento,
                              stringsAsFactors = FALSE)

          # Adiciona o dataframe de pronunciamentos do ano atual \u00e0 lista
          dados_parlamentar[[as.character(page)]] <- dados
        } else {
          # Se n\u00e3o houver discursos do senador na determinada p\u00e1gina
          break
        }

        # Aumentar o n\u00famero de p\u00e1ginas de 1 em 1
        page <- page + 1
      }

      # Combinar os dataframes de pronunciamentos de diferentes anos em um \u00fanico dataframe para o parlamentar atual
      if (length(dados_parlamentar) > 0) {
        dados_completos_parlamentar <- dplyr::bind_rows(dados_parlamentar)

        # Adiciona o dataframe completo do parlamentar \u00e0 lista
        lista_dados[[as.character(codigo)]] <- dados_completos_parlamentar
      }
    }
  }

  # Verifica se h\u00e1 dados dispon\u00edveis antes de combinar os dataframes
  if (length(lista_dados) > 0) {
    # Combinar os dataframes de todos os parlamentares em um \u00fanico dataframe
    dados_completos <- dplyr::bind_rows(lista_dados)

    # Retorna o dataframe completo
    return(dados_completos)
  } else {
    # Retorna NULL se nenhum dado estiver dispon\u00edvel
    return(NULL)
  }
}

