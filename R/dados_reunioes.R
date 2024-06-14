#' @import httr
#' @import jsonlite
#' @import dplyr
#' Coletar dados das reuniões
#'
#' Esta função coleta dados de várias reuniões específicas no Senado.
#'
#' @param codigos_reuniao Vetor de códigos das reuniões a serem coletadas.
#' @return Um dataframe contendo os dados consolidados das reuniões.
#' @export
#'
#' @examples
#' dados_reuniao <- coletar_dados_reuniao(c("12603", "12604"))
coletar_dados_reuniao <- function(codigos_reuniao) {
  consolidado_reuniao <- data.frame()

  for (codigo_reuniao in codigos_reuniao) {
    # Construa a URL da reunião específica
    url_reuniao <- paste0("https://legis.senado.leg.br/dadosabertos/reuniaocomissao/", codigo_reuniao)

    # Faça a requisição GET
    response <- GET(url_reuniao, add_headers(accept = "application/json"))

    # Verifique se a requisição foi bem-sucedida (código de status na faixa 2xx)
    if (status_code(response) >= 200 && status_code(response) < 300) {
      # Leia os dados JSON da resposta
      json_data <- fromJSON(content(response, "text"))

      # Extraia os dataframes
      df_reuniao_codigo <- safe_rename(as.data.frame(json_data$DetalheReuniao$reuniao$codigo), ".", "codigo")
      df_reuniao_descricao <- safe_rename(as.data.frame(json_data$DetalheReuniao$reuniao$descricao), ".", "descricao")
      df_reuniao_titulo <- safe_rename(as.data.frame(json_data$DetalheReuniao$reuniao$titulo), ".", "titulo")
      df_reuniao_info <- safe_rename(as.data.frame(json_data$DetalheReuniao$reuniao$informacao), ".", "info")
      df_reuniao_situ <- safe_rename(as.data.frame(json_data$DetalheReuniao$reuniao$situacao), ".", "situacao")
      df_reuniao_local <- safe_rename(as.data.frame(json_data$DetalheReuniao$reuniao$local), ".", "local")
      df_reuniao_pauta_simples <- safe_rename(as.data.frame(json_data$DetalheReuniao$reuniao$urlUltimaPautaSimplesPublicada), ".", "urlUltimaPautaSimplesPublicada")
      df_reuniao_pauta_cheia <- safe_rename(as.data.frame(json_data$DetalheReuniao$reuniao$urlUltimaPautaCheiaPublicada), ".", "urlUltimaPautaCheiaPublicada")
      df_reuniao_pauta_resultado <- safe_rename(as.data.frame(json_data$DetalheReuniao$reuniao$urlUltimoResultadoPublicado), ".", "urlUltimoResultadoPublicado")

      df_reuniao_presidente <- json_data$DetalheReuniao$reuniao$presidente %>%
        as.data.frame() %>%
        rename(codigo_presidente = codigo, nome_presidente = nome)

      df_reuniao_colegiado_criador <- json_data$DetalheReuniao$reuniao$colegiadoCriador %>%
        as.data.frame() %>%
        rename(codigo_colegiado = codigo, nome_colegiado = nome)

      df_reuniao_tipo <- json_data$DetalheReuniao$reuniao$tipo %>%
        as.data.frame() %>%
        rename(codigo_tipo = codigo)

      df_reuniao_sessao_legis <- json_data$DetalheReuniao$reuniao$sessaoLegislativa %>%
        as.data.frame() %>%
        rename(codigo_legislatura = codigo)

      df_reuniao_sessao_videos <- json_data$DetalheReuniao$reuniao$videos %>%
        as.data.frame() %>%
        rename(codigo_video = codigo, url_video = url)


      consolidado_reuniao <- bind_rows(consolidado_reuniao, cbind(df_reuniao_codigo, df_reuniao_descricao, df_reuniao_titulo,
                                                                  df_reuniao_info, df_reuniao_situ, df_reuniao_local, df_reuniao_pauta_simples,
                                                                  df_reuniao_pauta_cheia, df_reuniao_pauta_resultado, df_reuniao_presidente,
                                                                  df_reuniao_colegiado_criador, df_reuniao_tipo, df_reuniao_sessao_legis, df_reuniao_sessao_videos))
    } else {
      # Se a requisição falhar, imprima uma mensagem de erro
      stop("Falha na requisição. Código de status: ", status_code(response))
    }
  }

  return(consolidado_reuniao)
}




