#' Obter dados acadêmicos de senadores com base nos códigos parlamentares
#'
#' Esta função realiza requisições HTTP para obter informações acadêmicas de senadores
#' com base em códigos parlamentares fornecidos.
#'
#' @param codigos Vetor de códigos parlamentares.
#' @return Um dataframe com os dados acadêmicos.
#' @export
#' @examples
#' codigos <- c(1234, 5678)
#' dados <- obter_dados_academicos(codigos)
#'
#' @import httr
#' @importFrom jsonlite fromJSON
#' @import tidyr
#' @import dplyr
#' @import lubridate
#'
#' @references
#' Informações sobre os senadores são obtidas da API de dados abertos do Senado Brasileiro.
#'
#' @seealso
#' \code{\link{obter_dados_senadores_legislatura}}
#'
#' @keywords senador dados acadêmicos API
#' @export
obter_dados_academicos <- function(codigos) {
  dados_academicos <- purrr::map_df(codigos, ~ {
    url <- paste0("https://legis.senado.leg.br/dadosabertos/senador/", .x, "/historicoAcademico")
    response <- httr::GET(url, httr::add_headers(accept = "application/json"))

    if (httr::status_code(response) >= 200 && httr::status_code(response) < 300) {
      json_data <- jsonlite::fromJSON(httr::content(response, "text"), flatten = TRUE)

      codigo <- json_data$HistoricoAcademicoParlamentar$Parlamentar$Codigo
      nome <- json_data$HistoricoAcademicoParlamentar$Parlamentar$Nome
      historico_academico <- json_data$HistoricoAcademicoParlamentar$Parlamentar$HistoricoAcademico

      if (length(historico_academico) > 0) {
        dados <- as.data.frame(historico_academico, stringsAsFactors = FALSE)
        dados$Codigo <- rep(codigo, each = nrow(dados))
        dados$Nome <- rep(nome, each = nrow(dados))
        return(dados)
      } else {
        dados <- data.frame(Codigo = NA, Nome = NA, NomeCurso = NA, GrauInstrucao = NA, Estabelecimento = NA)
        dados$Codigo <- codigo
        dados$Nome <- nome
        warning(paste("Não há dados de histórico acadêmico disponíveis para o código:", .x))
        return(dados)
      }
    } else {
      stop("Falha na requisição para o código ", .x, ". Código de status: ", httr::status_code(response))
    }
  })

  return(dados_academicos)
}
