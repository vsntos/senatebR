#' Obtém informações sobre reuniões do Senado Federal
#'
#' Esta função faz requisições à API de dados abertos do Senado Federal para obter informações sobre
#' reuniões de acordo com os anos e meses especificados.
#'
#' @param ano Vetor contendo os anos desejados.
#' @param mes Vetor contendo os meses desejados.
#' @return Um dataframe contendo informações sobre as reuniões.
#' @seealso [API de dados abertos do Senado Federal](https://www.senado.leg.br/dadosabertos/docs/resource_agendaReuniao.html)
#' @export
#'
#' @examples
#' \dontrun{
#' # Exemplo de uso com vetores
#' ano <- c(2022, 2023)
#' mes <- c(08, 09, 10, 11, 12)
#' df_reunioes <- get_reunioes(ano = rep(ano, each = length(mes)), mes = rep(mes, length(ano)))
#' }
get_reunioes <- function(ano, mes) {
  # Combine 'ano' e 'mes' em um único dataframe
  df_params <- expand.grid(ano = ano, mes = mes)

  # Inicialize um dataframe vazio para armazenar os resultados
  df_total <- data.frame()

  # Itere sobre cada linha do dataframe de parâmetros
  for (i in seq(nrow(df_params))) {
    # Construa a URL com base nos parâmetros de ano e mês
    url_reunioes <- sprintf("https://legis.senado.leg.br/dadosabertos/agendareuniao/mes/%d%02d", df_params$ano[i], df_params$mes[i])

    # Faça a requisição GET
    response <- httr::GET(url_reunioes, httr::add_headers(accept = "application/json"))

    # Verifique se a requisição foi bem-sucedida (código de status na faixa 2xx)
    if (httr::status_code(response) >= 200 && httr::status_code(response) < 300) {
      # Leia os dados JSON da resposta
      json_data <- jsonlite::fromJSON(httr::content(response, "text"), flatten = TRUE)

      # Extraia a coluna 'reuniao' como um dataframe, tratando diferentes estruturas
      df_reuniao <- json_data$AgendaReuniao$reunioes$reuniao

      # Adicione o dataframe à lista de resultados
      df_total <- dplyr::bind_rows(df_total, df_reuniao)
    } else {
      # Se a requisição falhar, imprima uma mensagem de erro
      warning(paste("Falha na requisição para", url_reunioes, ". Código de status:", httr::status_code(response)))
    }
  }

  # Retorne o dataframe consolidado
  return(df_total)
}
