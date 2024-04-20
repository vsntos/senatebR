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

enriquecer_dados_comissao <- function(urls, tipo) {
  dominio_base <- "https://legis.senado.leg.br/comissoes/"

  extrair_informacoes <- function(url) {
    resposta <- GET(url, user_agent("Mozilla/5.0"))
    pagina <- read_html(url)

    dados <- data.frame(
      url = url,
      titulo_comissao = html_text(pagina %>% html_node(xpath = "//div[@class='row']//h3[@class='hidden-xs comissao-permanente m15-top texto-com-reticencias color-comissao']") %>% html_text(trim = TRUE)),
      Titulo = html_text(pagina %>% html_node("h6.tituloSecao span strong") %>% html_text(trim = TRUE)),
      Presidente = html_text(pagina %>% html_node("p strong:contains('Presidente da comissão') + span") %>% html_text(trim = TRUE)),
      Tipo = html_text(pagina %>% html_node("p strong:contains('Tipo') + span") %>% html_text(trim = TRUE)),
      Situacao = html_text(pagina %>% html_node(xpath = "//p/strong[contains(text(), 'Situação atual:')]/following-sibling::text()[1]") %>% html_text(trim = TRUE)),
      Quantidade_Membros = html_text(pagina %>% html_node(xpath = "//p/strong[contains(text(), 'Quantidade de Membros')]/following-sibling::text()[1]") %>% html_text(trim = TRUE)),
      Reunioes = html_text(pagina %>% html_node(xpath = "//p/strong[contains(text(), 'Reuniões da CAE')]/following-sibling::text()[1]") %>% html_text(trim = TRUE)),
      Secretario = html_text(pagina %>% html_node("ul.listaSemFormatacao li strong:contains('Secretário(a)') + span") %>% html_text(trim = TRUE)),
      Telefone = html_text(pagina %>% html_node("ul.listaSemFormatacao li strong:contains('Telefone') + span") %>% html_text(trim = TRUE)),
      Email = html_text(pagina %>% html_node("ul.listaSemFormatacao li strong:contains('E-mail') + span") %>% html_text(trim = TRUE)),
      Secretaria = html_text(pagina %>% html_node("ul.listaSemFormatacao li strong:contains('Secretaria') + span") %>% html_text(trim = TRUE)),
      Link_Composicao = html_attr(pagina %>% html_node("a[href*='composicao_comissao']"), "href")
    )

    dados$id_comissao <- str_extract(url, "id_comissao=\\d+")

    return(dados)
  }

  urls_completas <- paste0(dominio_base, urls)
  lista_dados <- lapply(urls_completas, extrair_informacoes)

  dados_enriquecidos <- do.call(rbind, lista_dados) %>%
    mutate(Tipo = tipo)

  return(dados_enriquecidos)
}


