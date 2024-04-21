#' Extrai dados das comissões de um senador
#'
#' Esta função extrai os dados das comissões de um senador com base no seu código parlamentar.
#'
#' @param codigo_senador O código do senador.
#' @return Um data frame contendo os dados das comissões do senador.
#' @export
#'
#' @examples
#' \dontrun{
#' codigo_senador <- "5008"
#' extrair_dados_comissao_senador(codigo_senador)
#' }
#'
#' @import rvest
#' @import magrittr
#' @importFrom stringr str_trim
extrair_dados_comissao_senador <- function(codigo_senador) {
  # Função para extrair dados de uma página
  extrair_dados <- function(url, codigo_parlamentar) {
    # Leia o HTML da página
    pagina <- read_html(url)

    # Extrair os dados das células da tabela
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
    comissoes <- str_trim(comissoes)
    data_inicio <- str_trim(data_inicio)
    data_fim <- str_trim(data_fim)
    tipo <- str_trim(tipo)

    # Verificar se os dados estão vazios
    if (length(comissoes) == 0 | length(data_inicio) == 0 | length(data_fim) == 0 | length(tipo) == 0) {
      # Se algum dos vetores estiver vazio, retorne um dataframe vazio
      return(data.frame(CodigoParlamentar = character(0),
                        Comissoes = character(0),
                        DataInicio = character(0),
                        DataFim = character(0),
                        Tipo = character(0)))
    }

    # Criar um dataframe com as variáveis
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

  # Lista para armazenar os dataframes de cada página
  dados_totais <- list()

  # Iterar sobre todas as páginas
  pagina_atual <- 1
  while (TRUE) {
    # Construir a URL da página atual
    url_pagina <- paste0(url_senador, pagina_atual)

    # Extrair dados da página atual
    dados_pagina <- extrair_dados(url_pagina, codigo_senador)

    # Se o dataframe da página estiver vazio, interrompa o loop
    if (nrow(dados_pagina) == 0) {
      break
    }

    # Adicionar os dados extraídos à lista
    dados_totais[[pagina_atual]] <- dados_pagina

    # Avançar para a próxima página
    pagina_atual <- pagina_atual + 1
  }

  # Combinar todos os dataframes em um único dataframe
  dados_completos <- do.call(rbind, dados_totais)

  # Retornar o dataframe completo
  return(dados_completos)
}



