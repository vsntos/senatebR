#' Coleta dados de votações de múltiplos senadores em múltiplos anos
#'
#' @param codigos_senadores Vetor de códigos de senadores.
#' @param anos Vetor de anos para a coleta de votações.
#'
#' @return Um data frame com as votações de todos os senadores e anos especificados.
#'
#' @import httr
#' @import jsonlite
#' @import dplyr
#' @import purrr
#' @export
#'
#' @examples
#' \dontrun{
#' codigos_senadores <- c("5386", "1234", "5678")
#' anos <- c(2023, 2024)
#' coletar_votacoes_multiplos(codigos_senadores, anos)
#' }
coletar_votacoes_multiplos <- function(codigos_senadores, anos) {

  # Função interna para coletar as votações de um senador em um ano
  coletar_votacoes_senador <- function(codigo_senador, ano) {
    # Construir a URL com o código do senador e ano
    url <- paste0("https://legis.senado.leg.br/dadosabertos/senador/", codigo_senador, "/votacoes?ano=", ano)

    # Fazer a requisição GET
    response <- GET(url)

    # Verificar se a requisição foi bem-sucedida
    if (status_code(response) == 200) {
      # Parsear o conteúdo JSON
      content_data <- content(response, as = "text", encoding = "UTF-8")
      json_data <- fromJSON(content_data, flatten = TRUE)

      # Verificar se há votações disponíveis
      if (!is.null(json_data$VotacaoParlamentar$Parlamentar$Votacoes$Votacao)) {
        # Converter o JSON em dataframe
        votacoes_df <- as.data.frame(json_data$VotacaoParlamentar$Parlamentar$Votacoes$Votacao)

        # Adicionar colunas com o código do senador e ano para referência
        votacoes_df <- votacoes_df %>%
          mutate(codigo_senador = codigo_senador, ano = ano)

        return(votacoes_df)
      } else {
        return(NULL)
      }
    } else {
      warning("Requisi\u00e7\u00e3o falhou para o senador ", codigo_senador, " no ano ", ano,
              " (HTTP ", httr::status_code(response), ")")
      return(NULL)
    }
  }

  # Gerar todas as combinações de senadores e anos
  combinacoes <- expand_grid(codigo_senador = codigos_senadores, ano = anos)

  # Aplicar a função coletar_votacoes_senador para cada combinação de senador e ano
  votacoes <- combinacoes %>%
    mutate(votacoes = map2(.data$codigo_senador, .data$ano, coletar_votacoes_senador)) %>%
    select(.data$codigo_senador, .data$ano, votacoes) %>%
    unnest(cols = votacoes, names_sep = "_")

  return(votacoes)
}
