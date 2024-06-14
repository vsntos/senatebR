#' Função para extrair os dados de várias URLs
#'
#' Esta função realiza o scraping de várias páginas HTML contendo informações sobre vetos do Congresso Nacional
#' e extrai os dados da tabela de partes vetadas.
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
#' dados <- extrair_detalhes_vetos(urls)
#'
extrair_detalhes_vetos <- function(urls) {
  # Inicializar um dataframe vazio para armazenar os resultados
  dados_finais <- data.frame()

  # Iterar sobre as URLs e extrair os dados de cada uma
  for (url in urls) {
    # Realizar o scraping da página
    pagina <- read_html(url)

    # Tentar extrair a tabela de partes vetadas
    tabela <- try(html_table(pagina %>% html_node(".cn-detalhe-veto--partes-vetadas")), silent = TRUE)

    # Se a tabela foi extraída com sucesso, adicionar ao dataframe final
    if (!inherits(tabela, "try-error")) {
      codigo_veto <- gsub(".*\\/([0-9]+)$", "\\1", url)
      tabela$Codigo_Veto <- codigo_veto
      dados_finais <- data.frame(dados_finais, tabela)
    } else {
      # Se não houver tabela, imprimir mensagem de aviso
      cat("Nenhuma tabela encontrada para a URL:", url, "\n")
    }
  }

  return(dados_finais)
}
