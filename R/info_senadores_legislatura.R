#' Obter dados dos senadores por legislatura
#'
#' Esta função realiza requisições HTTP para obter informações dos senadores
#' com base nas legislaturas fornecidas.
#'
#' @param legislatura_inicio Número da legislatura de início.
#' @param legislatura_fim Número da legislatura de fim.
#' @return Um dataframe com os dados dos senadores.
#' @export
#'
#' @examples
#'df_senadores_legislatura <- obter_dados_senadores_legislatura(47, 56)
#'print(df_senadores_legislatura)
#'
#' @import httr
#' @importFrom jsonlite fromJSON
#'
#' @references
#' Informações sobre os senadores são obtidas da API de dados abertos do Senado Brasileiro.
#'
#' @keywords senador legislatura API
#'
obter_dados_senadores_legislatura <- function(legislatura_inicio, legislatura_fim) {
  # Construa a URL com base nas legislaturas fornecidas
  url <- paste0("https://legis.senado.leg.br/dadosabertos/senador/lista/legislatura/", legislatura_inicio, "/", legislatura_fim)

  # Faça a requisição GET
  response <- httr::GET(url, httr::add_headers(accept = "application/json"))

  # Verifique se a requisição foi bem-sucedida (código de status na faixa 2xx)
  if (httr::status_code(response) >= 200 && httr::status_code(response) < 300) {
    # Leia os dados JSON da resposta
    json_data <- jsonlite::fromJSON(httr::content(response, "text"), flatten = TRUE)

    # Acesse os dados dos parlamentares
    df_parlamentares <- json_data$ListaParlamentarLegislatura$Parlamentares$Parlamentar

    # Verifique se há dados disponíveis
    if (length(df_parlamentares) > 0) {
      # Crie um dataframe com as informações dos senadores
      df_senadores <- data.frame(df_parlamentares, stringsAsFactors = FALSE)
    } else {
      # Se não há dados, crie um dataframe vazio
      df_senadores <- data.frame()
      warning("Não há dados de senadores disponíveis para as legislaturas fornecidas.")
    }
  } else {
    # Se a requisição falhar, imprima uma mensagem de erro
    stop("Falha na requisição. Código de status: ", httr::status_code(response))
  }

  # Retorne o dataframe com os dados dos senadores
  return(df_senadores)
}

