#' Coletar Medidas Provisórias em Tramitação
#'
#' Esta função coleta dados sobre medidas provisórias em tramitação do site do Congresso Nacional do Brasil.
#'
#' @return Um dataframe contendo informações sobre medidas provisórias em tramitação.
#' O dataframe possui as seguintes colunas:
#' \describe{
#'   \item{Link}{Link para acessar mais informações sobre a medida provisória.}
#'   \item{Matéria}{Título da medida provisória.}
#'   \item{Ementa}{Resumo ou descrição da medida provisória.}
#'   \item{Prazo}{Prazo de vigência da medida provisória, especificando os prazos de 60 e 120 dias.}
#'   \item{Status}{Status da medida provisória, indicando se está em tramitação.}
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
#' @examples
#' mpv_em_tramitacao <- coletar_medidas_provisorias_em_tramitacao()

coletar_medidas_provisorias_em_tramitacao <- function() {
  # Função para raspar os dados das matérias em tramitação
  raspar_dados_em_tramitacao <- function(url) {
    # Ler HTML
    tryCatch({
      pagina <- read_html(url)

      # Selecionar os elementos desejados
      resumos <- pagina %>% html_nodes(".sf-lista-resumos__resumo")

      # Inicializar listas para armazenar os dados
      links <- c()
      materias <- c()
      ementas <- c()
      prazos <- c()

      # Iterar sobre os resumos para extrair os dados
      for (resumo in resumos) {
        # Link da matéria
        link <- resumo %>% html_node("dt:contains('Matéria') + dd a") %>% html_attr("href")
        links <- c(links, link)

        # Matéria
        materia <- resumo %>% html_node("dt:contains('Matéria') + dd a") %>% html_text() %>% trimws()
        materias <- c(materias, materia)

        # Ementa
        ementa <- resumo %>% html_node("dt:contains('Ementa') + dd") %>% html_text() %>% trimws()
        ementas <- c(ementas, ementa)

        # Prazo de 60 dias
        prazo_60 <- resumo %>% html_node("dt:contains('Prazo de 60 dias') + dd") %>% html_text() %>% trimws()

        # Prazo de 120 dias
        prazo_120 <- resumo %>% html_node("dt:contains('Prazo de 120 dias') + dd") %>% html_text() %>% trimws()

        prazos <- c(prazos, paste(prazo_60, prazo_120, sep = " - "))
      }

      # Criar dataframe com os dados
      dados <- data.frame(Link = links,
                          Matéria = materias,
                          Ementa = ementas,
                          Prazo = prazos) %>%
        mutate(Status = "em tramitação")

      return(dados)
    }, error = function(e) {
      cat("Erro ao acessar a URL:", url, "\n")
      cat("Mensagem de erro:", conditionMessage(e), "\n")
      return(NULL)
    })
  }

  # URL para as MPs em trâmite
  url_mpv_em_tramitacao <- "https://www.congressonacional.leg.br/materias/medidas-provisorias/-/mpv/"

  # Raspar dados das MPs em tramitação
  dados_mpv_em_tramitacao <- raspar_dados_em_tramitacao(url_mpv_em_tramitacao)

  return(dados_mpv_em_tramitacao)
}




