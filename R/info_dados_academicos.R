#' Obter dados acad\u00eamicos de senadores com base nos c\u00f3digos parlamentares
#'
#' Esta fun\u00e7\u00e3o realiza requisi\u00e7\u00f5es para obter informa\u00e7\u00f5es acad\u00eamicas de senadores
#' com base em c\u00f3digos parlamentares fornecidos.
#'
#' @param codigos Vetor de c\u00f3digos parlamentares.
#' @return Um dataframe com os dados acad\u00eamicos.
#'
#' @examples
#' codigos <- c(5672, 5386)
#' dados <- dados_academicos(codigos)
#'
#' @import httr
#' @importFrom jsonlite fromJSON
#' @import tidyr
#' @import dplyr
#' @import lubridate
#'
#' @references
#' Informa\u00e7\u00f5es sobre os senadores s\u00e3o obtidas da API de dados abertos do Senado Brasileiro.
#'
#' @seealso
#' \code{\link{obter_dados_senadores_legislatura}}
#'
#' @keywords senador dados acad\u00eamicos API
#' @export
dados_academicos <- function(codigos) {
  tryCatch({
    dados_academicos <- purrr::map_df(codigos, ~ {
      url <- paste0("https://legis.senado.leg.br/dadosabertos/senador/", .x, "/historicoAcademico")
      response <- httr::GET(url, httr::add_headers(accept = "application/json"))

      if (httr::status_code(response) >= 200 && httr::status_code(response) < 300) {
        json_data <- jsonlite::fromJSON(httr::content(response, "text"), flatten = TRUE)

        codigo <- json_data$Parlamentar$Codigo
        nome <- json_data$Parlamentar$Nome
        historico_academico <- json_data$Parlamentar$HistoricoAcademico

        if (length(historico_academico) > 0) {
          dados <- as.data.frame(historico_academico, stringsAsFactors = FALSE)
          dados$Codigo <- rep(codigo, each = nrow(dados))
          dados$Nome <- rep(nome, each = nrow(dados))
          return(dados)
        } else {
          dados <- data.frame(Codigo = NA, Nome = NA, NomeCurso = NA, GrauInstrucao = NA, Estabelecimento = NA)
          dados$Codigo <- codigo
          dados$Nome <- nome
          warning(paste("Nao ha dados de historico academico disponiveis para o codigo:", .x))
          return(dados)
        }
      } else {
        stop("Falha na requisicao para o codigo ", .x, ". Codigo de status: ", httr::status_code(response))
      }
    })

    return(dados_academicos)

  }, error = function(e) {
    cat("Erro ao obter dados acad\u00eamicos dos senadores.\n")
    cat("Mensagem de erro:", conditionMessage(e), "\n")
    return(NULL)
  })
}

