#' Extrai o conte\u00fado de uma p\u00e1gina de notas taquigr\u00e1ficas.
#'
#' Esta fun\u00e7\u00e3o acessa uma p\u00e1gina de notas taquigr\u00e1ficas do Senado Federal
#' e extrai o conte\u00fado da mesma.
#'
#' @param codigos_reuniao Vetor de c\u00f3digos das reuni\u00f5es para acessar as p\u00e1ginas de notas.
#'
#' @return Um dataframe contendo os c\u00f3digos de reuni\u00e3o e os respectivos conte\u00fados das p\u00e1ginas de notas, ou NULL se ocorrer um erro.
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
  # Verificar se o vetor de c\u00f3digos de reuni\u00e3o est\u00e1 vazio
  if (length(codigos_reuniao) == 0) {
    stop("O vetor de c\u00f3digos de reuni\u00e3o est\u00e1 vazio.")
  }

  # Inicializar um dataframe vazio para armazenar os resultados
  df_conteudos <- data.frame(Codigo_Reuniao = numeric(0), Conteudo = character(0), stringsAsFactors = FALSE)

  # Iterar sobre os c\u00f3digos de reuni\u00e3o
  for (codigo_reuniao in codigos_reuniao) {
    # Cria\u00e7\u00e3o da URL
    url_nota_taquigrafica <- paste0("https://www25.senado.leg.br/web/atividade/notas-taquigraficas/-/notas/r/", codigo_reuniao)

    # Tenta acessar a p\u00e1gina
    tryCatch({
      # Leitura da p\u00e1gina
      pagina <- rvest::read_html(url_nota_taquigrafica)

      # Encontrar todas as tags <div> com class="principalStyle"
      divs <- pagina %>% rvest::html_nodes(".principalStyle")

      # Verificar se h\u00e1 conte\u00fado na p\u00e1gina
      if (length(divs) == 0) {
        cat("Nenhuma nota taquigr\u00e1fica encontrada para o c\u00f3digo de reuni\u00e3o:", codigo_reuniao, "\n")
        next
      }

      # Extrair o texto de cada tag <div> com class="principalStyle"
      textos <- divs %>% rvest::html_text()

      # Combinar os textos em um \u00fanico texto
      texto_completo <- paste(textos, collapse = " ")

      # Criar um dataframe com o c\u00f3digo de reuni\u00e3o e o conte\u00fado da p\u00e1gina de notas
      df_conteudo <- data.frame(Codigo_Reuniao = codigo_reuniao, Conteudo = texto_completo, stringsAsFactors = FALSE)

      # Adicionar o dataframe \u00e0 lista de dataframes
      df_conteudos <- rbind(df_conteudos, df_conteudo)

    }, error = function(e) {
      # Mensagem de erro detalhada em caso de falha
      cat("Erro ao acessar a URL:", url_nota_taquigrafica, "\n")
      cat("Mensagem de erro:", conditionMessage(e), "\n")
      # Pular para a pr\u00f3xima itera\u00e7\u00e3o
      next
    })
  }

  # Verificar se foram encontradas notas taquigr\u00e1ficas
  if (nrow(df_conteudos) == 0) {
    cat("Nenhuma nota taquigr\u00e1fica encontrada para os c\u00f3digos de reuni\u00e3o fornecidos.\n")
    return(NULL)
  }

  return(df_conteudos)
}

