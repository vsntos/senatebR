#' Extrai o conteúdo de uma página de notas taquigráficas.
#'
#' Esta função acessa uma página de notas taquigráficas do Senado Federal
#' e extrai o conteúdo da mesma.
#'
#' @param codigos_reuniao Vetor de códigos das reuniões para acessar as páginas de notas.
#'
#' @return Um dataframe contendo os códigos de reunião e os respectivos conteúdos das páginas de notas, ou NULL se ocorrer um erro.
#'
#' @examples
#' codigos <- c(12071, 12072, 12073)
#' df_conteudos <- extrair_notas_taquigraficas(codigos)
#'
#'
#' @import rvest
#' @importFrom rvest read_html html_nodes html_text
#' @export
extrair_notas_taquigraficas <- function(codigos_reuniao) {
  # Verificar se o vetor de códigos de reunião está vazio
  if (length(codigos_reuniao) == 0) {
    stop("O vetor de códigos de reunião está vazio.")
  }

  # Inicializar um dataframe vazio para armazenar os resultados
  df_conteudos <- data.frame(Codigo_Reuniao = numeric(0), Conteudo = character(0), stringsAsFactors = FALSE)

  # Iterar sobre os códigos de reunião
  for (codigo_reuniao in codigos_reuniao) {
    # Criação da URL
    url_nota_taquigrafica <- paste0("https://www25.senado.leg.br/web/atividade/notas-taquigraficas/-/notas/r/", codigo_reuniao)

    # Tenta acessar a página
    tryCatch({
      # Leitura da página
      pagina <- rvest::read_html(url_nota_taquigrafica)

      # Encontrar todas as tags <div> com class="principalStyle"
      divs <- pagina %>% rvest::html_nodes(".principalStyle")

      # Verificar se há conteúdo na página
      if (length(divs) == 0) {
        cat("Nenhuma nota taquigráfica encontrada para o código de reunião:", codigo_reuniao, "\n")
        next
      }

      # Extrair o texto de cada tag <div> com class="principalStyle"
      textos <- divs %>% rvest::html_text()

      # Combinar os textos em um único texto
      texto_completo <- paste(textos, collapse = " ")

      # Criar um dataframe com o código de reunião e o conteúdo da página de notas
      df_conteudo <- data.frame(Codigo_Reuniao = codigo_reuniao, Conteudo = texto_completo, stringsAsFactors = FALSE)

      # Adicionar o dataframe à lista de dataframes
      df_conteudos <- rbind(df_conteudos, df_conteudo)

    }, error = function(e) {
      # Mensagem de erro detalhada em caso de falha
      cat("Erro ao acessar a URL:", url_nota_taquigrafica, "\n")
      cat("Mensagem de erro:", conditionMessage(e), "\n")
      # Pular para a próxima iteração
      next
    })
  }

  # Verificar se foram encontradas notas taquigráficas
  if (nrow(df_conteudos) == 0) {
    cat("Nenhuma nota taquigráfica encontrada para os códigos de reunião fornecidos.\n")
    return(NULL)
  }

  return(df_conteudos)
}

