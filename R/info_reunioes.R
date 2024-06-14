#' Extrair dados de reuniões de comissões do Senado
#'
#' Esta função extrai dados de reuniões de comissões do Senado Federal
#' com base nos códigos das comissões e no intervalo de datas fornecido.
#'
#' @param codcol Vetor contendo os códigos das comissões
#' @param data_inicio Data de início no formato "YYYY-MM-DD"
#' @param data_fim Data de fim no formato "YYYY-MM-DD"
#' @return Um DataFrame com os dados das reuniões das comissões
#' @importFrom rvest read_html html_elements html_text html_attr
#' @importFrom dplyr %>%
#' @importFrom glue glue
#' @export
#' @examples
#' codcol <- c(54, 38, 2614, 34)
#' data_inicio <- "2023-01-01"
#' data_fim <- "2023-12-01"
#' df_reunioes <- info_dados_reuniao_comissao(codcol, data_inicio, data_fim)
info_dados_reuniao_comissao <- function(codcol, data_inicio, data_fim) {
  # Carregar os pacotes necessários
  library(rvest)
  library(dplyr)
  library(glue)

  all_data <- list()

  for (i in seq_along(codcol)) {
    # Construir a URL com base nos parâmetros fornecidos
    url <- glue::glue("https://legis.senado.leg.br/comissoes/comissao?codcol={codcol[i]}&data1={data_inicio}&data2={data_fim}")

    # Ler o conteúdo da página
    pagina <- read_html(as.character(url))

    # Extrair informações do código HTML
    informacoes <- pagina %>%
      html_elements("div.ajuste-resultado-agenda") %>%
      html_text()

    # link da reuniao e comissao
    links <- pagina %>%
      html_elements("div.ajuste-resultado-agenda > div > h6 > strong > a") %>%
      html_attr("href") %>%
      unique()

    # demais informações
    link_video <- pagina %>% html_elements("span.glyphicon-facetime-video") %>% html_attr("title")
    horarios <- pagina %>% html_elements("h6.texto-com-reticencias strong span") %>% html_text()
    tipos_reunioes <- pagina %>% html_elements("div.f2") %>% html_text()
    locais <- pagina %>% html_elements("div.f0") %>% html_text()
    status <- pagina %>% html_elements("div.status-comissao span.situacao-realizada") %>% html_text()

    # Determine o comprimento máximo
    max_length <- max(length(informacoes), length(links), length(link_video), length(horarios), length(tipos_reunioes), length(locais), length(status))

    # Preencha os vetores com as informações extraídas do HTML
    informacoes <- rep(informacoes, length.out = max_length)
    links <- rep(links, length.out = max_length)
    link_video <- rep(link_video, length.out = max_length)
    horarios <- rep(horarios, length.out = max_length)
    tipos_reunioes <- rep(tipos_reunioes, length.out = max_length)
    locais <- rep(locais, length.out = max_length)
    status <- rep(status, length.out = max_length)

    # Extrair códigos de reunião e comissão dos links
    cod_reuniao <- gsub(".*reuniao=(\\d+).*", "\\1", links)
    cod_comissao <- gsub(".*codcol=(\\d+).*", "\\1", links)

    # Combine os vetores em um dataframe
    comissao_data <- data.frame(
      Informacoes = informacoes,
      Link_reuniao = links,
      Cod_reuniao = cod_reuniao,
      Cod_comissao = cod_comissao,
      LinkVideo = link_video,
      Horarios = horarios,
      TipoReunioes = tipos_reunioes,
      Locais = locais,
      Status = status, stringsAsFactors = FALSE
    )

    # Armazene os dados na lista
    all_data[[i]] <- comissao_data
  }

  # Combine todos os dataframes em um único dataframe
  data_comissao <- do.call(rbind, all_data)

  return(data_comissao)
}

