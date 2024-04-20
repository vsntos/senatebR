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
#' df_relatorias <- obter_relatorias_parlamentares(codigos_parlamentares = c(6331, 1234), anos = c(2022, 2023))
#' print(df_relatorias)
#'
#' @import httr
#' @import jsonlite
#' @import rvest
#' @import dplyr
#' @importFrom httr GET
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr bind_rows
#'
#' @export
obter_relatorias_parlamentares <- function(codigos_parlamentares, anos) {
  # Inicializar uma lista para armazenar os dataframes individuais
  lista_dataframes <- list()

  # Iterar sobre os códigos de parlamentares e anos
  for (codigo_parlamentar in codigos_parlamentares) {
    for (ano in anos) {
      # Construir a URL da API com os parâmetros fornecidos
      url_api <- paste0("https://legis.senado.leg.br/dadosabertos/senador/",
                        codigo_parlamentar, "/relatorias?ano=", ano)

      # Fazer a requisição GET
      response <- httr::GET(url_api, add_headers(accept = "application/json"))

      # Verificar se a requisição foi bem-sucedida (código de status na faixa 2xx)
      if (httr::status_code(response) >= 200 && httr::status_code(response) < 300) {
        # Ler os dados JSON da resposta
        json_data <- jsonlite::fromJSON(httr::content(response, "text"))

        # Extrair dados relevantes e criar um dataframe
        parlamentar <- json_data$MateriasRelatoriaParlamentar$Parlamentar
        relatorias <- parlamentar$Relatorias$Relatoria

        # Adicionar informações do parlamentar ao dataframe
        relatorias$Nome <- parlamentar$Nome
        relatorias$CodigoParlamentar <- parlamentar$Codigo

        # Adicionar o dataframe à lista
        lista_dataframes[[length(lista_dataframes) + 1]] <- relatorias
      } else {
        # Se a requisição falhar, imprimir uma mensagem de erro
        stop("Falha na requisição. Código de status: ", httr::status_code(response))
      }
    }
  }

  # Retornar um único dataframe consolidado
  df_final <- dplyr::bind_rows(lista_dataframes)
  return(df_final)
}
