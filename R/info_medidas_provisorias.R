#' Coletar Medidas Provisórias
#'
#' Esta função coleta dados sobre medidas provisórias em andamento e encerradas
#' do site do Congresso Nacional do Brasil.
#'
#' @param inicio_pagina Número da primeira página a ser coletada
#' @param fim_pagina Número da última página a ser coletada
#'
#' @return Um dataframe com dados sobre medidas provisórias em andamento e encerradas
#' @export
#'
#' @import rvest
#' @import dplyr
#' @importFrom magrittr %>%
#' @importFrom rvest read_html html_nodes html_node html_text html_attr
#' @importFrom stringr str_trim
#'
#' @examples
#' mpv_data <- medidas_provisorias(1, 3)

medidas_provisorias <- function(inicio_pagina, fim_pagina) {
  # Função para raspar os dados das matérias
  raspar_dados <- function(url) {
    # Ler HTML
    pagina <- read_html(url)

    # Selecionar os elementos desejados
    resumos <- html_nodes(pagina, ".sf-lista-resumos__resumo")

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
      materia <- resumo %>% html_node("dt:contains('Matéria') + dd a") %>% html_text() %>% str_trim()
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
    dados <- data.frame(Link = links,
                        Matéria = materias,
                        Ementa = ementas,
                        Prazo = prazos) %>%
      mutate(status = "em tramitação")

    return(dados)
  }

  # Função para raspar os dados de várias páginas
  raspar_dados_varias_paginas <- function(inicio_pagina, fim_pagina) {
    # Inicializar listas para armazenar os dados
    links <- c()
    materias <- c()
    ementas <- c()
    prazos <- c()

    # Loop sobre as páginas
    for (num_pagina in inicio_pagina:fim_pagina) {
      # Construir a URL da página atual
      url_pagina <- paste0("https://www.congressonacional.leg.br/materias/medidas-provisorias/-/mpv/", num_pagina)

      # Ler HTML
      pagina <- read_html(url_pagina)

      # Selecionar os elementos desejados
      resumos <- html_nodes(pagina, ".sf-lista-resumos__resumo")

      # Iterar sobre os resumos para extrair os dados
      for (resumo in resumos) {
        # Link da matéria
        link <- resumo %>% html_node("dt:contains('Matéria') + dd a") %>% html_attr("href")
        links <- c(links, link)

        # Matéria
        materia <- resumo %>% html_node("dt:contains('Matéria') + dd a") %>% html_text() %>% str_trim()
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
    }

    # Criar dataframe com os dados
    dados <- data.frame(Link = links,
                        Matéria = materias,
                        Ementa = ementas,
                        Prazo = prazos) %>%
      mutate(status = "encerradas")

    return(dados)
  }

  # URL para as MPs em trâmite
  url_mpv_em_tramitacao <- "https://www.congressonacional.leg.br/materias/medidas-provisorias/-/mpv/"

  # Raspar dados das MPs em trâmite
  dados_mpv_em_tramitacao <- raspar_dados(url_mpv_em_tramitacao)

  # URL base para as MPs encerradas
  url_base_encerradas <- "https://www.congressonacional.leg.br/materias/medidas-provisorias/-/mpv/encerradas"

  # Raspar dados das MPs encerradas
  dados_mpv_encerradas <- raspar_dados_varias_paginas(inicio_pagina, fim_pagina)

  # Combinar os dados das MPs em trâmite e encerradas
  dados_mpv <- rbind(dados_mpv_em_tramitacao, dados_mpv_encerradas)

  return(dados_mpv)
}

