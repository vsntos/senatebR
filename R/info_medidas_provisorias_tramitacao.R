#' Coletar Medidas Provis\u00f3rias em Tramita\u00e7\u00e3o
#'
#' Esta fun\u00e7\u00e3o coleta dados sobre medidas provis\u00f3rias em tramita\u00e7\u00e3o do site do Congresso Nacional do Brasil.
#'
#' @return Um dataframe contendo informa\u00e7\u00f5es sobre medidas provis\u00f3rias em tramita\u00e7\u00e3o.
#' O dataframe possui as seguintes colunas:
#' \describe{
#'   \item{Link}{Link para acessar mais informa\u00e7\u00f5es sobre a medida provis\u00f3ria.}
#'   \item{Mat\u00e9ria}{T\u00edtulo da medida provis\u00f3ria.}
#'   \item{Ementa}{Resumo ou descri\u00e7\u00e3o da medida provis\u00f3ria.}
#'   \item{Prazo}{Prazo de vig\u00eancia da medida provis\u00f3ria, especificando os prazos de 60 e 120 dias.}
#'   \item{Status}{Status da medida provis\u00f3ria, indicando se est\u00e1 em tramita\u00e7\u00e3o.}
#' }
#'
#' @export
#'
#' @import rvest
#' @import dplyr
#' @importFrom magrittr %>%
#' @importFrom rvest read_html html_nodes html_node html_text html_attr
#' @importFrom stringr str_trim
#'
coletar_medidas_provisorias_em_tramitacao <- function() {
  # Fun\u00e7\u00e3o interna para raspar os dados das mat\u00e9rias em tramita\u00e7\u00e3o
  raspar_dados_em_tramitacao <- function(url) {
    # Inicializar listas para armazenar os dados
    links <- character(0)
    materias <- character(0)
    ementas <- character(0)
    prazos <- character(0)

    # Tenta acessar a p\u00e1gina e extrair os dados
    tryCatch({
      pagina <- read_html(url)

      # Selecionar os elementos desejados
      resumos <- pagina %>% html_nodes(".sf-lista-resumos__resumo")

      # Iterar sobre os resumos para extrair os dados
      for (resumo in resumos) {
        # Link da mat\u00e9ria
        link <- resumo %>% html_node("dt:contains('Mat\u00e9ria') + dd a") %>% html_attr("href")
        links <- c(links, link)

        # Mat\u00e9ria
        materia <- resumo %>% html_node("dt:contains('Mat\u00e9ria') + dd a") %>% html_text() %>% str_trim()
        materias <- c(materias, materia)

        # Ementa
        ementa <- resumo %>% html_node("dt:contains('Ementa') + dd") %>% html_text() %>% str_trim()
        ementas <- c(ementas, ementa)

        # Prazo de 60 dias
        prazo_60 <- resumo %>% html_node("dt:contains('Prazo de 60 dias') + dd") %>% html_text() %>% str_trim()

        # Prazo de 120 dias
        prazo_120 <- resumo %>% html_node("dt:contains('Prazo de 120 dias') + dd") %>% html_text() %>% str_trim()

        prazos <- c(prazos, paste(prazo_60, prazo_120, sep = " - "))
      }

      # Criar dataframe com os dados
      dados <- data.frame(
        Link = links,
        Matéria = materias,
        Ementa = ementas,
        Prazo = prazos,
        Status = "em tramita\u00e7\u00e3o",
        stringsAsFactors = FALSE
      )

      return(dados)

    }, error = function(e) {
      cat("Erro ao acessar a URL:", url, "\n")
      cat("Mensagem de erro:", conditionMessage(e), "\n")
      return(NULL)
    })
  }

  # URL para as MPs em tr\u00e2mite
  url_mpv_em_tramitacao <- "https://www.congressonacional.leg.br/materias/medidas-provisorias/-/mpv/"

  # Raspar dados das MPs em tramita\u00e7\u00e3o
  dados_mpv_em_tramitacao <- raspar_dados_em_tramitacao(url_mpv_em_tramitacao)

  return(dados_mpv_em_tramitacao)
}




