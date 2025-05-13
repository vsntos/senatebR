#' Coleta dados de vota\u00e7\u00f5es de m\u00faltiplos senadores em m\u00faltiplos anos
#'
#' @param codigos_senadores Vetor de c\u00f3digos de senadores.
#' @param anos Vetor de anos para a coleta de vota\u00e7\u00f5es.
#'
#' @return Um data frame com as vota\u00e7\u00f5es de todos os senadores e anos especificados.
#'
#' @import httr
#' @import jsonlite
#' @import dplyr
#' @import purrr
#' @export
#'
#' @examples
#' codigos_senadores <- c("5386", "1234", "5678")
#' anos <- c(2023, 2024)
#' coletar_votacoes_multiplos(codigos_senadores, anos)
coletar_votacoes_multiplos <- function(codigos_senadores, anos) {

  # Fun\u00e7\u00e3o interna para coletar as vota\u00e7\u00f5es de um senador em um ano
  coletar_votacoes_senador <- function(codigo_senador, ano) {
    # Construir a URL com o c\u00f3digo do senador e ano
    url <- paste0("https://legis.senado.leg.br/dadosabertos/senador/", codigo_senador, "/votacoes?ano=", ano)

    # Fazer a requisi\u00e7\u00e3o GET
    response <- GET(url)

    # Verificar se a requisi\u00e7\u00e3o foi bem-sucedida
    if (status_code(response) == 200) {
      # Parsear o conte\u00fado JSON
      content_data <- content(response, as = "text", encoding = "UTF-8")
      json_data <- fromJSON(content_data, flatten = TRUE)

      # Verificar se h\u00e1 vota\u00e7\u00f5es dispon\u00edveis
      if (!is.null(json_data$VotacaoParlamentar$Parlamentar$Votacoes$Votacao)) {
        # Converter o JSON em dataframe
        votacoes_df <- as.data.frame(json_data$VotacaoParlamentar$Parlamentar$Votacoes$Votacao)

        # Adicionar colunas com o c\u00f3digo do senador e ano para refer\u00eancia
        votacoes_df <- votacoes_df %>%
          mutate(codigo_senador = codigo_senador, ano = ano)

        return(votacoes_df)
      } else {
        return(NULL)
      }
    } else {
      return(NULL)
    }
  }

  # Gerar todas as combina\u00e7\u00f5es de senadores e anos
  combinacoes <- expand_grid(codigo_senador = codigos_senadores, ano = anos)

  # Aplicar a fun\u00e7\u00e3o coletar_votacoes_senador para cada combina\u00e7\u00e3o de senador e ano
  votacoes <- combinacoes %>%
    mutate(votacoes = map2(codigo_senador, ano, coletar_votacoes_senador)) %>%
    select(codigo_senador, ano, votacoes) %>%
    unnest(cols = votacoes, names_sep = "_")

  return(votacoes)
}
