#' Coleta os dados dos Senadores afastados
#'
#' @return Um dataframe contendo os dados dos senadores afastados.
#'
#' @examples
#' df_senadores_afastados <- get_afastados()
#'
#' @import httr
#' @importFrom jsonlite fromJSON
#'
#' @export
get_afastados <- function() {
  # Defina a URL da API
  url_senadores_afastados <- "https://legis.senado.leg.br/dadosabertos/senador/lista/afastados"

  # Fa\u00e7a a requisi\u00e7\u00e3o GET
  response <- httr::GET(url_senadores_afastados, httr::add_headers(accept = "application/json"))

  # Verifique se a requisi\u00e7\u00e3o foi bem-sucedida (c\u00f3digo de status na faixa 2xx)
  if (httr::status_code(response) >= 200 && httr::status_code(response) < 300) {
    # Leia os dados JSON da resposta
    json_data <- httr::content(response, "text", encoding = "UTF-8")
    df_afastados <- jsonlite::fromJSON(json_data, simplifyDataFrame = TRUE)

    # Retorna o dataframe
    return(df_afastados)
  } else {
    # Se a requisi\u00e7\u00e3o falhar, imprima uma mensagem de erro
    stop("Falha na requisi\u00e7\u00e3o. C\u00f3digo de status: ", httr::status_code(response))
  }
}

