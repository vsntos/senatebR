#' Coleta dados b\u00e1sicos das comiss\u00f5es permanentes
#'
#' Esta fun\u00e7\u00e3o realiza a raspagem de dados b\u00e1sicos das comiss\u00f5es permanentes do site do Senado.
#'
#' @return Um dataframe contendo dados b\u00e1sicos das comiss\u00f5es permanentes.
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
  pagina <- rvest::read_html(url)

  elementos <- pagina %>%
    rvest::html_nodes("div p a.textos-links")

  dados_basicos <- data.frame(
    Texto = rvest::html_text(elementos),
    Link = rvest::html_attr(elementos, "href")
  )

  dados_basicos <- dados_basicos %>%
    tidyr::separate(Texto, c("sigla", "titulo_comissao"), " - ") %>%
    dplyr::mutate(id_comissao = sub(".+id=", "", Link)) %>%
    dplyr::select(-Link)

  return(dados_basicos)
}

