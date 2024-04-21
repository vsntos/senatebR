#' Obter relatorias de parlamentares
#'
#' Esta função obtém as relatorias de parlamentares com base nos códigos e anos fornecidos.
#'
#' @param codigos_parlamentares Vetor de códigos de parlamentares.
#' @param anos Vetor de anos.
#'
#' @return Um dataframe consolidado com todas as relatorias.
#'
#' @examples
#' # Exemplo de uso
#' df_relatorias <- relatorias_parlamentares(codigos_parlamentares = c(5386, 5012), anos = c(2022, 2023))
#' print(df_relatorias)
#'
#' @import httr
#' @import jsonlite
#' @import dplyr
#' @importFrom httr GET
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr bind_rows
#'
#' @export
relatorias_parlamentares <- function(codigos_parlamentares, anos) {
  # Verificar os parâmetros de entrada
  if (!is.vector(codigos_parlamentares) || !is.vector(anos)) {
    stop("Os parâmetros codigos_parlamentares e anos devem ser vetores.")
  }

  if (length(codigos_parlamentares) == 0 || length(anos) == 0) {
    stop("Os parâmetros codigos_parlamentares e anos não podem ser vazios.")
  }

  # Inicializar uma lista para armazenar os dataframes individuais
  lista_dataframes <- list()

  # Iterar sobre os códigos de parlamentares e anos
  for (codigo_parlamentar in codigos_parlamentares) {
    for (ano in anos) {
      # Construir a URL da API com os parâmetros fornecidos
      url_api <- paste0("https://legis.senado.leg.br/dadosabertos/senador/",
                        codigo_parlamentar, "/relatorias?ano=", ano)

      # Fazer a requisição GET
      response <- httr::GET(url_api)

      # Verificar se a requisição foi bem-sucedida (código de status na faixa 2xx)
      if (httr::http_error(response)) {
        # Se a requisição falhar, imprimir uma mensagem de erro detalhada
        stop("Falha na requisição. URL: ", url_api, ", Código de status: ", httr::status_code(response))
      }

      # Ler os dados JSON da resposta
      json_data <- jsonlite::fromJSON(httr::content(response, "text"))

      # Verificar se há relatorias disponíveis
      if (length(json_data$MateriasRelatoriaParlamentar$Parlamentar$Relatorias$Relatoria) > 0) {
        # Extrair dados relevantes e criar um dataframe
        relatorias <- json_data$MateriasRelatoriaParlamentar$Parlamentar$Relatorias$Relatoria
        parlamentar <- json_data$MateriasRelatoriaParlamentar$Parlamentar
        relatorias$Nome <- parlamentar$Nome
        relatorias$CodigoParlamentar <- parlamentar$Codigo

        # Adicionar o dataframe à lista
        lista_dataframes[[length(lista_dataframes) + 1]] <- relatorias
      } else {
        message("Nenhuma relatoria encontrada para o parlamentar ", codigo_parlamentar, " no ano ", ano)
      }
    }
  }

  # Verificar se foram encontradas relatorias
  if (length(lista_dataframes) == 0) {
    stop("Nenhuma relatoria encontrada para os parlamentares e anos fornecidos.")
  }

  # Retornar um único dataframe consolidado
  df_final <- dplyr::bind_rows(lista_dataframes)
  return(df_final)
}

