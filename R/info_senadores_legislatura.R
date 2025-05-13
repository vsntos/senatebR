#' Obter dados dos senadores por legislatura
#'
#' Esta fun\u00e7\u00e3o realiza requisi\u00e7\u00f5es HTTP para obter informa\u00e7\u00f5es dos senadores
#' com base nas legislaturas fornecidas.
#'
#' @param legislatura_inicio N\u00famero da legislatura de in\u00edcio.
#' @param legislatura_fim N\u00famero da legislatura de fim.
#'
#' @return Um dataframe com os dados dos senadores.
#'
#' @examples
#' df_senadores_legislatura <- obter_dados_senadores_legislatura(47, 56)
#'
#' @import httr
#' @importFrom jsonlite fromJSON
#'
#' @references
#' Informa\u00e7\u00f5es sobre os senadores s\u00e3o obtidas da API de dados abertos do Senado Brasileiro.
#'
#' @keywords senador legislatura API
#'
#' @export
obter_dados_senadores_legislatura <- function(legislatura_inicio, legislatura_fim) {
  requireNamespace("httr", quietly = TRUE)
  requireNamespace("jsonlite", quietly = TRUE)

  # Construa a URL com base nas legislaturas fornecidas
  url <- paste0("https://legis.senado.leg.br/dadosabertos/senador/lista/legislatura/", legislatura_inicio, "/", legislatura_fim)

  # Fa\u00e7a a requisi\u00e7\u00e3o GET
  response <- httr::GET(url, httr::add_headers(accept = "application/json"))

  # Verifique se a requisi\u00e7\u00e3o foi bem-sucedida (c\u00f3digo de status na faixa 2xx)
  if (httr::status_code(response) >= 200 && httr::status_code(response) < 300) {
    # Leia os dados JSON da resposta
    json_data <- jsonlite::fromJSON(httr::content(response, "text"), flatten = TRUE)

    # Acesse os dados dos parlamentares
    df_parlamentares <- json_data$ListaParlamentarLegislatura$Parlamentares$Parlamentar

    # Verifique se h\u00e1 dados dispon\u00edveis
    if (length(df_parlamentares) > 0) {
      # Crie um dataframe com as informa\u00e7\u00f5es dos senadores
      df_senadores <- data.frame(df_parlamentares, stringsAsFactors = FALSE)
    } else {
      # Se n\u00e3o h\u00e1 dados, crie um dataframe vazio
      df_senadores <- data.frame()
      warning("N\u00e3o h\u00e1 dados de senadores dispon\u00edveis para as legislaturas fornecidas.")
    }
  } else {
    # Se a requisi\u00e7\u00e3o falhar, imprima uma mensagem de erro
    stop("Falha na requisi\u00e7\u00e3o. C\u00f3digo de status: ", httr::status_code(response))
  }

  # Retorne o dataframe com os dados dos senadores
  return(df_senadores)
}


