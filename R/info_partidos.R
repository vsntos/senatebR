#' Obtém dados dos partidos dos senadores a partir da API do Senado
#'
#' Esta função realiza uma requisição à API do Senado para obter informações sobre os partidos.
#'
#' @return Um dataframe contendo dados dos partidos.
#'
#' @examples
#' df_partidos <- obter_dados_partidos()
#'
#' @importFrom httr GET
#' @importFrom jsonlite fromJSON
#' @import dplyr
#'
#' @export
obter_dados_partidos <- function() {
  # URL da API para obter os dados dos partidos
  url <- "https://legis.senado.leg.br/dadosabertos/senador/partidos"

  # Faça a requisição GET
  response <- httr::GET(url, httr::add_headers(accept = "application/json"))

  # Verifique se a requisição foi bem-sucedida (código de status na faixa 2xx)
  if (httr::status_code(response) >= 200 && httr::status_code(response) < 300) {
    # Leia os dados JSON da resposta
    json_data <- httr::content(response, "text", encoding = "UTF-8") %>%
      jsonlite::fromJSON(simplifyVector = FALSE)

    # Verifique se há dados disponíveis
    if (!is.null(json_data$ListaPartidos$Partidos$Partido)) {
      # Extrai os dados dos partidos
      df_partidos <- json_data$ListaPartidos$Partidos$Partido %>%
        dplyr::bind_rows()

      # Retorna o dataframe com os dados dos partidos
      return(df_partidos)
    } else {
      # Se não houver dados disponíveis, retorna NULL ou uma mensagem adequada
      warning("Não foram encontrados dados de partidos na resposta da API.")
      return(NULL)
    }
  } else {
    # Se a requisição falhar, imprima uma mensagem de erro
    stop("Falha na requisição. Código de status: ", httr::status_code(response))
  }
}

