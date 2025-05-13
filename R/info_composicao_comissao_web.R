#' Extrai dados das comiss\u00f5es de um senador
#'
#' Esta fun\u00e7\u00e3o extrai os dados das comiss\u00f5es de um senador com base no seu c\u00f3digo parlamentar.
#'
#' @param codigo_senador O c\u00f3digo do senador.
#' @return Um data frame contendo os dados das comiss\u00f5es do senador.
#'
#' @examples
#' codigo_senador <- "5008"
#' extrair_dados_comissao_senador(codigo_senador)
#'
#' @import rvest
#' @import magrittr
#' @importFrom stringr str_trim
#'
#' @export
extrair_dados_comissao_senador <- function(codigo_senador) {
  # Fun\u00e7\u00e3o para extrair dados de uma p\u00e1gina
  extrair_dados <- function(url, codigo_parlamentar) {
    # Leia o HTML da p\u00e1gina
    pagina <- read_html(url)

    # Extrair os dados das c\u00e9lulas da tabela
    comissoes <- pagina %>%
      html_nodes("td:nth-child(1)") %>%
      html_text()

    data_inicio <- pagina %>%
      html_nodes("td:nth-child(2)") %>%
      html_text()

    data_fim <- pagina %>%
      html_nodes("td:nth-child(3)") %>%
      html_text()

    tipo <- pagina %>%
      html_nodes("td:nth-child(4)") %>%
      html_text()

    # Limpar os dados
    comissoes <- stringr::str_trim(comissoes)
    data_inicio <- stringr::str_trim(data_inicio)
    data_fim <- stringr::str_trim(data_fim)
    tipo <- stringr::str_trim(tipo)

    # Verificar se os dados est\u00e3o vazios
    if (length(comissoes) == 0 | length(data_inicio) == 0 | length(data_fim) == 0 | length(tipo) == 0) {
      # Se algum dos vetores estiver vazio, retorne um dataframe vazio
      return(data.frame(CodigoParlamentar = character(0),
                        Comissoes = character(0),
                        DataInicio = character(0),
                        DataFim = character(0),
                        Tipo = character(0)))
    }

    # Criar um dataframe com as vari\u00e1veis
    dados <- data.frame(CodigoParlamentar = codigo_parlamentar,
                        Comissoes = comissoes,
                        DataInicio = data_inicio,
                        DataFim = data_fim,
                        Tipo = tipo)

    # Retornar o dataframe
    return(dados)
  }

  # URL base
  url_base <- "https://www25.senado.leg.br/web/senadores/senador/-/perfil/"

  # Construir a URL do senador
  url_senador <- paste0(url_base, codigo_senador, "/comissoes/")

  # Lista para armazenar os dataframes de cada p\u00e1gina
  dados_totais <- list()

  # Iterar sobre todas as p\u00e1ginas
  pagina_atual <- 1
  while (TRUE) {
    # Construir a URL da p\u00e1gina atual
    url_pagina <- paste0(url_senador, pagina_atual)

    # Extrair dados da p\u00e1gina atual
    dados_pagina <- extrair_dados(url_pagina, codigo_senador)

    # Se o dataframe da p\u00e1gina estiver vazio, interrompa o loop
    if (nrow(dados_pagina) == 0) {
      break
    }

    # Adicionar os dados extra\u00eddos \u00e0 lista
    dados_totais[[pagina_atual]] <- dados_pagina

    # Avan\u00e7ar para a pr\u00f3xima p\u00e1gina
    pagina_atual <- pagina_atual + 1
  }

  # Combinar todos os dataframes em um \u00fanico dataframe
  if (length(dados_totais) > 0) {
    dados_completos <- do.call(rbind, dados_totais)
  } else {
    # Se n\u00e3o houver dados, retorne um dataframe vazio
    dados_completos <- data.frame(CodigoParlamentar = character(0),
                                  Comissoes = character(0),
                                  DataInicio = character(0),
                                  DataFim = character(0),
                                  Tipo = character(0))
  }

  # Retornar o dataframe completo
  return(dados_completos)
}




