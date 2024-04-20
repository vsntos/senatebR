#' Coleta dados básicos das comissões permanentes
#'
#' Esta função realiza a raspagem de dados básicos das comissões permanentes do site do Senado.
#'
#' @return Um dataframe contendo dados básicos das comissões permanentes.
#'
#' @examples
#' dados_comissoes <- get_dados_comissoes()
#'
#' @importFrom rvest read_html html_nodes html_text html_attr
#' @importFrom tidyr separate
#' @import dplyr
#'
#' @export
get_dados_comissoes <- function() {
  url <- "https://legis.senado.leg.br/comissoes/"
  pagina <- rvest::read_html(url)

  elementos <- pagina %>%
    rvest::html_nodes("div p a.textos-links")

  dados_basicos <- data.frame(
    Texto = rvest::html_text(elementos),
    Link = rvest::html_attr(elementos, "href")
  )

  dados_basicos <- dados_basicos %>%
    tidyr::separate(Texto, c("sigla", "titulo_comissao"), "\\s+-\\s+") %>%
    dplyr::mutate(id_comissao = sub(".+id=", "", Link)) %>%
    dplyr::filter(!is.na(titulo_comissao))

  return(dados_basicos)
}

