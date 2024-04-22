#' Obter dados das comissões de parlamentares
#'
#' Esta função obtém dados das comissões de parlamentares com base em seus códigos.
#'
#' @param codigos_parlamentares Vetor contendo os códigos dos parlamentares.
#'
#' @return Um dataframe contendo os dados das comissões que parlamentares são ou foram membros.
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
    # Construir a URL com base no código parlamentar
    url <- paste0("https://legis.senado.leg.br/dadosabertos/senador/", codigo, "/comissoes")

    # Faça a requisição GET
    response <- httr::GET(url, httr::add_headers(accept = "application/json"))

    # Verifique se a requisição foi bem-sucedida (código de status na faixa 2xx)
    if (httr::status_code(response) >= 200 && httr::status_code(response) < 300) {
      # Leia os dados JSON da resposta
      json_data <- jsonlite::fromJSON(httr::content(response, "text"), flatten = TRUE)

      # Extraia os dados do parlamentar
      dados_id_senador <- json_data$MembroComissaoParlamentar$Parlamentar

      # Extraia os dados das comissões
      comissoes <- json_data$MembroComissaoParlamentar$Parlamentar$MembroComissoes$Comissao

      # Verifique se há dados de comissões disponíveis
      if (length(comissoes) > 0) {
        # Crie um dataframe com as informações das comissões
        df_senadores_comissao <- as.data.frame(comissoes, stringsAsFactors = FALSE)

        # Adicione as colunas com os dados do parlamentar
        df_senadores_comissao$CodigoParlamentar <- dados_id_senador$Codigo
        df_senadores_comissao$NomeParlamentar <- dados_id_senador$Nome

        # Reorganize as colunas para ter os dados do parlamentar no início
        df_senadores_comissao <- df_senadores_comissao[, c("CodigoParlamentar", "NomeParlamentar", names(df_senadores_comissao)[-grep("CodigoParlamentar|NomeParlamentar", names(df_senadores_comissao))])]

        # Adicione os dados ao resultado
        resultados[[codigo]] <- df_senadores_comissao
      } else {
        # Se não há dados, crie um dataframe vazio
        df_senadores_comissao <- data.frame(CodigoParlamentar = dados_id_senador$Codigo, NomeParlamentar = dados_id_senador$Nome)
        warning(paste("Não há dados de comissões disponíveis para o código:", codigo))
        resultados[[codigo]] <- df_senadores_comissao
      }
    } else {
      # Se a requisição falhar, imprima uma mensagem de erro e continue para o próximo código
      warning(paste("Falha na requisição para o código:", codigo, ". Código de status:", httr::status_code(response)))
      next
    }
  }

  # Unir todos os resultados em um único dataframe
  dados_comissoes_parlamentares <- dplyr::bind_rows(resultados)
  return(dados_comissoes_parlamentares)
}


