#' Extrair dados da agenda do Congresso Nacianal, do Senado federal e Câmara dos Deputados
#'
#' Esta função extrai dados da agenda do Congresso Nacional para os anos, meses e dias especificados.
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
info_agenda <- function(anos, meses, dias) {
  url_base <- "https://www.congressonacional.leg.br/sessoes/agenda-do-congresso-senado-e-camara/-/agenda/"
  dados <- list()

  for (ano in anos) {
    for (mes in meses) {
      for (dia in dias) {
        data <- sprintf("%04d-%02d-%02d", ano, mes, dia)
        url <- paste0(url_base, data)
        tryCatch({
          pagina <- read_html(url)
          eventos <- pagina %>% html_nodes(".cn-agenda-casas-tabela-linha")
          if (length(eventos) == 0) {
            cat("processando", data, "\n")
            next
          }
          for (evento in eventos) {
            hora <- evento %>% html_node(".cn-agenda-casas-hora") %>% html_text()
            orgao <- evento %>% html_node(".cn-agenda-casas-orgao") %>% html_text()
            evento_desc <- evento %>% html_node("strong") %>% html_text()
            local <- evento %>% html_node("em") %>% html_text()
            status <- evento %>% html_nodes(".cn-agenda-casas-tabela-celula") %>% html_text() %>% tail(1)

            dados[[length(dados) + 1]] <- data.frame(Data = data,
                                                     Hora = hora,
                                                     Orgao = orgao,
                                                     Evento = evento_desc,
                                                     Local = local,
                                                     Status = status,
                                                     stringsAsFactors = FALSE)
          }
        }, error = function(e) {
          cat("Erro ao raspar dados para", data, ":", conditionMessage(e), "\n")
        })
      }
    }
  }

  if (length(dados) > 0) {
    df_agenda <- do.call(rbind, dados)
    return(df_agenda)
  } else {
    cat("Nenhum dado encontrado para os anos, meses e dias especificados.\n")
    return(NULL)
  }
}


