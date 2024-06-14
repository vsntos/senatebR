#' Coleta os dados dos Senadores afastados
#'
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

  # Faça a requisição GET
  response <- httr::GET(url_senadores_afastados, httr::add_headers(accept = "application/json"))

  # Verifique se a requisição foi bem-sucedida (código de status na faixa 2xx)
  if (httr::status_code(response) >= 200 && httr::status_code(response) < 300) {
    # Leia os dados JSON da resposta
    json_data <- jsonlite::fromJSON(httr::content(response, "text"))

    # Converte os dados JSON em um dataframe
    df_afastados <- as.data.frame(json_data)

    # Retorna o dataframe
    return(df_afastados)
  } else {
    # Se a requisição falhar, imprima uma mensagem de erro
    stop("Falha na requisição. Código de status: ", httr::status_code(response))
  }
}

