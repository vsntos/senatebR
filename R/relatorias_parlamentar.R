#' Obter relatorias de parlamentares
#'
#' Esta fun\u00e7\u00e3o obt\u00e9m as relatorias de parlamentares com base nos c\u00f3digos e anos fornecidos.
#'
#' @param codigos_parlamentares Vetor de c\u00f3digos de parlamentares.
#' @param anos Vetor de anos.
#'
#' @return Um dataframe consolidado com todas as relatorias dos parlamentares escolhidos
#'
#' @examples
#' # Exemplo de uso
#' df_relatorias <- dados_relatorias_parlamentares(c(5386, 5012), anos = c(2022, 2023))
#'
#' @importFrom httr GET add_headers status_code content
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr bind_rows
#'
#' @export
dados_relatorias_parlamentares <- function(codigos_parlamentares, anos) {
  # Inicializar uma lista para armazenar os dataframes individuais
  lista_dataframes <- list()

  # Iterar sobre os c\u00f3digos de parlamentares e anos
  for (codigo_parlamentar in codigos_parlamentares) {
    for (ano in anos) {
      # Construir a URL da API com os par\u00e2metros fornecidos
      url_api <- paste0("https://legis.senado.leg.br/dadosabertos/senador/",
                        codigo_parlamentar, "/relatorias?ano=", ano)

      # Fazer a requisi\u00e7\u00e3o GET com tratamento de erros
      response <- tryCatch({
        httr::GET(url_api, httr::add_headers(accept = "application/json"))
      }, error = function(e) {
        warning("Falha na requisi\u00e7\u00e3o para o parlamentar ", codigo_parlamentar, " no ano ", ano, ". Detalhes: ", e$message)
        return(NULL)
      })

      if (!is.null(response) && httr::status_code(response) >= 200 && httr::status_code(response) < 300) {
        # Ler os dados JSON da resposta
        json_data <- jsonlite::fromJSON(httr::content(response, "text"))

        # Verificar se os dados est\u00e3o no formato esperado
        if (!is.null(json_data$MateriasRelatoriaParlamentar$Parlamentar$Relatorias$Relatoria)) {
          # Extrair dados relevantes e criar um dataframe
          parlamentar <- json_data$MateriasRelatoriaParlamentar$Parlamentar
          relatorias <- parlamentar$Relatorias$Relatoria

          # Adicionar informa\u00e7\u00f5es do parlamentar ao dataframe
          relatorias$Nome <- parlamentar$Nome
          relatorias$CodigoParlamentar <- parlamentar$Codigo

          # Adicionar o dataframe \u00e0 lista
          lista_dataframes[[length(lista_dataframes) + 1]] <- relatorias
        } else {
          warning("Dados de relatorias n\u00e3o encontrados para o parlamentar ", codigo_parlamentar, " no ano ", ano)
        }
      }
    }
  }

  # Retornar um \u00fanico dataframe consolidado
  df_final <- dplyr::bind_rows(lista_dataframes)
  return(df_final)
}


