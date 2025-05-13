#' Obter dados das comiss\u00f5es de parlamentares
#'
#' Esta fun\u00e7\u00e3o obt\u00e9m dados das comiss\u00f5es de parlamentares com base em seus c\u00f3digos.
#'
#' @param codigos_parlamentares Vetor contendo os c\u00f3digos dos parlamentares.
#'
#' @return Um dataframe contendo os dados das comiss\u00f5es que parlamentares s\u00e3o ou foram membros.
#'
#' @examples
#' codigos_senadores <- c(5386, 5012)
#' df_comissoes_parlamentares <- obter_dados_comissoes_parlamentares(codigos_senadores)
#'
#' @import httr
#' @import jsonlite
#'
#' @export
obter_dados_comissoes_parlamentares <- function(codigos_parlamentares) {
  # Lista para armazenar os resultados
  resultados <- list()

  for (codigo in codigos_parlamentares) {
    # Construir a URL com base no c\u00f3digo parlamentar
    url <- paste0("https://legis.senado.leg.br/dadosabertos/senador/", codigo, "/comissoes")

    # Fa\u00e7a a requisi\u00e7\u00e3o GET
    response <- httr::GET(url, httr::add_headers(accept = "application/json"))

    # Verifique se a requisi\u00e7\u00e3o foi bem-sucedida (c\u00f3digo de status na faixa 2xx)
    if (httr::status_code(response) >= 200 && httr::status_code(response) < 300) {
      # Leia os dados JSON da resposta
      json_data <- jsonlite::fromJSON(httr::content(response, "text"), flatten = TRUE)

      # Extraia os dados do parlamentar
      dados_id_senador <- json_data$MembroComissaoParlamentar$Parlamentar

      # Verifique se h\u00e1 dados de comiss\u00f5es dispon\u00edveis
      if (!is.null(json_data$MembroComissaoParlamentar$Parlamentar$MembroComissoes$Comissao)) {
        # Extraia os dados das comiss\u00f5es
        comissoes <- json_data$MembroComissaoParlamentar$Parlamentar$MembroComissoes$Comissao

        # Crie um dataframe com as informa\u00e7\u00f5es das comiss\u00f5es
        df_senadores_comissao <- as.data.frame(comissoes, stringsAsFactors = FALSE)

        # Adicione as colunas com os dados do parlamentar
        df_senadores_comissao$CodigoParlamentar <- dados_id_senador$Codigo
        df_senadores_comissao$NomeParlamentar <- dados_id_senador$Nome

        # Reorganize as colunas para ter os dados do parlamentar no in\u00edcio
        df_senadores_comissao <- df_senadores_comissao[, c("CodigoParlamentar", "NomeParlamentar", names(df_senadores_comissao)[-grep("CodigoParlamentar|NomeParlamentar", names(df_senadores_comissao))])]

        # Adicione os dados ao resultado
        resultados[[codigo]] <- df_senadores_comissao
      } else {
        # Se n\u00e3o h\u00e1 dados de comiss\u00f5es, crie um dataframe vazio
        df_senadores_comissao <- data.frame(CodigoParlamentar = dados_id_senador$Codigo, NomeParlamentar = dados_id_senador$Nome)
        warning(paste("Nao ha dados de comissoes disponiveis para o codigo:", codigo))
        resultados[[codigo]] <- df_senadores_comissao
      }
    } else {
      # Se a requisi\u00e7\u00e3o falhar, imprima uma mensagem de erro e continue para o pr\u00f3ximo c\u00f3digo
      warning(paste("Falha na requisi\u00e7\u00e3o para o codigo:", codigo, ". Codigo de status:", httr::status_code(response)))
      next
    }
  }

  # Unir todos os resultados em um \u00fanico dataframe
  dados_comissoes_parlamentares <- dplyr::bind_rows(resultados)
  return(dados_comissoes_parlamentares)
}



