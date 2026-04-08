#' Coleta dados básicos das comissões permanentes
#'
#' Esta função realiza a raspagem de dados básicos das comissões permanentes do site do Senado.
#'
#' @return Um dataframe contendo dados básicos das comissões permanentes.
#'
#' @examples
#' dados_comissoes <- dados_comissoes()
#'
#' @importFrom rvest read_html html_nodes html_text html_attr
#' @importFrom tidyr separate
#' @import dplyr
#'
#' @export
dados_comissoes <- function() {
  url <- "https://legis.senado.leg.br/comissoes/"
  pagina <- tryCatch(
    rvest::read_html(url),
    error = function(e) {
      warning("Erro ao acessar a p\u00e1gina de comiss\u00f5es: ", conditionMessage(e))
      return(NULL)
    }
  )
  if (is.null(pagina)) return(NULL)

  elementos <- pagina %>%
    rvest::html_nodes("div p a.textos-links")

  dados_basicos <- data.frame(
    Texto = rvest::html_text(elementos),
    Link = rvest::html_attr(elementos, "href")
  )

  dados_basicos <- dados_basicos %>%
    tidyr::separate("Texto", c("sigla", "titulo_comissao"), " - ") %>%
    dplyr::mutate(id_comissao = sub(".+id=", "", .data$Link)) %>%
    dplyr::select(-.data$Link)

  return(dados_basicos)
}

