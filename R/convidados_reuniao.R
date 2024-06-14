#' Extrair dados dos convidados de reuniões do Senado
#'
#' Esta função extrai dados dos convidados de reuniões do Senado Federal
#' com base nos códigos fornecidos e os empilha em um único DataFrame.
#'
#' @param codigos_reunioes Vetor contendo os códigos das reuniões
#' @return Um DataFrame com os dados dos convidados de todas as reuniões empilhados
#' @export
convidados_reuniao <- function(codigos_reunioes) {
  # Carregar os pacotes necessários
  library(xml2)
  library(dplyr)

  # Função para extrair texto de um nó XML
  extract_text <- function(node, xpath) {
    xml_text(xml_find_first(node, xpath))
  }

  # Função para extrair os dados dos convidados de uma reunião com base em seu código
  extract_meeting_guests_data <- function(codigo_reuniao) {
    # URL do XML
    url <- paste0("https://legis.senado.leg.br/dadosabertos/reuniaocomissao/", codigo_reuniao)

    # Carregar o arquivo XML diretamente do URL
    xml_file <- read_xml(url)

    # Extrair dados dos convidados
    convidados <- xml_find_all(xml_file, "//convidados")
    convidados_data <- lapply(convidados, function(convidado) {
      list(
        codigo_reuniao = extract_text(xml_file, "//reuniao/codigo"),
        codigo_convidado = extract_text(convidado, "codigo"),
        nome = extract_text(convidado, "nome"),
        cargo = extract_text(convidado, "cargo"),
        tratamento = extract_text(convidado, "tratamento")
      )
    })

    # Criar o DataFrame dos convidados
    convidados_df <- do.call(rbind, lapply(convidados_data, function(x) data.frame(t(x), stringsAsFactors = FALSE)))

    return(convidados_df)
  }

  # Extrair os dados dos convidados de todas as reuniões
  all_guests_data <- lapply(codigos_reunioes, extract_meeting_guests_data)

  # Empilhar os DataFrames dos convidados em um único DataFrame
  result_df <- bind_rows(all_guests_data)

  return(result_df)
}
