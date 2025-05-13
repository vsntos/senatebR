#' Coletar Medidas Provis\u00f3rias Encerradas
#'
#' Esta fun\u00e7\u00e3o coleta dados sobre medidas provis\u00f3rias encerradas do site do Congresso Nacional do Brasil.
#'
#' @param numero_ultima_pagina N\u00famero da \u00faltima p\u00e1gina a ser coletada.
#'
#' @return Um dataframe contendo informa\u00e7\u00f5es sobre medidas provis\u00f3rias encerradas.
#' O dataframe possui as seguintes colunas:
#' \describe{
#'   \item{Link}{Link para acessar mais informa\u00e7\u00f5es sobre a medida provis\u00f3ria.}
#'   \item{MPV}{N\u00famero da medida provis\u00f3ria.}
#'   \item{T\u00edtulo}{T\u00edtulo da medida provis\u00f3ria.}
#'   \item{Ementa}{Resumo ou descri\u00e7\u00e3o da medida provis\u00f3ria.}
#'   \item{Prazo de 60 dias}{Data limite para validade da medida provis\u00f3ria.}
#'   \item{Prazo de emendas}{Data limite para submiss\u00e3o de emendas.}
#' }
#'
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

  # Fun\u00e7\u00e3o para raspar os dados de uma p\u00e1gina espec\u00edfica
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
        # N\u00famero da MPV
        numero <- resumo %>% html_node("dd a") %>% html_text()
        links <- c(links, resumo %>% html_node("dd a") %>% html_attr("href"))
        numeros <- c(numeros, numero)

        # T\u00edtulo
        titulo <- resumo %>% html_node(xpath=".//dd[span[text()='T\u00edtulo']]/following-sibling::dd[1]") %>% html_text()
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
        `Prazo de emendas` = prazo_emendas,
        stringsAsFactors = FALSE
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

  # Inicializar lista para armazenar os dataframes de cada p\u00e1gina
  lista_dados <- list()

  # Iterar sobre as p\u00e1ginas e raspar os dados
  for (i in 1:numero_ultima_pagina) {
    url_pagina <- paste0(url_base, i)
    dados_pagina <- raspar_dados_pagina(url_pagina)

    # Adicionar dataframe \u00e0 lista se n\u00e3o for NULL
    if (!is.null(dados_pagina)) {
      lista_dados[[i]] <- dados_pagina
    }
  }

  # Combinar todos os dataframes em um \u00fanico dataframe
  dados_finais <- dplyr::bind_rows(lista_dados)

  return(dados_finais)
}
