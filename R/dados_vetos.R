#' Função para extrair os dados de várias URLs
#'
#' Esta função realiza o scraping de várias páginas HTML contendo informações sobre vetos do Congresso Nacional
#' e extrai os dados dos itens vetados.
#'
#' @param urls Um vetor de URLs das páginas a serem analisadas.
#' @return Um dataframe contendo os dados extraídos de todas as URLs fornecidas.
#' Se não houver tabela em alguma das páginas, retorna uma mensagem de aviso.
#' @export
#'
#' @examples
#' urls <- c("https://www.congressonacional.leg.br/materias/vetos/-/veto/detalhe/16110",
#'           "https://www.congressonacional.leg.br/materias/vetos/-/veto/detalhe/16049",
#'           "https://www.congressonacional.leg.br/materias/vetos/-/veto/detalhe/16029")
#' dados <- dados_vetos(urls)
dados_vetos <- function(urls) {
  # Inicializar um dataframe vazio para armazenar os resultados
  dados_finais <- data.frame()

  # Iterar sobre as URLs e extrair os dados de cada uma
  for (url in urls) {
    # Realizar o scraping da página
    pagina <- rvest::read_html(url)

    # Extrair a tabela de partes vetadas
    tabela <- pagina %>% rvest::html_node(".cn-detalhe-veto--partes-vetadas") %>% rvest::html_table()

    # Se houver tabela, converter para dataframe e adicionar o código do veto
    if (length(tabela) > 0) {
      dados <- data.frame(tabela)
      codigo_veto <- gsub(".*\\/([0-9]+)$", "\\1", url)
      dados$Codigo_Veto <- codigo_veto

      # Adicionar os dados ao dataframe final
      dados_finais <- dplyr::bind_rows(dados_finais, dados)
    } else {
      # Se não houver tabela, imprimir mensagem de aviso
      cat("Nenhuma tabela encontrada para a URL:", url, "\n")
    }
  }

  return(dados_finais)
}




