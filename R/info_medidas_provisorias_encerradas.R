#' Coletar Medidas Provisórias Encerradas
#'
#' Esta função coleta dados sobre medidas provisórias encerradas do site do Congresso Nacional do Brasil.
#'
#' @param numero_ultima_pagina Número da última página a ser coletada.
#'
#' @return Um dataframe contendo informações sobre medidas provisórias encerradas.
#' O dataframe possui as seguintes colunas:
#' \describe{
#'   \item{Link}{Link para acessar mais informações sobre a medida provisória.}
#'   \item{MPV}{Número da medida provisória.}
#'   \item{Título}{Título da medida provisória.}
#'   \item{Ementa}{Resumo ou descrição da medida provisória.}
#'   \item{Prazo de 60 dias}{Data limite para validade da medida provisória.}
#'   \item{Prazo de emendas}{Data limite para submissão de emendas.}
#' }
#'
#' @examples
#' numero_ultima_pagina <- 364
#' mpv_encerradas <- coletar_medidas_provisorias_encerradas(numero_ultima_pagina)
#'
#' @import rvest
#' @import dplyr
#' @importFrom magrittr %>%
#' @importFrom rvest read_html html_nodes html_node html_text html_attr
#' @importFrom stringr str_trim
#'
#' @export
#'
#' @seealso
#' \code{\link{coletar_medidas_provisorias_em_tramitacao}}
#'
#' @references
#' Site do Congresso Nacional do Brasil: \url{https://www.congressonacional.leg.br}
#'
coletar_medidas_provisorias_encerradas <- function(numero_ultima_pagina) {

  # Função para raspar os dados de uma página específica
  raspar_dados_pagina <- function(url_pagina) {
    tryCatch({
      pagina <- read_html(url_pagina)

      # Selecionar os elementos desejados
      resumos <- pagina %>% html_nodes("dl.dl-horizontal-mpv")

      # Inicializar listas para armazenar os dados
      links <- character()
      numeros <- character()
      titulos <- character()
      ementas <- character()
      prazo_60_dias <- character()
      prazo_emendas <- character()

      # Iterar sobre os resumos para extrair os dados
      for (resumo in resumos) {
        # Número da MPV
        numero <- resumo %>% html_node("dd a") %>% html_text()
        links <- c(links, resumo %>% html_node("dd a") %>% html_attr("href"))
        numeros <- c(numeros, numero)

        # Título
        titulo <- resumo %>% html_node(xpath=".//dd[span[text()='Título']]/following-sibling::dd[1]") %>% html_text()
        titulos <- c(titulos, titulo)

        # Ementa
        ementa <- resumo %>% html_node(xpath=".//dt[text()='Ementa']/following-sibling::dd[1]") %>% html_text()
        ementas <- c(ementas, ementa)

        # Prazo de 60 dias
        prazo_60 <- resumo %>% html_node(xpath=".//dt[text()='Prazo de 60 dias']/following-sibling::dd[1]") %>% html_text()
        prazo_60_dias <- c(prazo_60_dias, prazo_60)

        # Prazo de emendas
        prazo_emenda <- resumo %>% html_node(xpath=".//dt[text()='Prazo de emendas']/following-sibling::dd[1]") %>% html_text()
        prazo_emendas <- c(prazo_emendas, prazo_emenda)
      }

      # Criar dataframe com os dados
      dados_pagina <- data.frame(
        Link = links,
        MPV = numeros,
        Título = titulos,
        Ementa = ementas,
        `Prazo de 60 dias` = prazo_60_dias,
        `Prazo de emendas` = prazo_emendas
      )

      return(dados_pagina)
    }, error = function(e) {
      cat("Erro ao acessar a URL:", url_pagina, "\n")
      cat("Mensagem de erro:", conditionMessage(e), "\n")
      return(NULL)
    })
  }

  # URL base para as MPs encerradas
  url_base <- "https://www.congressonacional.leg.br/materias/medidas-provisorias/-/mpv/encerradas/"

  # Inicializar lista para armazenar os dataframes de cada página
  lista_dados <- list()

  # Iterar sobre as páginas e raspar os dados
  for (i in 1:numero_ultima_pagina) {
    url_pagina <- paste0(url_base, i)
    dados_pagina <- raspar_dados_pagina(url_pagina)

    # Adicionar dataframe à lista
    if (!is.null(dados_pagina)) {
      lista_dados[[i]] <- dados_pagina
    }
  }

  # Combinar todos os dataframes em um único dataframe
  dados_finais <- dplyr::bind_rows(lista_dados)

  return(dados_finais)
}
