#' Obtém dados dos partidos dos senadores a partir da API do Senado
#'
#' Esta função realiza uma requisição à API do Senado para obter informações sobre os partidos dos senadores.
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
  url <- "https://legis.senado.leg.br/dadosabertos/senador/partidos"

  # Faça a requisição GET
  response <- httr::GET(url, httr::add_headers(accept = "application/json"))

  # Verifique se a requisição foi bem-sucedida (código de status na faixa 2xx)
  if (httr::status_code(response) >= 200 && httr::status_code(response) < 300) {
    # Leia os dados JSON da resposta
    json_data <- jsonlite::fromJSON(httr::content(response, "text"))

    # Agora você pode trabalhar com os dados como quiser
    df_partidos <- json_data$ListaPartidos$Partidos$Partido
    return(df_partidos)
  } else {
    # Se a requisição falhar, imprima uma mensagem de erro
    stop("Falha na requisição. Código de status: ", httr::status_code(response))
  }
}
