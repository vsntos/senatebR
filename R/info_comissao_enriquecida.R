#' Enriquece as informações das comissões permanentes
#'
#' Esta função extrai informações detalhadas sobre as comissões permanentes do site do Senado
#'
#' @param urls Vetor de URLs para extrair informações detalhadas.
#' @param tipo Tipo de comissão.
#' @return Um dataframe contendo informações detalhadas sobre as comissões permanentes.
#' @export
#'
#' @importFrom httr GET
#' @importFrom rvest read_html html_text html_node html_attr
#' @import dplyr
info_comissao_enriquecida <- function(urls, tipo) {
  dominio_base <- "https://legis.senado.leg.br/comissoes/"

  extrair_informacoes <- function(url) {
    resposta <- httr::GET(url, httr::user_agent("Mozilla/5.0"))
    pagina <- rvest::read_html(resposta)

    dados <- data.frame(
      url = url,
      titulo_comissao = rvest::html_text(pagina %>% rvest::html_node(xpath = "//div[@class='row']//h3[@class='hidden-xs comissao-permanente m15-top texto-com-reticencias color-comissao']")),
      Titulo = rvest::html_text(pagina %>% rvest::html_node("h6.tituloSecao span strong")),
      Presidente = rvest::html_text(pagina %>% rvest::html_node("p strong:contains('Presidente da comissão') + span")),
      Tipo = rvest::html_text(pagina %>% rvest::html_node("p strong:contains('Tipo') + span")),
      Situacao = rvest::html_text(pagina %>% rvest::html_node(xpath = "//p/strong[contains(text(), 'Situação atual:')]/following-sibling::text()[1]")),
      Quantidade_Membros = rvest::html_text(pagina %>% rvest::html_node(xpath = "//p/strong[contains(text(), 'Quantidade de Membros')]/following-sibling::text()[1]")),
      Reunioes = rvest::html_text(pagina %>% rvest::html_node(xpath = "//p/strong[contains(text(), 'Reuniões da CAE')]/following-sibling::text()[1]")),
      Secretario = rvest::html_text(pagina %>% rvest::html_node("ul.listaSemFormatacao li strong:contains('Secretário(a)') + span")),
      Telefone = rvest::html_text(pagina %>% rvest::html_node("ul.listaSemFormatacao li strong:contains('Telefone') + span")),
      Email = rvest::html_text(pagina %>% rvest::html_node("ul.listaSemFormatacao li strong:contains('E-mail') + span")),
      Secretaria = rvest::html_text(pagina %>% rvest::html_node("ul.listaSemFormatacao li strong:contains('Secretaria') + span")),
      Link_Composicao = rvest::html_attr(pagina %>% rvest::html_node("a[href*='composicao_comissao']"), "href")
    )

    dados$id_comissao <- stringr::str_extract(url, "id_comissao=\\d+")

    return(dados)
  }

  urls_completas <- paste0(dominio_base, urls)
  lista_dados <- lapply(urls_completas, extrair_informacoes)

  dados_enriquecidos <- dplyr::bind_rows(lista_dados) %>%
    dplyr::mutate(Tipo = tipo)

  return(dados_enriquecidos)
}
