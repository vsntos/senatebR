#' Raspar os dados da agenda para várias datas
#'
#' Esta função raspa os dados da agenda de uma página da web para várias datas e
#' combina os resultados em um único dataframe.
#'
#' @param anos Vetor contendo os anos desejados.
#' @param meses Vetor contendo os meses desejados.
#' @param dias Vetor contendo os dias desejados.
#' @return Um dataframe contendo os dados da agenda para as datas especificadas.
#' @export
#'
#' @importFrom rvest read_html html_nodes html_node html_text trimws
#' @import dplyr
#' @import readr
#'
#' @examples
#' \dontrun{
#' # Extrair informações da agenda para os anos de 2023 e 2024, para os meses de janeiro e fevereiro, e para os dias de 10 a 15
#' resultado <- info_agenda(anos = c(2023, 2024), meses = c(1, 2), dias = 10:15)
#' }
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
          linhas <- pagina %>% html_nodes(".cn-agenda-casas-tabela-linha")
          horas <- c()
          orgaos <- c()
          eventos <- c()
          locais <- c()
          status <- c()
          for (linha in linhas) {
            hora <- linha %>% html_node(".cn-agenda-casas-hora") %>% html_text() %>% trimws()
            horas <- c(horas, hora)
            orgao <- linha %>% html_node(".cn-agenda-casas-orgao") %>% html_text() %>% trimws()
            orgaos <- c(orgaos, orgao)
            evento <- linha %>% html_node("a") %>% html_text() %>% trimws()
            eventos <- c(eventos, evento)
            local <- linha %>% html_nodes("em") %>% html_text() %>% trimws()
            locais <- c(locais, local)
            estado <- linha %>% html_nodes(".cn-agenda-casas-tabela-celula") %>% html_text() %>% trimws() %>% tail(1)
            status <- c(status, estado)
          }
          dados[[data]] <- data.frame(Data = data,
                                      Hora = horas,
                                      Orgao = orgaos,
                                      Evento = eventos,
                                      Local = locais,
                                      Status = status,
                                      stringsAsFactors = FALSE)
        }, error = function(e) {
          cat("Erro ao raspar dados para", data, ":", conditionMessage(e), "\n")
        })
      }
    }
  }
  df_agenda <- do.call(rbind, dados)
  df_agenda
}




