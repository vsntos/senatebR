#' Extrair dados da agenda do Congresso Nacional, do Senado Federal e C\u00e2mara dos Deputados
#'
#' Esta fun\u00e7\u00e3o extrai dados da agenda do Congresso Nacional para os anos, meses e dias especificados.
#'
#' @param anos Vetor de anos.
#' @param meses Vetor de meses.
#' @param dias Vetor de dias.
#'
#' @return Um dataframe contendo os dados da agenda do Congresso Nacional.
#'
#' @importFrom rvest read_html html_nodes html_text
#'
#' @examples
#' resultado <- info_agenda(anos = c(2023, 2024), meses = c(1, 2), dias = 10:15)
#'
#' @export
info_agenda <- function(anos, meses, dias) {
  url_base <- "https://www.congressonacional.leg.br/sessoes/agenda-do-congresso-senado-e-camara/-/agenda/"

  # Lista para armazenar os dados
  dados <- list()

  # Fun\u00e7\u00e3o para extrair os dados de uma data espec\u00edfica
  extrair_dados <- function(data) {
    url <- paste0(url_base, data)
    tryCatch({
      pagina <- read_html(url)
      eventos <- pagina %>% html_nodes(".cn-agenda-casas-tabela-linha")

      if (length(eventos) == 0) {
        message("Nenhum evento encontrado para", data)
        return(NULL)
      }

      dados_evento <- eventos %>% purrr::map_dfr(function(evento) {
        hora <- evento %>% html_node(".cn-agenda-casas-hora") %>% html_text()
        orgao <- evento %>% html_node(".cn-agenda-casas-orgao") %>% html_text()
        evento_desc <- evento %>% html_node("strong") %>% html_text()
        local <- evento %>% html_node("em") %>% html_text()
        status <- evento %>% html_nodes(".cn-agenda-casas-tabela-celula") %>% html_text() %>% tail(1)

        data.frame(Data = data,
                   Hora = hora,
                   Orgao = orgao,
                   Evento = evento_desc,
                   Local = local,
                   Status = status,
                   stringsAsFactors = FALSE)
      })

      return(dados_evento)
    }, error = function(e) {
      warning(paste("Erro ao extrair dados para", data, ":", conditionMessage(e)))
      return(NULL)
    })
  }

  # Iterar sobre os anos, meses e dias fornecidos
  for (ano in anos) {
    for (mes in meses) {
      for (dia in dias) {
        data <- sprintf("%04d-%02d-%02d", ano, mes, dia)
        dados_data <- extrair_dados(data)
        if (!is.null(dados_data)) {
          dados[[length(dados) + 1]] <- dados_data
        }
      }
    }
  }

  # Verificar se foram encontrados dados
  if (length(dados) > 0) {
    df_agenda <- do.call(rbind, dados)
    return(df_agenda)
  } else {
    message("Nenhum dado encontrado para os anos, meses e dias especificados.")
    return(NULL)
  }
}



