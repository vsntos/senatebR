#' Extrai o conteúdo de uma página de notas taquigráficas.
#'
#' Esta função acessa uma página de notas taquigráficas do Senado Federal
#' e extrai o conteúdo da mesma.
#'
#' @param codigo_reuniao Código da reunião para acessar a página de notas.
#'
#' @return Uma string contendo o conteúdo da página de notas ou NULL se ocorrer um erro.
#'
#' @examples
#' \dontrun{
#' conteudo <- extrair_notas_taquigraficas(12071)
#' }
#'@import rvest
#' @export
extrair_notas_taquigraficas <- function(codigo_reuniao) {
  # Criação da URL
  url_nota_taquigrafica <- paste0("https://www25.senado.leg.br/web/atividade/notas-taquigraficas/-/notas/r/", codigo_reuniao)

  # Tenta acessar a página
  tryCatch({
    # Leitura da página
    pagina <- read_html(url_nota_taquigrafica)

    # Encontrar todas as tags <div> com class="principalStyle"
    divs <- pagina %>% html_elements(".principalStyle")

    # Extrair o texto de cada tag <div> com class="principalStyle"
    textos <- divs %>% html_text()

    # Combinar os textos em um único texto
    texto_completo <- paste(textos, collapse = " ")

  }, error = function(e) {
    cat("Erro ao acessar a URL:", url_nota_taquigrafica, "\n")
    cat("Mensagem de erro:", conditionMessage(e), "\n")
    return(NULL)
  })
}
