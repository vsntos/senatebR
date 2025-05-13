#' Obt\u00e9m dados dos partidos dos senadores a partir da API do Senado
#'
#' Esta fun\u00e7\u00e3o realiza uma requisi\u00e7\u00e3o \u00e0 API do Senado para obter informa\u00e7\u00f5es sobre os partidos.
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

  # Fa\u00e7a a requisi\u00e7\u00e3o GET
  response <- httr::GET(url, httr::add_headers(accept = "application/json"))

  # Verifique se a requisi\u00e7\u00e3o foi bem-sucedida (c\u00f3digo de status na faixa 2xx)
  if (httr::status_code(response) >= 200 && httr::status_code(response) < 300) {
    # Leia os dados JSON da resposta
    json_data <- httr::content(response, "text", encoding = "UTF-8") %>%
      jsonlite::fromJSON(simplifyVector = FALSE)

    # Verifique se h\u00e1 dados dispon\u00edveis
    if (!is.null(json_data$ListaPartidos$Partidos$Partido)) {
      # Extrai os dados dos partidos
      df_partidos <- json_data$ListaPartidos$Partidos$Partido %>%
        dplyr::bind_rows()

      # Retorna o dataframe com os dados dos partidos
      return(df_partidos)
    } else {
      # Se n\u00e3o houver dados dispon\u00edveis, retorna NULL ou uma mensagem adequada
      warning("N\u00e3o foram encontrados dados de partidos na resposta da API.")
      return(NULL)
    }
  } else {
    # Se a requisi\u00e7\u00e3o falhar, imprima uma mensagem de erro
    stop("Falha na requisi\u00e7\u00e3o. C\u00f3digo de status: ", httr::status_code(response))
  }
}

